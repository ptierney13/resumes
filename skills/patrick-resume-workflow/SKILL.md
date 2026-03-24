---
name: patrick-resume-workflow
description: Tailor Patrick Tierney's resume and application materials to a specific job posting while preserving factual accuracy, updating durable source-of-truth docs, archiving finalized application artifacts, and maintaining reusable starting points. Use when working in Patrick's resume repository on tasks such as job-posting intake, resume tailoring, application-folder creation, decision logging, or updating the ongoing resume workflow and preferences.
---

# Patrick Resume Workflow

Use this workflow when adapting Patrick Tierney's resume for a specific role in this repository.

## Read First

At the start of a tailoring task, read these repository files before drafting:

- `Profile/resume-rules.md`
- `Profile/accomplishment-inventory.md`
- `Profile/technology-map.md`
- `Workflow/resume-tailoring-workflow.md`
- `Workflow/application-folder-spec.md`

Then read the most relevant reusable materials:

- Default page layout: `Templates/Resumes/page-layouts/current-standard/resume.tex`
- Alternate page layouts under `Templates/Resumes/page-layouts/`
- Role-oriented starting points under `Templates/Resumes/content-starting-points/`
- Prior finalized applications in `Applications/` as read-only evidence sources

## Core Rules

- Never invent facts, scope, ownership, technologies, or outcomes.
- Never change the meaning of Patrick's accomplishments.
- Keep the final resume to one page, but prune late rather than early.
- Use the current page layout unless Patrick asks for a different one.
- Treat all unrelated folders under `Applications/` as finalized historical records.
- Always look for coverage against every meaningful requirement in the job posting.
- Ask Patrick for missing skill history when the posting calls for something not already supported by the durable docs.
- Consider the short accomplishments/hobbies section each time, but cut it early when it is not helping the target role.

## Workflow

### 1. Intake the posting

- Capture company name, role title, job URL if available, and the posting text.
- If the application folder does not exist yet, scaffold it with:

```bash
C:\Python311\python.exe scripts/init_application_folder.py "<Company>" "<job-slug>" --title "<Role Title>" --posting-url "<Posting URL>"
```

- Store the posting in `Applications/<Company>/<job-slug>/job-posting.md`.

### 2. Audit requirements against evidence

- Compare the posting against the durable docs and reusable starting points.
- Build an explicit coverage map for core skills, domain knowledge, and leadership signals.
- Prompt Patrick for new experience details when the coverage is weak or missing.

### 3. Draft broadly

- Start from the current page layout.
- Pull evidence from the durable docs, starting points, and older finalized applications.
- Draft a fuller version before optimizing for page count.

### 4. Prune to one page

- Remove weaker or less relevant material first.
- Unless job-relevant, the optional accomplishments/hobbies section is an early cut.
- Preserve the strongest evidence for each job requirement.

### 5. Finalize and archive

- Save the final role-specific artifacts in:
  - `Applications/<Company>/<job-slug>/resume.tex`
  - `Applications/<Company>/<job-slug>/resume.pdf`
  - `Applications/<Company>/<job-slug>/decision-summary.md`
- Keep naming inside finalized application folders simple: `resume`.

### 6. Persist durable learnings

- Update `Profile/` files when Patrick confirms new durable facts or preferences.
- Update `Templates/Resumes/content-starting-points/` when a new framing should become reusable.
- Update this skill when a repeatable process improvement emerges.

## Naming Rules

- Starting-point files should use `starter__<domain>__<focus>.md`.
- Only add another folder layer under `Templates/Resumes/content-starting-points/` when there are more than three natural siblings in one area.
- Finalized application folders should use `Applications/<Company>/<job-slug>/`.

## Output Expectations

When the user asks for a tailored resume, aim to leave behind all of the following by the end of the workflow:

- an updated tailored resume draft
- a saved job posting in the correct application folder
- a brief decision summary explaining the chosen emphasis
- updated durable docs when new facts or preferences were confirmed

If a fact is uncertain, stop and ask rather than guessing.
