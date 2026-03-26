# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

A collection of LaTeX resumes and cover letters for job applications. Durable personal notes live under `Profile/`, workflow documentation lives under `Workflow/`, shared templates live under `Templates/`, and finalized company-specific application snapshots live under `Applications/`.

## Compiling Documents

Agent workflow note: this workspace shell is `cmd`, not PowerShell. Prefer the repository scripts below with full executable paths instead of raw `Get-ChildItem`, `Get-Content`, bare `powershell`, or ad hoc `pdflatex` commands.
Git note: `git` may not be on `PATH` in this workspace shell. Prefer the full executable path `C:\PROGRA~1\Git\cmd\git.exe` for status, add, commit, and push commands.

Preferred resume workflow commands:
```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\init_application_folder.ps1 --company <Company words> --job-slug <job-slug> --title <Role Title words> --posting-url <Posting URL words>
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\compile_and_preview_current_resume.ps1
```

The scaffold command seeds `Applications/<Company>/<job-slug>/resume.tex` from the current-standard template and records the active folder in `preview/active-application.txt`.
The compile-and-preview script is the canonical agent entry point: it compiles the active application resume when that pointer is set, refreshes `preview/current-resume-preview.png`, and updates both `resume.pdf` and `Patrick Tierney.pdf` in the application folder.

**XeLaTeX resumes** (`Templates/Resumes/page-layouts/human-teams-delineated/resume.tex` and company-specific `Applications/*/resume.tex` variants) require the [Fontin font](http://www.exljbris.com/fontin.html):
```
xelatex Templates/Resumes/page-layouts/human-teams-delineated/resume.tex
xelatex Applications/Netflix/resume.tex
```

**Standard LaTeX resumes** (`Templates/Resumes/page-layouts/current-standard/resume.tex` and `Templates/Resumes/page-layouts/clean-deprecated/resume.tex`) use pdflatex:
```
pdflatex Templates/Resumes/page-layouts/current-standard/resume.tex
pdflatex Templates/Resumes/page-layouts/clean-deprecated/resume.tex
```

**Cover letters** use the `moderncv` package and compile with pdflatex:
```
pdflatex "Templates/Cover Letters/CoverLetter.tex"
pdflatex "Applications/Riot/CoverLetter - services.tex"
```

## Architecture

### Resume Structure

1. **`Templates/Resumes/page-layouts/`** — Page-format shells for resumes. Current layout folders are:
   - `current-standard/`
   - `clean-deprecated/`
   - `human-teams-delineated/`

2. **`Templates/Resumes/page-layouts/human-teams-delineated/resume.tex`** — XeLaTeX template with custom macros for work history laid out in a two-column tabular format (dates on left, content on right). Three work-entry macros:
   - `\work{dates}{title}{company}{description}` — single position
   - `\workTwo{dates}{title}{company}{...}{team1}{dates1}{desc1}{team2}{dates2}{desc2}` — two positions at same company
   - `\workThree{...}` — three positions at same company
   - `\oldwork{...}` — hides entries from output but preserves them in source for reference
   - **Do not modify the outer `\begin{tabular}{r|p{14.5cm}}` declaration** — this will break the `\work` macros.

3. **`Templates/Resumes/content-starting-points/`** — Role-focused starting-point files. Use the naming convention `starter__<domain>__<focus>.md`. Keep this tree sparse; only add another folder layer when a natural grouping has more than three siblings.

4. **`Profile/`** — Durable facts, preferences, accomplishments, and technology history that must persist independently of any template reorganization.

5. **`Workflow/`** — Process documentation describing how to tailor resumes, scaffold application folders, and archive final artifacts.

### Company-Specific Variants

Each company folder under `Applications/` preserves the exact resume and cover letter versions used for a finalized application. Treat unrelated application folders as historical records; do not alter them while working on a different application.

The local workspace pointer for "which application is currently active" lives in `preview/active-application.txt`, which is intentionally ignored by git.

### Resume Review Preferences

- Always consider whether the draft should include a top-level one-line summary, but omit it when the section headings and structure already make the target-role fit obvious.
- If the current section headings do not directly speak to the posting, consider reordering sections, renaming headings, or fully regrouping accomplishments before polishing bullet wording.
- Keep section headings as clear summaries of the content they introduce; do not add target-role buzzwords gratuitously or duplicate the same concept across multiple headings.
- Do not drop skills or bullets unless the omission materially strengthens the resume, usually by making room for stronger or more relevant content.
- When presenting a draft for review, include the current PDF and explicitly enumerate any relevant documented knowledge or accomplishments not included in the draft plus any wording changes made in that revision.
- If the organization changed, explicitly summarize what was reorganized, why it was reorganized, and the intended emphasis or vibe of that structural change.
- In chat, include both the direct PDF link and the inline full-page preview image by default.
- Once a resume is finalized, make a git commit and push the completed state unless Patrick explicitly says not to.
- In the final completion message, include a direct link to the application folder containing the generated resume.

### Commented-out Content

Sections wrapped in `%` comments throughout the work history are preserved for future reference — these are older/longer descriptions of the same roles that can be swapped back in when needed.
