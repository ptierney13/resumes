# Source Material Loading Order

Load source material in this order so the prompt stays grounded in durable facts before it moves into interpretation.

## 1. Role Framing Baseline

Start with the closest kickoff resume in `Templates/Resumes/kickoff-resumes/`.

Purpose:

- show the current broad positioning for similar roles
- anchor the likely tone and emphasis
- avoid asking Claude to invent a structure from scratch when a good baseline already exists

## 2. Durable High-Level Experience Summaries

Load:

- `Templates/Resumes/resume-data/work-history-summary.md`
- `Profile/accomplishment-inventory.md`
- `Profile/technology-map.md`

Purpose:

- give Claude a broad understanding of Patrick's history
- surface adjacent experience that may not appear in a single kickoff resume
- help Claude reason about scope, leadership, systems ownership, and tooling depth

## 3. Approved Reusable Resume Material

Load:

- `Templates/Resumes/resume-data/approved-heading-sets.md`
- `Templates/Resumes/resume-data/skills-inventory.md`
- relevant files from `Templates/Resumes/resume-data/approved-resume-points/`

Purpose:

- constrain Claude to supported bullet ideas and approved framing
- keep proposed section structures close to previously accepted patterns
- reduce the chance of unsupported or inflated claims

## 4. Fit Gaps And Guardrails

Load:

- `Profile/posting-gap-registry.md`
- `Profile/resume-rules.md`

Purpose:

- highlight known weak-fit or analog-fit areas
- prevent overclaiming
- preserve durable preferences about what a good resume should and should not do

## 5. Optional Historical Examples

Optionally load 1-3 previously finalized application resumes from `Applications/` that match the target role family.

Purpose:

- show what has already worked as a tailored expression of Patrick's history
- give Claude examples of prior grouping decisions

Do not overload the prompt with too many historical examples. Prefer the most similar ones.
