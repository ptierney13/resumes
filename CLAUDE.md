# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

A collection of LaTeX resumes and cover letters for job applications. Durable personal notes live under `Profile/`, workflow documentation lives under `Workflow/`, shared templates live under `Templates/`, and finalized company-specific application snapshots live under `Applications/`.

## Compiling Documents

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

### Commented-out Content

Sections wrapped in `%` comments throughout the work history are preserved for future reference — these are older/longer descriptions of the same roles that can be swapped back in when needed.
