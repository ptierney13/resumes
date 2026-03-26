$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path $PSScriptRoot -Parent
$defaultResumeDir = Join-Path $repoRoot 'Templates\Resumes\page-layouts\current-standard'
$previewDir = Join-Path $repoRoot 'preview'
$activeApplicationFile = Join-Path $previewDir 'active-application.txt'
$previewScript = Join-Path $repoRoot 'scripts\render_pdf_preview.py'

. (Join-Path $PSScriptRoot 'tool-paths.ps1')

function Get-ResumeDir {
  if (Test-Path $activeApplicationFile) {
    $candidate = (Get-Content $activeApplicationFile -Raw).Trim()
    if ($candidate) {
      if (-not [System.IO.Path]::IsPathRooted($candidate)) {
        $candidate = Join-Path $repoRoot $candidate
      }

      $resolvedCandidate = [System.IO.Path]::GetFullPath($candidate)
      $candidateResume = Join-Path $resolvedCandidate 'resume.tex'
      if ((Test-Path $resolvedCandidate) -and (Test-Path $candidateResume)) {
        return $resolvedCandidate
      }
    }
  }

  return $defaultResumeDir
}

$pdflatex = Resolve-ToolPath 'pdflatex'
$python = Resolve-ToolPath 'python'

if (-not (Test-Path $previewScript)) {
  throw "Missing preview script at $previewScript"
}

$resumeDir = Get-ResumeDir
$resumePdf = Join-Path $resumeDir 'resume.pdf'
$previewPath = Join-Path $previewDir 'current-resume-preview.png'

Push-Location $resumeDir
try {
  & $pdflatex '-interaction=nonstopmode' 'resume.tex'
  & $pdflatex '-interaction=nonstopmode' 'resume.tex'
} finally {
  Pop-Location
}

& $python $previewScript $resumePdf $previewPath

if ($resumeDir -ne $defaultResumeDir) {
  $finalPdf = Join-Path $resumeDir 'Patrick Tierney.pdf'
  Copy-Item $resumePdf $finalPdf -Force
}
