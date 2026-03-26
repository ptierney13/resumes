$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'tool-paths.ps1')

$toolNames = @('cmd', 'where', 'reg', 'powershell', 'git', 'python', 'pdflatex', 'xelatex')
$toolRecords = foreach ($toolName in $toolNames) {
  Get-ResolvedToolRecord $toolName
}
$bootstrapEntries = Get-AgentPathEntries
$currentEntries = $env:Path -split ';' |
  Where-Object { $_ } |
  ForEach-Object { $_.TrimEnd('\') }
$missingEntries = $bootstrapEntries |
  Where-Object { $currentEntries -notcontains $_.TrimEnd('\') }

Write-Output 'Current process PATH entries:'
$env:Path -split ';' |
  Where-Object { $_ } |
  ForEach-Object { Write-Output "  $_" }

Write-Output ''
Write-Output 'Known tool locations:'
$toolRecords | Format-Table -AutoSize | Out-String -Width 240 | Write-Output

Write-Output 'Known-good bootstrap PATH entries:'
$bootstrapEntries | ForEach-Object { Write-Output "  $_" }

Write-Output ''
Write-Output 'Missing from the current process PATH:'
if ($missingEntries) {
  $missingEntries | ForEach-Object { Write-Output "  $_" }
} else {
  Write-Output '  (none)'
}

Write-Output ''
Write-Output 'One-line bootstrap PATH value:'
Write-Output ($bootstrapEntries -join ';')

if (Test-Path 'C:\Windows\py.exe') {
  Write-Output ''
  Write-Output 'Python launcher note:'
  Write-Output '  C:\Windows\py.exe exists, but current Codex sessions should prefer the resolved python.exe path instead of py.exe.'
}
