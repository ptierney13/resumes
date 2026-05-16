$ErrorActionPreference = 'Stop'

$pdfGenerationDir = $PSScriptRoot
$templateDir = Join-Path $pdfGenerationDir 'current-standard'
$outputDir = Join-Path $pdfGenerationDir 'output'
$buildDir = Join-Path $outputDir 'build\current-standard'
$previewDir = Join-Path $pdfGenerationDir 'preview'
$previewScript = Join-Path $pdfGenerationDir 'render_pdf_preview.py'
$finalPdf = Join-Path $outputDir 'current-standard-resume.pdf'
$previewPath = Join-Path $previewDir 'current-standard-resume-preview.png'

. (Join-Path $pdfGenerationDir 'tool-paths.ps1')

$pdflatex = Resolve-ToolPath 'pdflatex'
$python = Resolve-ToolPath 'python'

New-Item -ItemType Directory -Path $buildDir -Force | Out-Null
New-Item -ItemType Directory -Path $previewDir -Force | Out-Null

Push-Location $templateDir
try {
  & $pdflatex '-interaction=nonstopmode' '-halt-on-error' '-output-directory' $buildDir 'resume.tex'
  & $pdflatex '-interaction=nonstopmode' '-halt-on-error' '-output-directory' $buildDir 'resume.tex'
} finally {
  Pop-Location
}

$builtPdf = Join-Path $buildDir 'resume.pdf'
if (-not (Test-Path $builtPdf)) {
  throw "Expected compiled PDF at $builtPdf"
}

Copy-Item $builtPdf $finalPdf -Force
& $python $previewScript $finalPdf $previewPath

Write-Output "PDF: $finalPdf"
Write-Output "Preview: $previewPath"
