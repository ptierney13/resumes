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
- Always consider whether the draft should include a top-level one-line summary, but prefer to omit it when the section headings and structure already make the target fit clear.
- If the summary is removed and space opens up, explicitly consider whether the best use of that space is another bullet, a short personality/passion line, the accomplishments section, or simply leaving the space empty for readability.
- Treat leaving the space empty as a valid outcome when the additions do not clearly strengthen the draft.
- If a summary or personality line is used, prefer non-first-person noun-phrase framing such as `A platform engineer passionate about ...` rather than `I ...` statements.
- If the current section headings do not immediately speak to the job posting, consider reordering sections, renaming headings, or fully regrouping accomplishments before polishing bullet wording.
- Keep section headings accurate to their contents rather than stuffing them with target-role keywords.
- Do not drop a skill or bullet unless that omission clearly strengthens the resume, usually by creating space for more relevant evidence or by removing weaker duplication.
- Treat older wording variants for the same accomplishment as legacy phrasing, not as separate omitted accomplishments.
- Once Patrick rejects a wording pattern, persist that preference and do not reintroduce it in later drafts.
- Prefer one-line bullets when they are equally strong; only keep a two-line bullet when the added detail materially improves accuracy, clarity, or impact.

## Workflow

### 1. Intake the posting

- Capture company name, role title, job URL if available, and the posting text.
- If the application folder does not exist yet, scaffold it with:

```bash
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\init_application_folder.ps1 --company <Company words> --job-slug <job-slug> --title <Role Title words> --posting-url <Posting URL words>
```

- The direct Python command remains a valid fallback when needed:

```bash
C:\Python311\python.exe scripts/init_application_folder.py "<Company>" "<job-slug>" --title "<Role Title>" --posting-url "<Posting URL>"
```

- That command also seeds `Applications/<Company>/<job-slug>/resume.tex` from the current standard baseline and marks the folder as the active application in `preview/active-application.txt`.
- Store the posting in `Applications/<Company>/<job-slug>/job-posting.md`.

### 2. Audit requirements against evidence

- Compare the posting against the durable docs and reusable starting points.
- Build an explicit coverage map for core skills, domain knowledge, and leadership signals.
- Prompt Patrick for new experience details when the coverage is weak or missing.
- Make an explicit summary-line decision and an explicit heading/structure decision before settling into wording tweaks.

### 3. Draft broadly

- Start from the current page layout.
- Pull evidence from the durable docs, starting points, and older finalized applications.
- Draft a fuller version before optimizing for page count.

### 4. Prune to one page

- Remove weaker or less relevant material first.
- Unless job-relevant, the optional accomplishments/hobbies section is an early cut.
- Preserve the strongest evidence for each job requirement.

### 5. Finalize and archive

- Compile and preview using the canonical script:

```bash
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\compile_and_preview_current_resume.ps1
```

- That script should be the default agent entry point for visual review. It compiles the active application resume when `preview/active-application.txt` points at a valid application folder; otherwise it falls back to the current-standard template.
- When presenting a draft for Patrick to consider, include the current PDF and explicitly enumerate:
  - relevant documented knowledge or accomplishments from the full source-of-truth materials that are not yet included in the draft
  - wording changes made in the current revision
  - the summary-line decision and any heading/structure refactor choice
- In chat responses, include both a direct link to the current `Patrick Tierney.pdf` and an inline render of `preview/current-resume-preview.png`.
- If the organization changed, explicitly summarize what was reorganized and what that structural change was meant to accomplish.
- Once the resume is finalized, make a git commit and push the completed state unless Patrick explicitly says not to.
- In the final completion message, include a direct link to the application folder containing the generated resume.
- Save the final role-specific artifacts in:
  - `Applications/<Company>/<job-slug>/resume.tex`
  - `Applications/<Company>/<job-slug>/Patrick Tierney.pdf`
  - `Applications/<Company>/<job-slug>/decision-summary.md`
- Keep naming inside finalized application folders simple: `resume.tex` plus `Patrick Tierney.pdf`.

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
- an up-to-date `Patrick Tierney.pdf` produced through the canonical compile script
- a clear review message that calls out omitted relevant documented points and wording changes when asking Patrick to assess a draft
- an inline full-page preview image included in the review message when the interface supports it
- updated durable docs when new facts or preferences were confirmed

If a fact is uncertain, stop and ask rather than guessing.
