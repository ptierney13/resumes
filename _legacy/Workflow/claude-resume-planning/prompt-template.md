# Claude Prompt Template

Copy this template and replace the bracketed placeholders.

```md
You are helping me plan a targeted one-page software-engineering resume.

Your job is not to write the final LaTeX resume. Your job is to analyze the role and my documented experience, then recommend the strongest way to organize and select evidence for the resume.

Use only the information I provide below. Do not invent experience, tools, leadership scope, metrics, or accomplishments that are not supported by the source material. If a requirement is only partially covered, say so directly and treat adjacent experience as adjacent rather than direct.

## Goal

Given:

- a job description
- my durable work-history and profile notes
- my previously approved resume bullet inventory
- my prior heading and kickoff-resume patterns

recommend the strongest resume plan for this role.

## What I Want Back

Please return all of the following:

1. A recommendation for the best 2-4 top-level sections to organize my work history into so a recruiter immediately sees why I fit the role.
2. For each section:
   - a short explanation of why it helps for this job
   - the specific work-history points or approved bullets that should be included there
3. A recruiter-fit score from 0-100, where:
   - 0 = severely mismatched
   - 100 = senior candidate with superb relevance and experience in the exact stack and problem space
4. The areas where this resume would still be weakest or least convincing.
5. A list of 2-4 focused follow-up questions that could uncover more relevant past experience or stronger evidence.

## Response Constraints

- Optimize for planning quality, not flattering language.
- Prefer a smaller set of stronger points over a long exhaustive list.
- Keep section titles concrete and recruiter-readable.
- If a current kickoff-resume structure is already close to ideal, say that instead of forcing a novel reorganization.
- Clearly separate direct evidence from adjacent evidence.

## Job Description

[PASTE JOB DESCRIPTION HERE]

## Kickoff Resume Baseline

[PASTE OR SUMMARIZE THE MOST RELEVANT KICKOFF RESUME HERE]

## Durable Work-History Summary

[PASTE WORK-HISTORY SUMMARY HERE]

## Approved Heading Sets

[PASTE RELEVANT HEADING OPTIONS HERE]

## Skills Inventory

[PASTE RELEVANT SKILLS HERE]

## Approved Resume Points

[PASTE THE MOST RELEVANT APPROVED POINT FILES OR EXCERPTS HERE]

## Additional Durable Profile Context

[PASTE ANY RELEVANT ACCOMPLISHMENT INVENTORY, TECHNOLOGY MAP, OR POSTING GAP CONTEXT HERE]

## Optional Prior Tailored Resume Examples

[PASTE 1-3 RELEVANT PRIOR EXAMPLES OR SUMMARIES HERE]
```
