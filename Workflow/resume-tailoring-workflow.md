# Resume Tailoring Workflow

Use this workflow whenever tailoring Patrick Tierney's resume for a specific job posting.

## 1. Intake

- Capture the company name, role title, job-posting URL if available, and the full posting text.
- Scaffold the application folder early with `scripts/init_application_folder.py` once the company and job slug are clear.
- For agent use on this Windows workspace, prefer the exact command `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\init_application_folder.ps1 --company <Company words> --job-slug <job-slug> --title <Role Title words> --posting-url <Posting URL words>`.
- The direct Python command `C:\Python311\python.exe scripts/init_application_folder.py "<Company>" "<job-slug>" --title "<Role Title>" --posting-url "<Posting URL>"` is still valid as a fallback.
- That scaffolding step should also seed `Applications/<Company>/<job-slug>/resume.tex` from the current standard baseline and mark the folder as the active application in `preview/active-application.txt`.
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
- Record explicit non-matches early when the posting names tools Patrick has not used directly, so the draft can lean on analogous experience without overstating fit.
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

## 3. Draft Broadly First

- Start from the current layout:
  - `Templates/Resumes/page-layouts/current-standard/resume.tex`
- Pull content ideas from:
  - `Templates/Resumes/content-starting-points/`
  - `Profile/accomplishment-inventory.md`
  - `Profile/technology-map.md`
  - prior finalized applications in `Applications/`
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
- Once finalization is complete, make a git commit and push the finished state unless Patrick explicitly says not to.
- In chat responses, include both:
  - a direct link to `Patrick Tierney.pdf`
  - an inline image render of `preview/current-resume-preview.png` as the default visual review artifact
- In the final completion message, also include a direct link to the application folder containing the generated resume.
- For those local links, use standard markdown links with raw absolute filesystem paths, for example `[label](C:/path/with spaces/file.pdf)`.
- Do not URL-encode spaces, wrap local paths in angle brackets, or use `file://` URIs.
- Prefer including a direct file link such as the final PDF even when also mentioning the containing folder, because file links are more reliable than directory links in the Codex app UI.

## 6. Persist Learnings

- Update `Profile/` docs whenever Patrick confirms new durable information or preferences.
- Update `Templates/Resumes/content-starting-points/` when a new role-specific framing proves useful again.
- Update the resume workflow skill when a process improvement becomes repeatable.

## 7. Protect Historical Records

- Never alter older application folders unless Patrick explicitly asks to reopen that application.
- Treat other folders under `Applications/` as finalized historical snapshots.

## Agent Execution Notes

- In this workspace, the default shell is `cmd`, not PowerShell. Do not start by using bare `Get-ChildItem`, `Get-Content`, or `powershell` aliases.
- In this workspace, `git` may not be on `PATH`. Prefer the full executable path `C:\PROGRA~1\Git\cmd\git.exe`.
- If common executables are missing from the shell, inspect `Workflow/agent-environment.md`, run `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoProfile -File .\scripts\show_tool_locations.ps1`, or use `C:\Windows\System32\cmd.exe /c call .\scripts\with-agent-path.cmd <command>` for a one-off repaired PATH.
- Prefer the repository scripts above over raw `pdflatex`, direct preview-rendering helpers, or ad hoc file-copy commands.
- Only fall back to manual compile commands when the scripted workflow is broken and you have already checked the documented entry points.
