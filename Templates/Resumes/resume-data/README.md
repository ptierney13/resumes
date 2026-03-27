# Resume Data

This folder is the authoritative content source for resume generation.

Resume tailoring should use this data in three layers:

1. Pick the best kickoff resume from `../kickoff-resumes/`.
2. Consult the approved points, heading sets, and skills here to decide what should change.
3. Apply only the necessary edits to the application-specific draft.

Core rules:

- No bullet should appear in a generated resume unless it is represented in `approved-resume-points/`.
- Accepted heading structures should be chosen from `approved-heading-sets.md` unless Patrick approves a new structure.
- Skills lists should be derived from `skills-inventory.md`.
- `work-history-summary.md` is the readable high-level reference for role fit, work history, and adjacent experience areas.
