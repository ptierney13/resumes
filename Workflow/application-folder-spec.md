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
- important bullets included
- notable bullets cut or deprioritized
- any unresolved concerns or assumptions

### `resume.tex`

The finalized LaTeX resume for that application.

### `resume.pdf`

The rendered one-page PDF that corresponds to `resume.tex`.

## Recommended Working File

### `working-notes.md`

Use this during drafting for:

- requirement coverage notes
- missing-information questions for Patrick
- candidate bullet variants
- early pruning notes

## Invariants

- Finalized application resumes must be named `resume`.
- Older application folders are historical records and should not be edited during unrelated work.
