# Working Notes

## Kickoff Resume

- `devops-infra`

## Layout Notes

- Seeded from `devops-infra` and kept the operationally segmented structure because the posting is explicitly about CI/CD, assurance, release tooling, and production controls.
- No top summary for the first draft; the saved space is better used on security-adjacent infrastructure and incident/runbook evidence.
- Reverted the custom heading experiments and stayed with approved naming for the supporting backend and platform sections.

## Requirement Coverage

- CI/CD pipelines and developer platform tooling: strong coverage from the testing platform, CI/CD ownership, Azure DevOps Artifacts feed ownership, and AI-tool consolidation.
- Security/compliance gates: supported by the AI static analysis standards bullet plus telemetry guardrails, secure credential/certificate management, and OAuth/JWT backend security work.
- Cloud infrastructure and regulated environments: supported through Azure services, regulated-environment logging APIs, production availability ownership, and internal infrastructure services.
- Auditability, rollout visibility, and incident playbooks: supported through telemetry tooling, rollout dashboards, on-call improvements, and operational runbooks.
- Gaps to avoid overstating: no direct OCI, SBOM/Syft/Grype, SLSA/attestation, Kubernetes/Docker security, explicit audit-evidence ownership, or DR/backup testing evidence in the current durable docs.

## Summary Line Decision

- Omit the top summary. The subsection headings already communicate the DevOps / assurance fit, and keeping the line out preserves space for stronger concrete evidence.

## Heading And Structure Options

- Keep the `devops-infra` structure as the base because it lets CI/CD, observability, reliability, and platform security each read distinctly.
- Keep approved heading vocabulary for the supporting sections: `Backend Services & APIs` and `Platform & Framework Development`.

## Questions For Patrick

- No blocking questions for the first draft.
- Direct experience with artifact repositories, OCI, SBOM/SLSA, audits, Kubernetes, or explicit rollout strategies would materially strengthen later revisions if any of that exists.

## Candidate Bullets

- Keep: testing platform, AI static analysis standards, CI/CD ownership, Azure DevOps Artifacts feed ownership, telemetry/privacy guardrails, regulated-environment logging APIs, on-call improvements, operational runbooks, secure credential microservices, OAuth/JWT authentication
- De-emphasize: Graph API contracts, telemetry query APIs, mentoring, optional achievements/interests

## Relevant Documented Points Not Included In Current Draft

- Designed telemetry query APIs ensuring statistically valid results for product experimentation and feature analysis
- Designed data models and API contracts for programmatic access to Whiteboard resources via Microsoft Graph
- Mentored three interns who all returned to Microsoft as full-time engineers
- Designed support and escalation model for sovereign government cloud environments (GCC, GCCH, DoD)
- Optional accomplishments/hobbies section material

## Wording Changes Made

- Replaced the weaker Azure DevOps repositories bullet with the more relevant artifact-feed and promotion bullet.
- Reframed the telemetry-platform and sovereign-cloud stories into privacy/guardrail and regulated-environment logging bullets that are more specific to this posting.
- Reverted the custom section headings to approved naming and kept the CI/CD section ordered around testing, compliance, and pipeline ownership.
- Restored .NET, React, C++, R, Jest, and Playwright after mistakenly trimming them from the skills section.

## Propagation Decisions

- Persist the newly confirmed artifact-feed and telemetry-guardrail experience into durable docs now that Patrick has reviewed the classifications.
