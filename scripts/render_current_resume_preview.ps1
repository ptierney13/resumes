$ErrorActionPreference = 'Stop'

$repoRoot = 'C:\Users\ptier\OneDrive\Desktop\Important\Apps'
$python = 'C:\Python311\python.exe'
$pythonLibDir = Join-Path $repoRoot '.local-tools\python'
$previewScript = Join-Path $repoRoot 'scripts\render_pdf_preview.py'
$pdfPath = Join-Path $repoRoot 'Templates\Resumes\page-layouts\current-standard\resume.pdf'
$outputPath = Join-Path $repoRoot 'preview\current-resume-preview.png'

$env:PYTHONPATH = $pythonLibDir
& $python $previewScript $pdfPath $outputPath
