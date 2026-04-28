# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

A collection of LaTeX resumes and cover letters for job applications. Durable personal notes live under `Profile/`, workflow documentation lives under `Workflow/`, shared templates live under `Templates/`, and finalized company-specific application snapshots live under `Applications/`.

## Compiling Documents

Agent environment note: Claude Code has a dedicated PowerShell tool and a Bash tool. `git`, `python`, `pdflatex`, and `xelatex` are available from bash without full paths. PowerShell scripts should be run via the PowerShell tool or via the full path `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe` from bash — `powershell` and `powershell.exe` are not on the Git Bash PATH.

Preferred resume workflow commands (run via the PowerShell tool):
```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\init_application_folder.ps1 --company <Company words> --job-slug <job-slug> --title <Role Title words> --posting-url <Posting URL words> --kickoff-resume <kickoff-resume>
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\compile_and_preview_current_resume.ps1
```

The scaffold command seeds `Applications/<Company>/<job-slug>/resume.tex` from the chosen kickoff resume under `Templates/Resumes/kickoff-resumes/` and records the active folder in `preview/active-application.txt`.
That seeded `resume.tex` should be treated as the untouched baseline for review until Patrick approves proposed resume changes.
The compile-and-preview script is the canonical agent entry point: it compiles the active application resume when that pointer is set, and otherwise falls back to the layout-only `Templates/Resumes/page-layouts/current-standard/` shell. It refreshes `preview/current-resume-preview.png` and updates both `resume.pdf` and `Patrick Tierney.pdf` in the application folder when an active application is selected.

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

## Agent Startup Workflow

Before making resume changes, go slowly and fully inspect the intended workflow:

1. Read `CLAUDE.md` end to end, then review the relevant docs under `Workflow/` before making assumptions about how a draft should be produced.
2. Read `Profile/resume-rules.md`, `Profile/technology-map.md`, `Profile/accomplishment-inventory.md`, and `Profile/posting-gap-registry.md` before auditing a job posting.
3. Inspect `Templates/Resumes/kickoff-resumes/` and `Templates/Resumes/resume-data/` before editing a generated `Applications/*/resume.tex` file directly.
4. Prefer pulling the closest kickoff resume and applying documented durable wording updates from `Templates/Resumes/resume-data/`, `Profile/`, or `Workflow/` over ad hoc restructuring.
5. Only write a helper script or do direct source transformations after confirming there is not already a documented script, baseline, or clean manual path for the task.
6. When a role-specific kickoff resume exists, preserve its positioning and section-heading strategy rather than treating the current platform/general default as the only starting point.
7. For new application work, scaffolding the folder and saving the posting are allowed before approval, but the seeded `resume.tex` must remain an unchanged kickoff baseline until Patrick approves a proposed change list.
8. After scaffolding, check `Profile/posting-gap-registry.md` against the posting requirements before building the proposal. Resolve gap questions with Patrick before presenting the change list — not after.
9. Stop and propose resume-content and organization changes with reasoning before editing the seeded `resume.tex` unless Patrick explicitly asks for a direct first draft. No bullet may appear in the resume unless it exists in `approved-resume-points/` or Patrick has explicitly approved adding it.

## Architecture

### Resume Structure

1. **`Templates/Resumes/page-layouts/`** — Page-format shells for resumes. These should contain placeholder content only so layout choice stays separate from content decisions. Current layout folders are:
   - `current-standard/`
   - `clean-deprecated/`
   - `human-teams-delineated/`

2. **`Templates/Resumes/page-layouts/human-teams-delineated/resume.tex`** — XeLaTeX template with custom macros for work history laid out in a two-column tabular format (dates on left, content on right). Three work-entry macros:
   - `\work{dates}{title}{company}{description}` — single position
   - `\workTwo{dates}{title}{company}{...}{team1}{dates1}{desc1}{team2}{dates2}{desc2}` — two positions at same company
   - `\workThree{...}` — three positions at same company
   - `\oldwork{...}` — hides entries from output but preserves them in source for reference
   - **Do not modify the outer `\begin{tabular}{r|p{14.5cm}}` declaration** — this will break the `\work` macros.

3. **`Templates/Resumes/kickoff-resumes/`** — Fully formed resume baselines for broad classes of roles such as `devops-infra/` and `platform/`. Resume tailoring should usually start from the closest kickoff resume rather than from a layout shell.
   - Keep distinct kickoff resumes when the positioning meaningfully differs.
   - Maintain a short `README.md` in each kickoff folder describing when it is appropriate and what it emphasizes.

4. **`Templates/Resumes/resume-data/`** — The authoritative content model for resume generation.
   - `work-history-summary.md` is the readable summary of Patrick's work history and adjacent fit areas.
   - `approved-resume-points/` contains the allowed bullet ideas and wording variants.
   - `approved-heading-sets.md` stores previously accepted subsection structures and when to use them.
   - `skills-inventory.md` is the durable skill pool used to assemble targeted skill sections.

5. **`Templates/Resumes/content-starting-points/`** — Role-focused starting-point files. Use the naming convention `starter__<domain>__<focus>.md`. Keep this tree sparse; only add another folder layer when a natural grouping has more than three siblings.

6. **`Profile/`** — Durable facts, preferences, accomplishments, and technology history that must persist independently of any template reorganization.

7. **`Workflow/`** — Process documentation describing how to tailor resumes, scaffold application folders, and archive final artifacts.

### Company-Specific Variants

Each company folder under `Applications/` preserves the exact resume and cover letter versions used for a finalized application. Treat unrelated application folders as historical records; do not alter them while working on a different application.

The local workspace pointer for "which application is currently active" lives in `preview/active-application.txt`, which is intentionally ignored by git.

### Resume Review Preferences

- The default flow for new applications is: scaffold the folder, save the posting, leave the seeded `resume.tex` unchanged, propose changes for approval, then edit only after approval.
- Always consider whether the draft should include a top-level one-line summary, but omit it when the section headings and structure already make the target-role fit obvious.
- If the current section headings do not directly speak to the posting, consider reordering sections, renaming headings, or fully regrouping accomplishments before polishing bullet wording.
- Keep section headings as clear summaries of the content they introduce; do not add target-role buzzwords gratuitously or duplicate the same concept across multiple headings.
- Do not drop skills or bullets unless the omission materially strengthens the resume, usually by making room for stronger or more relevant content.
- When kicking off a new application, do not treat the scaffolded resume as permission to start tailoring immediately; the baseline exists so Patrick can approve the proposed changes against a known starting point.
- When presenting a draft for review, include the current PDF and explicitly enumerate any relevant documented knowledge or accomplishments not included in the draft plus any wording changes made in that revision.
- If the organization changed, explicitly summarize what was reorganized, why it was reorganized, and the intended emphasis or vibe of that structural change.
- In chat, include both a copy-pasteable absolute filesystem path to the current PDF and the inline full-page preview image by default.
- Before any `git commit`, `git push`, or other action with effects outside this project folder, summarize the local changes, highlight any design decisions that were not explicitly specified, and give Patrick a chance to validate.
- Once a resume is finalized and Patrick has validated the local changes, make a git commit and push the completed state unless he explicitly says not to.
- In the final completion message, include the absolute filesystem path to the application folder containing the generated resume.
- Clickable local filesystem links are not supported in Claude Code's chat output. Use plain copy-pasteable absolute filesystem paths for the final PDF and application folder.
- Do not propagate a local-link formatting guess into durable docs before that validation happens.
- More generally, when Patrick calls out a bug, broken workflow, or improper assumption, verify the proposed fix in the current environment before rolling it out broadly or persisting it into durable instructions.

### Commented-out Content

Sections wrapped in `%` comments throughout the work history are preserved for future reference — these are older/longer descriptions of the same roles that can be swapped back in when needed.
