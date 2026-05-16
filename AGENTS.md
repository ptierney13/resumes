# AGENTS.md

## Scope

Ignore everything under `_legacy/` unless the user explicitly asks for it or you need it to recover historical tooling or documentation.

## Active Repo Layout

- `Resumes/` stores the current resumes and working resume versions.
- `Applications/` stores historical snapshots of resumes and related materials exactly as they were used for specific company applications.
- `Take-Homes/` contains the copied-out take-home materials that remain active in the new structure.
- `PDF Generation/` stores the templates, PDF generation tooling, preview rendering scripts, and related documentation used to produce resume PDFs.

## Resume PDF Flow

Start in `PDF Generation/README.md`.

Canonical command:

```powershell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File ".\PDF Generation\compile_standard_resume.ps1"
```

That script compiles the configured resume template from `PDF Generation/`, writes the generated PDF to `PDF Generation/output/current-standard-resume.pdf`, and refreshes the preview image at `PDF Generation/preview/current-standard-resume-preview.png`.

## Legacy References

If the PDF flow needs repair, check these only as needed:

- `_legacy/Workflow/agent-environment.md`
- `_legacy/scripts/show_tool_locations.ps1`
- `_legacy/scripts/tool-paths.ps1`
