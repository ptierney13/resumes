# Expected Claude Output

Ask Claude to return a planning recommendation with the following parts.

## 1. Section Recommendation

Claude should recommend 2-4 top-level sections for organizing Patrick's work history so a recruiter can quickly see why he fits the role.

For each section, Claude should provide:

- the proposed section title
- why that section helps for this job
- the approved work-history points that belong there

## 2. Included Evidence

For each section, Claude should identify which bullets or accomplishments most need to be represented in the eventual resume.

Claude should prefer:

- approved bullet ideas
- durable facts from the profile docs
- prior accepted framing from kickoff resumes or finalized applications

Claude should avoid:

- inventing accomplishments
- requiring every relevant point to appear if a smaller, stronger set would read better

## 3. Recruiter-Fit Score

Claude should provide a score from 0 to 100.

Interpretation:

- `0` means the candidate is fundamentally mismatched for the role
- `50` means plausible but only moderately convincing fit
- `75` means strong fit with some notable gaps or weaker direct overlap
- `90+` means unusually strong direct alignment in scope, stack, and seniority

Claude should explain the score in a short paragraph that separates:

- strengths
- notable gaps
- uncertainty caused by missing evidence

## 4. Biggest Missing Areas

Claude should identify the areas where the eventual resume would still feel weakest to a recruiter.

These gaps can include:

- direct technology mismatch
- missing domain evidence
- insufficient leadership or scope proof
- missing scale, ownership, or outcomes
- claims that appear adjacent rather than direct

## 5. Follow-Up Questions

Claude should ask 2-4 targeted questions that could uncover stronger evidence from Patrick's past experience.

Good questions:

- aim at likely but currently under-documented experience
- try to turn adjacent experience into stronger, concrete evidence
- focus on missing recruiter confidence signals

Weak questions:

- ask for generic filler
- ask for information already clearly documented
- encourage embellishment
