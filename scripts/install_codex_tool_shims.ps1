$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'tool-paths.ps1')

$shimDir = Join-Path $env:USERPROFILE '.local\bin'
$shimTargets = [ordered]@{
  git = Resolve-ToolPath 'git'
  python = Resolve-ToolPath 'python'
  py = Resolve-ToolPath 'python'
  powershell = Resolve-ToolPath 'powershell'
  where = Resolve-ToolPath 'where'
  reg = Resolve-ToolPath 'reg'
  pdflatex = Resolve-ToolPath 'pdflatex'
  xelatex = Resolve-ToolPath 'xelatex'
}

function Get-NormalizedPathEntry {
  param(
    [Parameter(Mandatory)]
    [string]$PathEntry
  )

  $expanded = [Environment]::ExpandEnvironmentVariables($PathEntry.Trim())
  return $expanded.TrimEnd('\')
}

function Set-UserPathEntries {
  param(
    [Parameter(Mandatory)]
    [string[]]$AdditionalEntries
  )

  $environmentKey = [Microsoft.Win32.Registry]::CurrentUser.OpenSubKey('Environment', $true)
  if ($null -eq $environmentKey) {
    throw 'Could not open HKCU\Environment for writing.'
  }

  $currentValue = $environmentKey.GetValue('Path', '', [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
  $orderedEntries = [System.Collections.Generic.List[string]]::new()
  $seenEntries = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

  foreach ($entry in ($currentValue -split ';')) {
    if (-not $entry) {
      continue
    }

    $normalized = Get-NormalizedPathEntry $entry
    if ($normalized -and $seenEntries.Add($normalized)) {
      [void]$orderedEntries.Add($entry.Trim())
    }
  }

  foreach ($entry in $AdditionalEntries) {
    if (-not $entry) {
      continue
    }

    if (-not (Test-Path $entry)) {
      continue
    }

    $normalized = Get-NormalizedPathEntry $entry
    if ($normalized -and $seenEntries.Add($normalized)) {
      [void]$orderedEntries.Add($entry)
    }
  }

  $newValue = ($orderedEntries -join ';')
  $environmentKey.SetValue('Path', $newValue, [Microsoft.Win32.RegistryValueKind]::ExpandString)
  $environmentKey.Close()
  return $newValue
}

function Write-CmdShim {
  param(
    [Parameter(Mandatory)]
    [string]$Name,

    [Parameter(Mandatory)]
    [string]$TargetPath
  )

  $shimPath = Join-Path $shimDir "$Name.cmd"
  $shimContent = @(
    '@echo off'
    "`"$TargetPath`" %*"
  ) -join [Environment]::NewLine

  Set-Content -LiteralPath $shimPath -Value $shimContent -Encoding ASCII
  return $shimPath
}

New-Item -ItemType Directory -Force -Path $shimDir | Out-Null

$writtenShims = foreach ($shim in $shimTargets.GetEnumerator()) {
  Write-CmdShim -Name $shim.Key -TargetPath $shim.Value
}

$desiredUserPathEntries = @(
  '%USERPROFILE%\.local\bin'
  '%USERPROFILE%\AppData\Local\Microsoft\WindowsApps'
  '%USERPROFILE%\AppData\Local\Programs\MiKTeX\miktex\bin\x64'
  '%USERPROFILE%\AppData\Roaming\npm'
) + (Get-AgentPathEntries)

$updatedUserPath = Set-UserPathEntries -AdditionalEntries $desiredUserPathEntries

Write-Output 'Installed Codex tool shims:'
$writtenShims | ForEach-Object { Write-Output "  $_" }

Write-Output ''
Write-Output 'Updated user PATH:'
Write-Output $updatedUserPath

Write-Output ''
Write-Output 'Restart Codex to ensure new shells inherit the updated user PATH.'
