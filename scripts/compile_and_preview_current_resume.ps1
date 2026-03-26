$ErrorActionPreference = 'Stop'

$repoRoot = 'C:\Users\ptier\OneDrive\Desktop\Important\Apps'
$defaultResumeDir = Join-Path $repoRoot 'Templates\Resumes\page-layouts\current-standard'
$previewDir = Join-Path $repoRoot 'preview'
$activeApplicationFile = Join-Path $previewDir 'active-application.txt'
$pdflatex = 'C:\Users\ptier\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe'
$python = 'C:\Python311\python.exe'
$previewScript = Join-Path $repoRoot 'scripts\render_pdf_preview.py'

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

if (-not (Test-Path $pdflatex)) {
  throw "Missing MiKTeX pdflatex at $pdflatex"
}

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
