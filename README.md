# Resume Workspace

This repo keeps shared resume and cover-letter templates separate from company-specific application snapshots.

## Structure

- `Templates/Resumes/`: shared resume variants you update over time
- `Templates/Cover Letters/`: shared cover letter templates
- `Applications/`: per-company copies of materials you actually used for each application

## Compile

XeLaTeX resumes:

```bash
xelatex Templates/Resumes/resume_human_teamsDelineated.tex
xelatex Applications/Netflix/resume.tex
```

Standard LaTeX resumes:

```bash
pdflatex Templates/Resumes/resume_current.tex
pdflatex Templates/Resumes/resume_clean_depricated.tex
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
git add Templates Applications README.md AGENTS.md CLAUDE.md .gitignore
git commit -m "Update resume bullets for platform roles"
```

## Publish To GitHub

1. Create an empty GitHub repository, for example `resume-workspace`.
2. Add it as the remote:

```bash
git remote add origin https://github.com/<your-user>/<your-repo>.git
git push -u origin main
```
