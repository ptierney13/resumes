# Resume Tailoring Workflow

Use this workflow whenever tailoring Patrick Tierney's resume for a specific job posting.

## 1. Intake

- Capture the company name, role title, job-posting URL if available, and the full posting text.
- Scaffold the application folder early with `scripts/init_application_folder.py` once the company and job slug are clear.
- Choose the best kickoff resume under `Templates/Resumes/kickoff-resumes/` before scaffolding. Current durable options are `devops-infra` and `platform`.
- Prefer the closest previously finalized kickoff-style baseline rather than repeatedly starting from the same generic kickoff when a finalized resume already captures the intended direction.
- For agent use on this Windows workspace, prefer the exact command `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\init_application_folder.ps1 --company <Company words> --job-slug <job-slug> --title <Role Title words> --posting-url <Posting URL words> --kickoff-resume <kickoff-resume>`.
- The direct Python command `C:\Python311\python.exe scripts/init_application_folder.py "<Company>" "<job-slug>" --title "<Role Title>" --posting-url "<Posting URL>" --kickoff-resume "<kickoff-resume>"` is still valid as a fallback.
- That scaffolding step seeds `Applications/<Company>/<job-slug>/resume.tex` from the chosen kickoff resume and marks the folder as the active application in `preview/active-application.txt`.
- Store the raw or cleaned posting in `job-posting.md` inside the target application folder.

## 2. Requirement Audit

- Read:
  - `Profile/resume-rules.md`
  - `Profile/accomplishment-inventory.md`
  - `Profile/technology-map.md`
- Read prior materials in `Templates/Resumes/kickoff-resumes/`, `Templates/Resumes/resume-data/`, and older finalized applications in `Applications/` as source material only.
- Build a coverage map of:
  - required skills
  - preferred skills
  - domain keywords
  - leadership or scope signals
- Prompt Patrick for missing experience details when a requirement is materially relevant and not already supported by the durable docs.
- Record explicit non-matches early when the posting names tools Patrick has not used directly, so the draft can lean on analogous experience without overstating fit.
- Before editing `resume.tex`, present a proposed change list for Patrick to approve or reject item by item. That list should cover:
  - summary-line decision
  - section-order or section-heading changes
  - skills-section organization or label changes
  - candidate bullet additions, removals, or replacements
- Decide whether the posting is best served by:
  - the current section headings as-is
  - a reordering of sections
  - renamed section headings
  - a fuller refactor of how accomplishments are grouped
- Make an explicit yes/no decision on whether a top-level one-line summary is needed. Default to omitting it when the headings and structure already communicate the fit clearly.
- If a summary is omitted and space opens up, explicitly consider whether the strongest use of that space is:
  - another bullet
  - a short personality/passion line
  - the accomplishments section
  - leaving the space empty for readability
- Treat blank space as a valid outcome when none of the additions clearly strengthens the page.
- If a summary or personality line is used, prefer non-first-person noun-phrase framing such as `A platform engineer passionate about ...`.
- Favor the existing headings and skill labels when they already work. Do not rename sections or cut skills just for novelty.
- Do not apply top-level structural changes until Patrick approves them unless he explicitly asks for a direct first draft.

## 3. Draft Broadly First

- Start from the chosen kickoff resume under `Templates/Resumes/kickoff-resumes/`.
- Treat `Templates/Resumes/page-layouts/` as layout-only shells with placeholder text, not as content baselines.
- After the proposed change list is approved, apply the approved content and organization changes to the draft.
- Pull content ideas from:
  - `Templates/Resumes/resume-data/approved-resume-points/`
  - `Templates/Resumes/resume-data/approved-heading-sets.md`
  - `Templates/Resumes/resume-data/skills-inventory.md`
  - `Templates/Resumes/resume-data/work-history-summary.md`
  - prior finalized applications in `Applications/`
- Do not introduce a bullet into a generated resume unless it already exists in `approved-resume-points/` or Patrick has explicitly approved adding it there first.
- If the current section headings do not directly speak to the posting, reorder sections, rename headings, or regroup accomplishments before polishing bullet wording.
- Keep heading changes disciplined: headings should summarize the contents accurately, not just mirror job-posting terminology.
- Treat older wording variants for the same accomplishment as legacy phrasing, not as separate omitted points to keep re-listing in reviews.
- When Patrick rejects a wording pattern, persist that preference and do not reintroduce the rejected phrasing in later drafts.
- Prefer one-line bullets when they are equally strong; keep a two-line bullet only when the added words materially improve accuracy, clarity, or impact.
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
  - `Patrick Tierney.pdf`
- Recommended working artifact:
  - `working-notes.md`
- During drafting and review, prefer the exact command `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\compile_and_preview_current_resume.ps1`.
- That script is the canonical agent entry point for resume compilation and visual review. It compiles the active application resume when `preview/active-application.txt` points at a valid application folder; otherwise it falls back to `Templates/Resumes/page-layouts/current-standard/resume.tex`.
- The script also refreshes `preview/current-resume-preview.png` and, for application folders, updates both `resume.pdf` and `Patrick Tierney.pdf`.
- Whenever presenting a draft for Patrick to consider, include the compiled PDF and explicitly enumerate:
  - relevant documented knowledge or evidence from the full source-of-truth materials that remains omitted from the draft
  - wording changes made in the current draft
  - the summary-line decision and any heading/structure refactor decision
- If the structure changed, also summarize what was reorganized and what you were trying to achieve with that organizational shift.
- When the draft is being finalized, explicitly discuss:
  - how the final version will be saved and organized
  - what should be propagated into durable standards, templates, or source-of-truth docs
  - whether any materially reworded bullets should become reusable default phrasing or stay posting-specific
- Before any `git commit`, `git push`, or other action with effects outside this project folder, summarize the local changes, call out any design decisions that were not explicitly specified, and give Patrick a chance to validate.
- Once finalization is complete and Patrick has validated the local changes, make a git commit and push the finished state unless he explicitly says not to.
- In chat responses, include both:
  - a copy-pasteable absolute filesystem path to `Patrick Tierney.pdf`
  - an inline image render of `preview/current-resume-preview.png` as the default visual review artifact
- In the final completion message, also include the absolute filesystem path to the application folder containing the generated resume.
- Treat clickable local filesystem links in Codex as unsupported by default unless Patrick later confirms that a given format actually opens in the current client.
- Do not promote a guessed local-link format into durable workflow guidance before that validation step.
- The shipped default is to provide plain copy-pasteable absolute filesystem paths for the final PDF and containing application folder rather than relying on clickable local links.
- More generally, when Patrick flags a bug, broken workflow, or improper assumption during the process, verify the proposed fix before treating it as solved or persisting it into the workflow.

## 6. Persist Learnings

- Update `Profile/` docs whenever Patrick confirms new durable information or preferences.
- Update `Templates/Resumes/kickoff-resumes/` when a new class-of-role framing proves useful again.
- After Patrick finalizes an application resume, evaluate whether it should become a kickoff baseline. If it represents a distinct reusable direction, add or refresh a kickoff folder and README so future similar applications can start there directly.
- Update `Templates/Resumes/resume-data/` when approved bullets, heading sets, skills, or work-history framing change.
- Update the resume workflow skill when a process improvement becomes repeatable and has been validated when validation is relevant.

## 7. Protect Historical Records

- Never alter older application folders unless Patrick explicitly asks to reopen that application.
- Treat other folders under `Applications/` as finalized historical snapshots.

## Agent Execution Notes

- In this workspace, the default shell is `cmd`, not PowerShell. Do not start by using bare `Get-ChildItem`, `Get-Content`, or `powershell` aliases.
- In this workspace, `git` may not be on `PATH`. Prefer the full executable path `C:\PROGRA~1\Git\cmd\git.exe`.
- If common executables are missing from the shell, inspect `Workflow/agent-environment.md`, run `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\show_tool_locations.ps1`, or use `C:\Windows\System32\cmd.exe /c call .\scripts\with-agent-path.cmd <command>` for a one-off repaired PATH.
- Prefer the repository scripts above over raw `pdflatex`, direct preview-rendering helpers, or ad hoc file-copy commands.
- Only fall back to manual compile commands when the scripted workflow is broken and you have already checked the documented entry points.
