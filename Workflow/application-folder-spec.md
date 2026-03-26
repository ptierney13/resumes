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

- strongest themes emphasized
- summary-line decision
- heading, ordering, or grouping refactor decisions
- important bullets included
- notable bullets cut or deprioritized
- any decisions about which reworded bullets became durable standard phrasing versus staying application-specific
- any unresolved concerns or assumptions

## Finalization Expectations

- The final completion message should link directly to the application folder as well as the generated `Patrick Tierney.pdf`.
- The finalized state should normally be committed to git once the resume and workflow updates are complete.

### `resume.tex`

The finalized LaTeX resume source for that application. New application folders should be seeded from `Templates/Resumes/page-layouts/current-standard/resume.tex` during scaffolding so agents start from a known-good baseline.

### `Patrick Tierney.pdf`

The rendered one-page recruiter-facing PDF that corresponds to `resume.tex`.

## Recommended Working File

### `working-notes.md`

Use this during drafting for:

- requirement coverage notes
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
