# Inputs For The Process

This process takes one external input and several local context inputs.

## Required External Input

- The full job description, ideally cleaned into Markdown or plain text.

## Required Local Context

- The best-matching kickoff-resume family under `Templates/Resumes/kickoff-resumes/`
- `Templates/Resumes/resume-data/work-history-summary.md`
- `Templates/Resumes/resume-data/approved-heading-sets.md`
- `Templates/Resumes/resume-data/skills-inventory.md`
- Every relevant file in `Templates/Resumes/resume-data/approved-resume-points/`

## Recommended Local Context

- `Profile/accomplishment-inventory.md`
- `Profile/technology-map.md`
- `Profile/posting-gap-registry.md`
- `Profile/resume-rules.md`
- One or more previously finalized resumes in `Applications/` that resemble the target role

## Selection Guidance

- Choose the closest kickoff resume based on role family and positioning, not just technology keywords.
- Prefer approved bullet files that are directly relevant to the job description's requirements, scope, and stack.
- Include adjacent-fit material when the posting asks for something Patrick has not done with the exact same tool but has done with a clearly comparable responsibility.
- Include posting-gap registry context whenever the job description contains areas that are only partially covered.

## What This Process Should Produce

The final prompt passed into Claude should contain enough context for Claude to:

- identify the strongest relevant work-history points
- recommend 2-4 top-level sections for organizing the work history
- place the best points under each section
- estimate recruiter fit on a 0-100 scale
- call out the biggest missing areas
- ask 2-4 focused questions that could uncover stronger evidence
