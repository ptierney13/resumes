$script:StaticToolCandidates = @{
  pdflatex = @(
    (Join-Path $env:LOCALAPPDATA 'Programs\MiKTeX\miktex\bin\x64\pdflatex.exe')
  )
}

function Get-ToolCandidates {
  param(
    [Parameter(Mandatory)]
    [string]$Name
  )

  $normalized = $Name.ToLowerInvariant()
  $candidates = @()

  if ($script:StaticToolCandidates.ContainsKey($normalized)) {
    $candidates += $script:StaticToolCandidates[$normalized]
  }

  if ($normalized -eq 'python') {
    $candidates += 'C:\Python311\python.exe'

    if ($env:LOCALAPPDATA) {
      $localPythonRoot = Join-Path $env:LOCALAPPDATA 'Programs\Python'
      if (Test-Path $localPythonRoot) {
        $candidates += Get-ChildItem $localPythonRoot -Directory -Filter 'Python*' -ErrorAction SilentlyContinue |
          Sort-Object Name -Descending |
          ForEach-Object { Join-Path $_.FullName 'python.exe' }
      }
    }
  }

  $candidates | Where-Object { $_ } | Select-Object -Unique
}

function Test-SupportedToolCandidate {
  param(
    [Parameter(Mandatory)]
    [string]$Name,

    [Parameter(Mandatory)]
    [string]$Path
  )

  if (-not (Test-Path $Path)) {
    return $false
  }

  if ($Name.ToLowerInvariant() -eq 'python' -and $Path -match '\\WindowsApps\\python(?:\d+(?:\.\d+)*)?\.exe$') {
    return $false
  }

  return $true
}

function Resolve-ToolPath {
  param(
    [Parameter(Mandatory)]
    [string]$Name
  )

  $checked = [System.Collections.Generic.List[string]]::new()

  foreach ($candidate in Get-ToolCandidates $Name) {
    $checked.Add($candidate)
    if (Test-SupportedToolCandidate $Name $candidate) {
      return $candidate
    }
  }

  foreach ($searchName in @($Name, "$Name.exe") | Select-Object -Unique) {
    $commandInfo = Get-Command $searchName -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($null -eq $commandInfo -or -not $commandInfo.Path) {
      continue
    }

    $checked.Add($commandInfo.Path)
    if (Test-SupportedToolCandidate $Name $commandInfo.Path) {
      return $commandInfo.Path
    }
  }

  $checkedList = ($checked | Select-Object -Unique) -join ', '
  throw "Could not resolve tool '$Name'. Checked: $checkedList"
}
