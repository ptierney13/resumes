# Application Folder Spec

Each finalized application should live under:

`Applications/<Company>/<job-slug>/`

## Folder Naming

- Use the company name as the first folder level.
- Use a lowercase hyphenated slug for the specific job posting as the second folder level.
- Example:
  - `Applications/Acme/staff-software-engineer-platform/`

## Required Files

### `job-posting.md`

Store the job description text, source URL if available, and any quick notes about location, level, or special requirements.

### `decision-summary.md`

Capture the quick explanation of why the final resume looks the way it does. Include:

- chosen kickoff resume
- strongest themes emphasized
- summary-line decision
- heading, ordering, or grouping refactor decisions
- important bullets included
- notable bullets cut or deprioritized
- any decisions about which reworded bullets became durable standard phrasing versus staying application-specific
- any unresolved concerns or assumptions

## Finalization Expectations

- The final completion message should include copy-pasteable absolute filesystem paths for the application folder as well as the generated `Patrick Tierney.pdf`.
- Clickable local filesystem links are not supported in Claude Code's chat output. Use plain copy-pasteable absolute filesystem paths.
- Before any `git commit`, `git push`, or other action with effects outside this project folder, summarize the local changes, call out any design decisions that were not explicitly specified, and give Patrick a chance to validate.
- The finalized state should normally be committed and pushed to git once the resume and workflow updates are complete and Patrick has validated the local changes.

### `resume.tex`

The finalized LaTeX resume source for that application. New application folders should be seeded from the chosen kickoff resume under `Templates/Resumes/kickoff-resumes/` during scaffolding so agents start from the closest known-good baseline.
Until Patrick approves a proposed change list for that application, this seeded file should remain unchanged so the kickoff baseline is the review reference point.

### `Patrick Tierney.pdf`

The rendered one-page recruiter-facing PDF that corresponds to `resume.tex`.

## Recommended Working File

### `working-notes.md`

Use this during drafting for:

- requirement coverage notes
- proposal notes against the unchanged kickoff baseline
- summary-line decision notes
- heading, ordering, or grouping refactor options
- missing-information questions for Patrick
- candidate bullet variants
- relevant documented evidence intentionally omitted from the current draft
- wording changes made during the current round
- propagation decisions for any materially reworded bullets
- early pruning notes

## Invariants

- Finalized application resume source files should be named `resume.tex`.
- Final recruiter-facing PDFs should be named `Patrick Tierney.pdf`.
- Older application folders are historical records and should not be edited during unrelated work.

## Local Workflow State

- `preview/active-application.txt` is the local pointer used by the compile-and-preview scripts to know which application folder is currently active.
- Because `preview/` is ignored, this pointer is local workspace state rather than a durable artifact.
- When no active application folder is set, the preview workflow falls back to the layout-only `Templates/Resumes/page-layouts/current-standard/` shell.
