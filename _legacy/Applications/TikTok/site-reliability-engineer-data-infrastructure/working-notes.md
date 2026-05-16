# Working Notes

## Kickoff Resume

- `devops-infra`

## Layout Notes

- Keep the approved `devops-infra` grouping so CI/CD, observability, reliability, API/data work, and platform depth each scan clearly.
- Treat the current application `resume.tex` as the unchanged baseline until Patrick approves the proposal below.
- The reset baseline compiles to one page cleanly.

## Requirement Coverage

- Strong coverage: service lifecycle ownership, production reliability, observability platforms, operational automation, CI/CD, incident response, user/support enablement, and cloud-backed infrastructure support.
- Strong supporting coverage: software-platform development, telemetry/data-layer APIs, Python and C++ in the skills section, and experience building systems used by large internal engineering populations.
- Adjacent but supportable: Azure-centered infrastructure and cloud operations are the closest direct analog to the posting's cloud-managed data infrastructure language.
- Gaps to avoid overstating: no durable direct evidence for Unix/Linux internals, networking, Kubernetes, Redis, MySQL, Docker, OpenStack, Hadoop, Spark, Flink, Java, Go, or Rust.

## Summary Line Decision

- Proposed: omit the top summary line.
- Rationale: the existing section headings already make the SRE/reliability fit clear, and the space is better used for concrete operational evidence.

## Heading And Structure Options

- Proposed: keep the approved `devops-infra-default` headings as-is rather than inventing a TikTok-specific data-infrastructure heading set.
- Proposed section-level changes against the unchanged kickoff baseline:
- `CI/CD & Internal Tooling`: keep testing platform, AI static analysis, AI-tool consolidation, and CI/CD ownership; move secure Azure microservices out of this section; cut Azure DevOps repositories because it is weaker than the other service-lifecycle bullets.
- `Observability & Telemetry`: keep OpenTelemetry, telemetry query DSL, and telemetry query APIs; replace rollout dashboards with the approved telemetry-governance/guardrails bullet because it maps better to TikTok's monitoring-framework and governed-SOA language.
- `Reliability & Incident Response`: keep the current four bullets as-is; this is already one of the strongest matches to the posting.
- `API & Data Layer Development`: add secure Azure microservices here so the page retains concrete infrastructure/service evidence in a better-fitting section; keep Graph API contracts; cut OAuth/JWT authentication if space is tight.
- `Platform & Framework Development`: keep layout migration, layout-engine tooling, and non-hierarchical layout logic as software-development depth; cut mentoring to keep the section tighter and more role-relevant.

## Questions For Patrick

- No blocking question for the first revision.
- If Patrick has direct Linux, Kubernetes, Redis, MySQL, Flink, Docker, networking, or distributed-systems experience that is not yet captured in the durable docs, it would materially strengthen a second pass.

## Candidate Bullets

- Keep: testing platform, AI static analysis standards, AI-tool consolidation, CI/CD ownership, OpenTelemetry framework, telemetry query DSL, telemetry query APIs, on-call improvements, 99.9% availability, sovereign-cloud support model, operational runbooks, secure credential microservices, Graph API contracts, layout migration, layout-engine tooling, non-hierarchical layout logic.
- Replace: rollout dashboards with the approved telemetry-governance/guardrails bullet.
- Cut or de-emphasize: Azure DevOps repositories, OAuth/JWT authentication, mentoring, optional achievements/interests.

## Relevant Documented Points Not Included In Current Draft

- Owned the Azure DevOps Artifacts npm feed for Copilot Hub shared components, managing package publishing, PR-based promotion, rollback, and CI-validated updates.
- Designed shared telemetry APIs, PR-time static analysis, and ingestion-time checks that blocked sensitive data from being logged.
- Implemented OAuth-based authentication and JWT access token validation for Whiteboard backend services, integrating with Azure AD scopes and permissions.
- Mentored three interns who all returned to Microsoft as full-time engineers.
- Optional accomplishments / hobbies section material.

## Wording Changes Made

- None yet. These are proposed changes against the unchanged kickoff baseline and have not been applied to `resume.tex`.

## Propagation Decisions

- Keep this proposal local to the TikTok application until Patrick reviews it.
- If the data-infrastructure framing proves reusable, consider promoting it later as a kickoff refinement rather than treating this proposal as durable by default.
