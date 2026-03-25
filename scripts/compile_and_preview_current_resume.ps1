$ErrorActionPreference = 'Stop'

$repoRoot = 'C:\Users\ptier\OneDrive\Desktop\Important\Apps'
$resumeDir = Join-Path $repoRoot 'Templates\Resumes\page-layouts\current-standard'
$previewDir = Join-Path $repoRoot 'preview'
$pdflatex = 'C:\Users\ptier\AppData\Local\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe'
$python = 'C:\Python311\python.exe'
$pythonLibDir = Join-Path $repoRoot '.local-tools\python'
$previewScript = Join-Path $repoRoot 'scripts\render_pdf_preview.py'

if (-not (Test-Path $pdflatex)) {
  throw "Missing MiKTeX pdflatex at $pdflatex"
}

if (-not (Test-Path $previewScript)) {
  throw "Missing preview script at $previewScript"
}

Push-Location $resumeDir
try {
  & $pdflatex '-interaction=nonstopmode' 'resume.tex'
} finally {
  Pop-Location
}

$env:PYTHONPATH = $pythonLibDir
& $python $previewScript (Join-Path $resumeDir 'resume.pdf') (Join-Path $previewDir 'current-resume-preview.png')
