$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path $PSScriptRoot -Parent
$previewScript = Join-Path $repoRoot 'scripts\render_pdf_preview.py'
$previewDir = Join-Path $repoRoot 'preview'
$activeApplicationFile = Join-Path $previewDir 'active-application.txt'
$defaultPdfPath = Join-Path $repoRoot 'Templates\Resumes\page-layouts\current-standard\resume.pdf'
$outputPath = Join-Path $repoRoot 'preview\current-resume-preview.png'

. (Join-Path $PSScriptRoot 'tool-paths.ps1')

$python = Resolve-ToolPath 'python'

if (Test-Path $activeApplicationFile) {
  $candidate = (Get-Content $activeApplicationFile -Raw).Trim()
  if ($candidate) {
    if (-not [System.IO.Path]::IsPathRooted($candidate)) {
      $candidate = Join-Path $repoRoot $candidate
    }

    $resolvedCandidate = [System.IO.Path]::GetFullPath($candidate)
    $candidatePdf = Join-Path $resolvedCandidate 'resume.pdf'
    if (Test-Path $candidatePdf) {
      $defaultPdfPath = $candidatePdf
    }
  }
}

& $python $previewScript $defaultPdfPath $outputPath
