# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## What This Repository Is

A collection of LaTeX resumes and cover letters for job applications. Shared templates live under `Templates/`, with resumes in `Templates/Resumes/` and cover letters in `Templates/Cover Letters/`. Company-specific application snapshots live under `Applications/`.

## Compiling Documents

**XeLaTeX resumes** (`Templates/Resumes/resume_human_teamsDelineated.tex` and company-specific `Applications/*/resume.tex` variants) require the [Fontin font](http://www.exljbris.com/fontin.html):
```
xelatex Templates/Resumes/resume_human_teamsDelineated.tex
xelatex Applications/Netflix/resume.tex
```

**Standard LaTeX resumes** (`Templates/Resumes/resume_current.tex` and `Templates/Resumes/resume_clean_depricated.tex`) use pdflatex:
```
pdflatex Templates/Resumes/resume_current.tex
pdflatex Templates/Resumes/resume_clean_depricated.tex
```

**Cover letters** use the `moderncv` package and compile with pdflatex:
```
pdflatex "Templates/Cover Letters/CoverLetter.tex"
pdflatex "Applications/Riot/CoverLetter - services.tex"
```

## Architecture

### Shared Resume Templates

1. **`Templates/Resumes/resume_human_teamsDelineated.tex`** — XeLaTeX template with custom macros for work history laid out in a two-column tabular format (dates on left, content on right). Three work-entry macros:
   - `\work{dates}{title}{company}{description}` — single position
   - `\workTwo{dates}{title}{company}{...}{team1}{dates1}{desc1}{team2}{dates2}{desc2}` — two positions at same company
   - `\workThree{...}` — three positions at same company
   - `\oldwork{...}` — hides entries from output but preserves them in source for reference
   - **Do not modify the outer `\begin{tabular}{r|p{14.5cm}}` declaration** — this will break the `\work` macros.

2. **`Templates/Resumes/resume_current.tex`** — Current standard LaTeX resume built from the Jake Gutierrez-style single-column template.

3. **`Templates/Resumes/resume_clean_depricated.tex`** — Older clean/deprecated standard LaTeX resume variant based on the same single-column template.

### Company-Specific Variants

Each company folder under `Applications/` preserves the exact resume and cover letter versions used for that application. Keep those folders together as snapshots; they may include tailored `resume.tex` files, company-specific cover letters, and build artifacts.

### Commented-out Content

Sections wrapped in `%` comments throughout the work history are preserved for future reference — these are older/longer descriptions of the same roles that can be swapped back in when needed.
