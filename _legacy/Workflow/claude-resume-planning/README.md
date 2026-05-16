# Claude Resume Planning

This folder documents an experimental process for using Claude as a resume-planning assistant before any resume drafting starts.

The process is intentionally isolated from the main architecture and workflow docs so it is easy to remove later. If you decide not to keep it, delete `Workflow/claude-resume-planning/` and nothing else needs to change.

## Purpose

Use this process when you want to give Claude:

- a target job description
- Patrick's durable resume source material
- the approved bullet inventory and work-history summaries

and get back a planning recommendation for how to shape a role-specific resume.

This process is for planning and analysis only. It does not authorize direct edits to `Applications/*/resume.tex`.

## Folder Map

- `inputs.md` explains what to gather before prompting Claude.
- `source-material.md` defines what local repo materials should be loaded into context.
- `prompt-template.md` contains the copy-pasteable Claude prompt template.
- `expected-output.md` defines the response contract Claude should follow.

## Recommended Use

1. Save or clean the job description.
2. Gather the local source material listed in `source-material.md`.
3. Fill in the template in `prompt-template.md`.
4. Send that prompt to Claude.
5. Use Claude's output as a proposal for section structure, bullet selection, fit scoring, and follow-up questions.

## Boundaries

- Treat Claude's output as a recommendation, not as final truth.
- Do not let Claude invent unsupported experience.
- Only turn suggested points into resume edits if they are already represented in the approved source material or are later validated and added durably.
