# Resume Architecture

This directory is organized around three separate concerns:

1. `page-layouts/`
   Layout-only TeX shells used to preview visual structure. These files should contain placeholder content only so layout choice stays separate from content and positioning decisions.
2. `kickoff-resumes/`
   Fully formed resume baselines for broad classes of roles. Resume tailoring should generally start from the most appropriate kickoff resume rather than from a bare layout shell.
3. `resume-data/`
   The authoritative content model for resume generation. This folder stores the approved building blocks, accepted heading sets, skill inventory, and readable work-history summary that should drive future resume changes.

Workflow rule: choose a kickoff resume first, then tailor it by consulting `resume-data/`, and only then consider whether a different page layout would improve the presentation.
