$script:StaticToolCandidates = @{
  cmd = @('C:\Windows\System32\cmd.exe')
  where = @('C:\Windows\System32\where.exe')
  reg = @('C:\Windows\System32\reg.exe')
  powershell = @('C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe')
  git = @(
    'C:\PROGRA~1\Git\cmd\git.exe'
    'C:\Program Files\Git\cmd\git.exe'
  )
  pdflatex = @(
    (Join-Path $env:LOCALAPPDATA 'Programs\MiKTeX\miktex\bin\x64\pdflatex.exe')
  )
  xelatex = @(
    (Join-Path $env:LOCALAPPDATA 'Programs\MiKTeX\miktex\bin\x64\xelatex.exe')
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

  switch ($normalized) {
    'python' {
      $candidates += 'C:\Python311\python.exe'

      if ($env:LOCALAPPDATA) {
        $localPythonRoot = Join-Path $env:LOCALAPPDATA 'Programs\Python'
        $candidates += Join-Path $localPythonRoot 'Python311\python.exe'

        if (Test-Path $localPythonRoot) {
          $candidates += Get-ChildItem $localPythonRoot -Directory -Filter 'Python*' -ErrorAction SilentlyContinue |
            Sort-Object Name -Descending |
            ForEach-Object { Join-Path $_.FullName 'python.exe' }
        }
      }

      $candidates += Get-ChildItem 'C:\' -Directory -Filter 'Python*' -ErrorAction SilentlyContinue |
        Sort-Object Name -Descending |
        ForEach-Object { Join-Path $_.FullName 'python.exe' }
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

  $normalized = $Name.ToLowerInvariant()

  if ($normalized -eq 'python' -and $Path -match '\\WindowsApps\\python(?:\d+(?:\.\d+)*)?\.exe$') {
    return $false
  }

  return $true
}

function Resolve-ToolPath {
  param(
    [Parameter(Mandatory)]
    [string]$Name,

    [string[]]$AdditionalCandidates = @()
  )

  $normalized = $Name.ToLowerInvariant()
  $checked = [System.Collections.Generic.List[string]]::new()
  $candidates = @()
  $candidates += Get-ToolCandidates $normalized
  $candidates += $AdditionalCandidates

  foreach ($candidate in $candidates | Where-Object { $_ } | Select-Object -Unique) {
    $checked.Add($candidate)
    if (Test-SupportedToolCandidate $normalized $candidate) {
      return $candidate
    }
  }

  foreach ($searchName in @($normalized, "$normalized.exe") | Select-Object -Unique) {
    $commandInfo = Get-Command $searchName -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($null -eq $commandInfo -or -not $commandInfo.Path) {
      continue
    }

    $checked.Add($commandInfo.Path)
    if (Test-SupportedToolCandidate $normalized $commandInfo.Path) {
      return $commandInfo.Path
    }
  }

  $checkedList = ($checked | Select-Object -Unique) -join ', '
  throw "Could not resolve tool '$Name'. Checked: $checkedList"
}

function Get-AgentPathEntries {
  $entries = @(
    'C:\Windows\System32'
    'C:\Windows'
  )

  foreach ($toolName in @('git', 'python', 'pdflatex', 'xelatex')) {
    try {
      $entries += Split-Path (Resolve-ToolPath $toolName) -Parent
    } catch {
      continue
    }
  }

  $entries | Where-Object { $_ } | Select-Object -Unique
}

function Get-ResolvedToolRecord {
  param(
    [Parameter(Mandatory)]
    [string]$Name
  )

  try {
    $path = Resolve-ToolPath $Name
    $status = 'found'
  } catch {
    $path = ''
    $status = $_.Exception.Message
  }

  [PSCustomObject]@{
    Name = $Name
    Status = $status
    Path = $path
  }
}
