# Working Notes

## Kickoff Resume

- `platform`

## Layout Notes

- Keep the scaffolded `platform` resume as the baseline reference until Patrick approves changes.
- The Ramp posting reads as shared-systems and internal-infrastructure ownership first, with reliability and observability as major supporting themes rather than the sole frame.

## Requirement Coverage

- Strong direct coverage:
- Internal platform and developer enablement: testing platform used by 150+ engineers, AI-tool consolidation, layout-engine/platform ownership, Azure DevOps repositories, CI/CD ownership
- Reliability and production ownership: on-call and incident response improvements, 99.9% Whiteboard availability, support/runbook systems, sovereign-cloud support model
- Observability and self-service diagnostics: OpenTelemetry framework, telemetry query DSL, telemetry query APIs, rollout dashboards
- Cross-team leadership: architected and led testing platform delivery, standards-setting for AI static analysis, production support/process ownership, mentoring
- AI-native engineering adjacency: consolidated AI tooling and defined standards for AI-driven static analysis
- Production software engineering depth: TypeScript/JavaScript, C#/.NET, backend services, API contracts, authentication, Azure microservices
- Partial or adjacent coverage to position carefully:
- Cloud provider requirement: strong Azure-backed evidence, but not direct AWS evidence
- Regulated-environment bonus: strong sovereign-cloud support analogs, but not direct FedRAMP claim
- Developer tooling / internal platform bonus: strong direct match
- Areas without current direct support:
- Terraform
- Cellular or multi-tenant architecture
- Temporal
- Fintech / payments domain
- Explicit SLO / error-budget wording
- Concrete database query-plan ownership

## Summary Line Decision

- Recommendation: no top summary line
- Reason: the platform kickoff already signals shared-systems ownership clearly, and the reclaimed space is likely more valuable for targeted infra and reliability bullets

## Heading And Structure Options

- Recommended base: keep the overall `platform-systems-default` structure rather than switching to the more split `devops-infra` structure
- Reason: Ramp emphasizes Production Engineering as full software engineers owning shared infrastructure, developer enablement, and cross-team architecture, which matches the platform framing well
- Proposed heading refinements for approval:
- `Platform & Framework Development` -> `Infrastructure & Developer Systems`
- `Operations, Reliability, & Production Support` -> `Reliability & Observability`
- `Backend Services & APIs` -> `Production Services & Distributed Systems`
- If Patrick prefers less renaming, the current headings are still serviceable and could be kept as-is

## Questions For Patrick

- None yet; the main gaps are unsupported tools and domains rather than missing documented experience

## Candidate Bullets

- Keep near the top:
- `Architected and led delivery of a testing platform used by 150+ engineers supporting Copilot Hub, standardizing automated testing`
- `Co-designed and implemented a telemetry platform for Microsoft Whiteboard using OpenTelemetry, making the service easier to diagnose in production while keeping developer overhead low`
- `Consolidated disparate AI tooling from across Microsoft teams into a unified, maintainable platform codebase`
- `Defined standards and requirements for an AI-driven static analysis system enforcing testing and compliance`
- `Established on-call and incident response practices, reducing incident resolution time by 80% and engineering support workload by 70%`
- `Built and managed CI/CD for Whiteboard and Copilot Hub, automating builds, testing, and validation`
- Likely keep:
- `Maintained 99.9% availability for Microsoft Whiteboard supporting school systems globally during COVID-19`
- `Built tooling and operational runbooks enabling customer support to resolve issues without engineer escalation`
- `Developed a public REST API surface and services architecture enabling Microsoft Whiteboard CRUD workflows`
- `Deployed and maintained authentication and authorization services for Whiteboard and Copilot Hub`
- `Maintained and Optimized the Edge Telemetry Data Processing Pipeline`
- `Built and managed CI/CD for Whiteboard and Copilot Hub, automating builds, testing, and validation`
- `Designed support and escalation model for sovereign government cloud environments (GCC, GCCH, DoD)`
- Candidates to de-emphasize or cut if space is tight after tailoring:
- `Mentored three interns who all returned to Microsoft as full-time engineers`
- Potentially one of the more product-shaped API bullets if the page needs room for stronger production-engineering alignment

## Relevant Documented Points Not Included In Current Draft

- `Designed support and escalation model for sovereign government cloud environments (GCC, GCCH, DoD)` is still in the draft, but the more technical logging-guardrails variant remains omitted
- `Created and maintained Azure DevOps repositories for internal analytics utilities, including CI/CD` was cut in favor of stronger production-engineering bullets
- `Mentored three interns who all returned to Microsoft as full-time engineers` was cut for space and because Ramp's posting reads more infrastructure-owner than people-development first

## Wording Changes Made

- Renamed the three Microsoft subsection headings to emphasize infrastructure systems, reliability/observability ownership, and production/distributed-service work
- Kept the approved platform/operations OpenTelemetry variant: `telemetry platform ... easier to diagnose in production`
- Updated the on-call bullet to explicitly emphasize root-cause-oriented practices
- Restored all previously removed skills and the layout-logic bullet
- Reworked the third section around new approved Whiteboard/Copilot and Edge telemetry production-systems wording, and moved the CI/CD bullet into that section

## Propagation Decisions

- None yet; revisit after Patrick approves edits and the tailored wording settles
