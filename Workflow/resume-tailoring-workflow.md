# Resume Tailoring Workflow

Use this workflow whenever tailoring Patrick Tierney's resume for a specific job posting.

## 1. Intake

- Capture the company name, role title, job-posting URL if available, and the full posting text.
- Scaffold the application folder early with `scripts/init_application_folder.py` once the company and job slug are clear.
- Store the raw or cleaned posting in `job-posting.md` inside the target application folder.

## 2. Requirement Audit

- Read:
  - `Profile/resume-rules.md`
  - `Profile/accomplishment-inventory.md`
  - `Profile/technology-map.md`
- Read prior materials in `Templates/` and older finalized applications in `Applications/` as source material only.
- Build a coverage map of:
  - required skills
  - preferred skills
  - domain keywords
  - leadership or scope signals
- Prompt Patrick for missing experience details when a requirement is materially relevant and not already supported by the durable docs.

## 3. Draft Broadly First

- Start from the current layout:
  - `Templates/Resumes/page-layouts/current-standard/resume.tex`
- Pull content ideas from:
  - `Templates/Resumes/content-starting-points/`
  - `Profile/accomplishment-inventory.md`
  - `Profile/technology-map.md`
  - prior finalized applications in `Applications/`
- Do not force the resume to one page yet.
- Prefer collecting more plausible bullets first, then prune.

## 4. Prune Late

- Once the draft captures the strongest relevant evidence, trim to one page.
- Remove lower-value or less relevant material first.
- Unless directly relevant to the job, the optional accomplishments/hobbies section is one of the first things to cut.
- Keep claims concrete and evidence-backed while pruning.

## 5. Finalize and Archive

- Final application artifacts belong in:
  - `Applications/<Company>/<job-slug>/`
- Required final artifacts:
  - `job-posting.md`
  - `decision-summary.md`
  - `resume.tex`
  - `resume.pdf`
- Recommended working artifact:
  - `working-notes.md`

## 6. Persist Learnings

- Update `Profile/` docs whenever Patrick confirms new durable information or preferences.
- Update `Templates/Resumes/content-starting-points/` when a new role-specific framing proves useful again.
- Update the resume workflow skill when a process improvement becomes repeatable.

## 7. Protect Historical Records

- Never alter older application folders unless Patrick explicitly asks to reopen that application.
- Treat other folders under `Applications/` as finalized historical snapshots.
