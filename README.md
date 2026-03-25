# Resume Workspace

This repo keeps durable personal source-of-truth notes separate from reusable templates and finalized application snapshots.

## Structure

- `Profile/`: durable facts, preferences, accomplishment inventory, and technology history
- `Workflow/`: the tailoring process and application-folder rules
- `Templates/Resumes/page-layouts/`: reusable resume page-format shells
- `Templates/Resumes/content-starting-points/`: role-focused starting points and emphasis guides
- `Templates/Cover Letters/`: shared cover letter templates
- `Applications/`: per-company copies of materials you actually used for each application
- `skills/patrick-resume-workflow/`: the Codex skill that encodes this workflow

## Compile

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

```bash
git status
git add Profile Workflow Templates Applications skills scripts README.md AGENTS.md CLAUDE.md .gitignore
git commit -m "Update resume bullets for platform roles"
```

## Tailoring Workflow

1. Capture the job posting and scaffold `Applications/<Company>/<job-slug>/`.
2. Audit the posting against `Profile/` and the starting points under `Templates/Resumes/content-starting-points/`.
3. Draft broadly using `Templates/Resumes/page-layouts/current-standard/resume.tex`.
4. Prune late to one page.
5. Save the final `resume.tex`, `resume.pdf`, posting text, and decision summary in the application folder.
6. Feed any new durable facts or preferences back into `Profile/`, `Templates/`, and the Codex skill.

## Preview Loop

Use the existing MiKTeX install plus the local preview renderer:

```bash
powershell -ExecutionPolicy Bypass -NoProfile -File .\scripts\compile_and_preview_current_resume.ps1
```

That updates:

- `Templates/Resumes/page-layouts/current-standard/resume.pdf`
- `preview/current-resume-preview.png`

## Publish To GitHub

1. Create an empty GitHub repository, for example `resume-workspace`.
2. Add it as the remote:

```bash
git remote add origin https://github.com/<your-user>/<your-repo>.git
git push -u origin main
```
