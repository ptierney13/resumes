# PDF Generation

This folder contains the clean, current workflow for generating the standard resume PDF and a preview image.

## What To Run

From the repo root, run:

```powershell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File ".\PDF Generation\compile_standard_resume.ps1"
```

## Inputs

- `current-standard/resume.tex` is the copied standard resume template from the legacy repo structure.

## Outputs

- `output/current-standard-resume.pdf`
- `preview/current-standard-resume-preview.png`

## Tooling In This Folder

- `compile_standard_resume.ps1` compiles the LaTeX source and renders the preview image.
- `tool-paths.ps1` resolves `pdflatex` and `python` on this machine without assuming PATH is configured correctly.
- `render_pdf_preview.py` renders page 1 of the generated PDF to PNG.

## Legacy Fallbacks

The new flow is self-contained, but it may reference `_legacy/` in two cases:

- documentation lookup in `_legacy/Workflow/agent-environment.md`
- Python preview dependency fallback from `_legacy/.local-tools/python`

If preview rendering fails because the dependency is missing in both places, install `pypdfium2` for the Python interpreter resolved by `tool-paths.ps1`.
