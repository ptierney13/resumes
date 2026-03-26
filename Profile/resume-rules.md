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
- Treat the currently checked-in `current-standard` resume as the canonical default baseline unless Patrick explicitly chooses a different starting point.
- Pull content from previous drafts when helpful, but keep the formatting anchored to the current page layout unless Patrick asks otherwise.
- Always consider whether the resume should include a top-level one-line summary.
- Prefer to omit that summary when the section headings and overall structure already make the target-role fit obvious.
- When removing a summary or reclaiming top-of-page space, explicitly consider whether the best choice is:
  - adding another bullet
  - adding a personality/passion line
  - restoring the accomplishments section
  - leaving the space empty for readability
- Treat leaving the space empty as a first-class option, not a failure to use available room.
- If it is not obvious which option is strongest from Patrick's prior preferences, ask him to choose rather than filling space reflexively.
- When a summary or personality line is used, prefer a non-first-person noun-phrase framing over `I ...` statements.
- Favor summary styles like `A platform engineer passionate about ...` over `I gravitate ...` or other first-person tonal shifts.
- If the current section headings do not immediately speak to the posting, consider reordering sections, renaming headings, or fully refactoring how accomplishments are grouped before defaulting to the existing structure.
- Section headings should be clear summaries of the content they contain; do not stuff them with target-role buzzwords or duplicate concepts unless the content genuinely supports that framing.
- When grouping multiple roles under one company super-heading, prefer a single combined role/date line if it reads cleanly, rather than stacking fully right-justified dates.
- When using a combined role/date line under a company heading, keep it visually closer to the company name and more prominent than the themed subsections below it.
- Always consider including the short accomplishments/hobbies section at the end.
- Unless that section is directly relevant to the target job, treat it as one of the first places to cut for space.
- Maintain support for at least two resume skill-section presentation modes in the reusable system:
  - `Primary Technologies` / `Working Knowledge`
  - grouped-by-area categories
- Choose the skill-section presentation dynamically based on which format is more appealing for the target posting.
- When using grouped-by-area categories, prefer meaningful buckets over a catch-all `Additional` section whenever possible.
- Prefer human-readable category names over vague or buzzword-heavy section labels.
- Do not drop a skill or bullet just because it is less exciting or because a rename feels cleaner; only cut something when doing so materially strengthens the resume, most often by making room for more relevant evidence or by removing weaker duplication.

## Tailoring Rules

- Strive to address every material skill, tool, and requirement in the job posting.
- Prompt Patrick to provide history and experience for any skill or requirement that is materially relevant but not already supported by the source-of-truth docs.
- Prefer explicit evidence over generic claims.
- Use the strongest available evidence for each requirement, even if that evidence originally appeared in an older or company-specific draft.
- When a posting emphasizes technologies Patrick has not used directly, position the closest supported analogs as transferable experience without claiming hands-on use of the unsupported tools.
- When Patrick explicitly rejects a wording pattern or phrasing style, persist that preference and do not reintroduce the rejected wording in later drafts.
- Treat older phrasings that describe the same underlying accomplishment as legacy wording variants, not as separate omitted accomplishments.
- Prefer one-line bullets when they are equally strong; if a bullet takes two lines, make sure the extra words materially improve accuracy, clarity, or impact.

## Documentation Rules

- Overdocument rather than underdocument.
- Maintain durable personal facts, preferences, accomplishments, and technology history at the repository top level outside `Templates/`.
- Update those durable docs whenever Patrick confirms a new preference, accomplishment framing, technology history detail, or role-positioning choice.
- When a resume is finalized for a specific posting, save the job posting, final resume, and decision summary in the corresponding application folder.
- At finalization, explicitly discuss what should remain specific to the application versus what should be propagated into durable standards, templates, or source-of-truth docs.
- When bullets were materially reworded during tailoring, ask Patrick whether each rewording should become reusable default phrasing or remain posting/area specific.
- Once finalization is complete, automatically make a git commit covering the finished resume, notes, and durable workflow updates unless Patrick explicitly says not to.

## Collaboration Rules

- When proposing wording changes that Patrick has not already approved, always present the before and after text first.
- Once Patrick explicitly approves a wording change, go ahead and apply it rather than keeping it in the open edits list.
- When sharing visual resume previews during iteration, use the single full-page render by default rather than split or cropped views unless Patrick asks for a different format.
- When compiling a resume for review, prefer the repository compile-and-preview script instead of raw LaTeX commands so the preview and recruiter-facing PDF stay in sync automatically.
- When presenting a resume draft for consideration, include the current PDF and explicitly enumerate:
  - relevant documented knowledge, accomplishments, or points about Patrick that are supported by the full source-of-truth docs but are not included in the draft
  - wording changes made since the last reviewed draft or baseline
- In chat responses, include both a direct link to the current PDF and an inline render of the current full-page preview image when the interface supports images.
- If the organization changed, explicitly summarize what was reorganized, why, and the intended emphasis or "vibe" of the structural changes.
- If no relevant omissions or wording changes exist, say so explicitly rather than leaving those lists implicit.
- At finalization, explicitly review how the finished resume will be saved and what reusable learnings or phrasing decisions should be carried forward.
- When the full process is complete, include a direct link to the application folder containing the generated resume so Patrick can easily attach it while applying.
- When laying out skill lists, prefer line breaks between skills rather than splitting a multi-word skill across lines.
- When a company heading contains multiple themed subsections, make the subsection styling visually subordinate so the company clearly reads as the parent section.

## Naming and File Rules

- Resume starting-point files inside `Templates/Resumes/content-starting-points/` should use the pattern `starter__<domain>__<focus>.md`.
- Finalized application resume source files inside `Applications/<Company>/<job-slug>/` should be named `resume.tex`.
- The recruiter-facing final PDF should be named `Patrick Tierney.pdf` unless Patrick explicitly asks for a different filename.
- Keep folder structures sparse. Do not add another subfolder layer unless a directory grows beyond three distinct starting points and a natural grouping appears.
