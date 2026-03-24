# Resume Rules

These are the standing rules for tailoring Patrick Tierney's resume materials.

## Non-Negotiable Accuracy Rules

- Never invent accomplishments, scope, ownership, or technologies.
- Never change the meaning of an accomplishment or expand beyond what Patrick has actually done.
- Treat prior application materials under `Applications/` as finalized historical records.
- Use prior resumes and application materials as source material only; never edit older applications unless Patrick explicitly asks for that specific application to be reopened.

## Resume Construction Rules

- Always keep the final resume to one page.
- Do not optimize for one page too early. Build a fuller draft first, then prune late.
- Use the current page layout as the default formatting baseline:
  - `Templates/Resumes/page-layouts/current-standard/resume.tex`
- Pull content from previous drafts when helpful, but keep the formatting anchored to the current page layout unless Patrick asks otherwise.
- Always consider including the short accomplishments/hobbies section at the end.
- Unless that section is directly relevant to the target job, treat it as one of the first places to cut for space.

## Tailoring Rules

- Strive to address every material skill, tool, and requirement in the job posting.
- Prompt Patrick to provide history and experience for any skill or requirement that is materially relevant but not already supported by the source-of-truth docs.
- Prefer explicit evidence over generic claims.
- Use the strongest available evidence for each requirement, even if that evidence originally appeared in an older or company-specific draft.

## Documentation Rules

- Overdocument rather than underdocument.
- Maintain durable personal facts, preferences, accomplishments, and technology history at the repository top level outside `Templates/`.
- Update those durable docs whenever Patrick confirms a new preference, accomplishment framing, technology history detail, or role-positioning choice.
- When a resume is finalized for a specific posting, save the job posting, final resume, and decision summary in the corresponding application folder.

## Naming and File Rules

- Resume starting-point files inside `Templates/Resumes/content-starting-points/` should use the pattern `starter__<domain>__<focus>.md`.
- Finalized application resumes copied into `Applications/<Company>/<job-slug>/` should be named `resume.tex` and `resume.pdf`.
- Keep folder structures sparse. Do not add another subfolder layer unless a directory grows beyond three distinct starting points and a natural grouping appears.
