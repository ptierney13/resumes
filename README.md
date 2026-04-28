# Resume Workspace

This repo keeps durable personal source-of-truth notes separate from reusable templates and finalized application snapshots.

## Structure

- `Profile/`: durable facts, preferences, accomplishment inventory, and technology history
- `Workflow/`: the tailoring process and application-folder rules
- `Templates/Resumes/page-layouts/`: reusable resume page-format shells
- `Templates/Resumes/content-starting-points/`: role-focused starting points and emphasis guides
- `Templates/Cover Letters/`: shared cover letter templates
- `Applications/`: per-company copies of materials you actually used for each application
- `skills/patrick-resume-workflow/`: the legacy Codex skill (Claude Code reads `CLAUDE.md` instead)

## Compile

For agent-driven resume iteration, prefer the scripted workflow in the `Preview Loop` section below instead of calling raw LaTeX commands directly.

XeLaTeX resumes:

```bash
xelatex Templates/Resumes/page-layouts/human-teams-delineated/resume.tex
xelatex Applications/Netflix/resume.tex
```

Standard LaTeX resumes:

```bash
pdflatex Templates/Resumes/page-layouts/current-standard/resume.tex
pdflatex Templates/Resumes/page-layouts/clean-deprecated/resume.tex
```

Cover letters:

```bash
pdflatex "Templates/Cover Letters/CoverLetter.tex"
pdflatex "Applications/Riot/CoverLetter - services.tex"
```

## Versioning Workflow

Use small commits whenever you finish a meaningful round of edits.
In Claude Code's bash shell, `git` is on PATH directly.

```bash
git status
git add Profile Workflow Templates Applications skills scripts README.md AGENTS.md CLAUDE.md .gitignore
git commit -m "Update resume bullets for platform roles"
```

## Tailoring Workflow

1. Capture the job posting and scaffold `Applications/<Company>/<job-slug>/`.
   Prefer `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\init_application_folder.ps1 --company <Company words> --job-slug <job-slug> --title <Role Title words> --posting-url <Posting URL words>`.
   The direct Python command remains available as a fallback.
   This also seeds `Applications/<Company>/<job-slug>/resume.tex` and updates `preview/active-application.txt`.
2. Audit the posting against `Profile/` and the starting points under `Templates/Resumes/content-starting-points/`.
3. Draft broadly in the active application's `resume.tex`, which starts as a copy of `Templates/Resumes/page-layouts/current-standard/resume.tex`.
   Always decide whether the draft needs a top-level one-line summary and whether the section headings/order/grouping should be refactored to speak more directly to the posting.
   Keep headings as accurate summaries of the bullets they contain rather than stuffing in posting buzzwords, and avoid cutting skills or bullets unless doing so clearly improves the draft.
4. Prune late to one page.
5. Compile and preview with `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\compile_and_preview_current_resume.ps1`.
   When asking Patrick to review a draft, include the PDF and explicitly list relevant documented points omitted from the draft plus wording changes made in that revision.
   If sections or bullets were reorganized, also summarize what moved, why it moved, and the intended emphasis of that reorganization.
   In chat, include a copy-pasteable absolute filesystem path to the PDF and the inline full-page preview image from `preview/current-resume-preview.png`.
   Provide plain absolute filesystem paths for the final PDF and application folder — clickable local links are not supported in Claude Code's chat output.
   More generally, when Patrick calls out a bug or improper assumption in the workflow, verify the fix before rolling it out broadly or documenting it as the new standard.
6. Save the final `resume.tex`, `Patrick Tierney.pdf`, posting text, and decision summary in the application folder.
7. Feed any new durable facts or preferences back into `Profile/`, `Templates/`, and `CLAUDE.md`.
8. Once the resume is finalized, make a git commit and push the completed state unless Patrick explicitly says not to.
9. In the completion message, include copy-pasteable absolute filesystem paths to the application folder and the final PDF.

## Preview Loop

Use the existing MiKTeX install plus the local preview renderer:

```bash
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\compile_and_preview_current_resume.ps1
```

That updates:

- the active application's `resume.pdf` and `Patrick Tierney.pdf` when `preview/active-application.txt` points at a valid application folder, otherwise `Templates/Resumes/page-layouts/current-standard/resume.pdf`
- `preview/current-resume-preview.png`

During resume iteration, the default visual review format is the single full-page preview image at `preview/current-resume-preview.png`.

## Publish To GitHub

1. Create an empty GitHub repository, for example `resume-workspace`.
2. Add it as the remote:

```bash
git remote add origin https://github.com/<your-user>/<your-repo>.git
git push -u origin main
```
