$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path $PSScriptRoot -Parent
$scriptPath = Join-Path $PSScriptRoot 'init_application_folder.py'

. (Join-Path $PSScriptRoot 'tool-paths.ps1')

$python = Resolve-ToolPath 'python'

if (-not (Test-Path $scriptPath)) {
  throw "Missing init script at $scriptPath"
}

$parsed = @{
  company = @()
  'job-slug' = @()
  title = @()
  'posting-url' = @()
}

$currentKey = $null
foreach ($token in $args) {
  switch ($token) {
    '--company' {
      $currentKey = 'company'
      continue
    }
    '--job-slug' {
      $currentKey = 'job-slug'
      continue
    }
    '--title' {
      $currentKey = 'title'
      continue
    }
    '--posting-url' {
      $currentKey = 'posting-url'
      continue
    }
    default {
      if (-not $currentKey) {
        throw "Unexpected argument '$token'. Use --company, --job-slug, --title, and --posting-url."
      }

      $parsed[$currentKey] += $token
    }
  }
}

$companyName = ($parsed['company'] -join ' ').Trim()
$jobSlug = ($parsed['job-slug'] -join ' ').Trim()
$titleText = ($parsed['title'] -join ' ').Trim()
$postingUrlText = ($parsed['posting-url'] -join ' ').Trim()

if (-not $companyName) {
  throw 'Missing required value for --company.'
}

if (-not $jobSlug) {
  throw 'Missing required value for --job-slug.'
}

$arguments = @($scriptPath, $companyName, $jobSlug)

if ($titleText) {
  $arguments += @('--title', $titleText)
}

if ($postingUrlText) {
  $arguments += @('--posting-url', $postingUrlText)
}

$arguments += @('--root', $repoRoot)

& $python @arguments
