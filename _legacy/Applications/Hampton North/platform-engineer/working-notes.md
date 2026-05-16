# Working Notes

## Requirement Coverage

- Full lifecycle ownership and production support: strong evidence from leading the Copilot Hub testing platform, owning CI/CD, establishing on-call practices, and supporting Whiteboard availability in production.
- Security and automation: strong evidence from secure credential and certificate management microservices plus OAuth/JWT backend work.
- Internal tooling and friction reduction: strong evidence from unified AI tooling, testing platform work, CI/CD automation, and support/runbook tooling.
- TypeScript backend credibility: strong on TypeScript and backend/platform APIs, and Patrick has confirmed direct Node.js experience; NestJS is still not evidenced in durable docs.
- Data stores: SQL is supported; MongoDB and Postgres are not part of Patrick's confirmed direct experience.
- Infrastructure as code / Terraform: not part of Patrick's confirmed direct experience; closest durable evidence is manually managed CI/CD and Azure-centric automation.
- AWS ownership: not part of Patrick's confirmed direct experience; closest current evidence is Azure services, sovereign cloud support, and production operations.
- Async distributed collaboration: leadership, mentoring, and cross-team coordination are evidenced, but remote/async specifics are not documented.
- Startup pace: no explicit startup evidence found yet.

## Summary Line Decision

- Do not use a top-level summary for the current Hampton North draft.
- Reason: the current section headings already make the platform/backend/operations fit clear enough, and the reclaimed space is more valuable as readability than as another generic line.

## Heading And Structure Options

- Put `Platform & Framework Development` first and make it the center of gravity for the resume.
- Treat testing platform, telemetry platform, static analysis, unified AI tooling, and shared telemetry-query capabilities as platform work rather than scattering them across tooling and observability buckets.
- Keep tooling points in the platform section and phrase them as shared systems other engineers depended on.
- Merge CI/CD back into `Operations, Reliability, & Production Support` for this draft because delivery systems, on-call ownership, uptime, support models, and runbooks all contribute to one operational-ownership story here.
- Keep `Backend Services & APIs` as the separate supporting section after platform and operations.

## Questions For Patrick

- No open technology questions at the moment.
- Current remaining fit risk is primarily stack mismatch rather than missing clarification.

## Candidate Bullet Direction

- Emphasize platform ownership, CI/CD, production support, and internal developer enablement as the core story.
- Keep the secure credential/certificate management microservices bullet to cover the posting's security angle.
- Keep the on-call and 99.9% availability bullets to show operational ownership beyond implementation.
- Keep the testing platform and unified AI tooling bullets to show reusable systems that accelerate product teams.
- Reframe telemetry framework work as shared telemetry-platform development where accurate.
- Put tooling bullets in the platform section and phrase them as shared systems other engineers depended on.
- Keep CI/CD and on-call together under operations/reliability rather than splitting them into separate operational buckets.
- Continuously reorder bullets within each section so the strongest and clearest platform evidence lands first.

## Relevant Documented Points Not Included In Current Draft

- Designed telemetry query APIs ensuring statistically valid results for product experimentation and feature analysis.
- Optional personal achievements and interests remain omitted because they do not strengthen this target role.

## Proposed Resume Wording Swaps

- Keep: "Architected and led delivery of a testing platform used by 150+ engineers supporting Copilot Hub, standardizing automated testing"
- Keep: "Developed Azure microservices enabling secure credential and certificate management for internal infrastructure"
- Keep: "Built and managed CI/CD for Whiteboard and Copilot Hub, automating builds, testing, and validation"
- Keep: "Established on-call and incident response practices, reducing incident resolution time by 80% and engineering support workload by 70%"
- Keep: "Maintained 99.9% availability for Microsoft Whiteboard supporting school systems globally during COVID-19"
- Reframe: "Co-designed and implemented an OpenTelemetry instrumentation framework for Microsoft Whiteboard, making observability consistent across the service while keeping developer overhead low"
  To: "Co-designed and implemented a telemetry platform for Microsoft Whiteboard using OpenTelemetry, making the service easier to diagnose in production while keeping developer overhead low"
- Reframe: "Enhanced a telemetry query DSL used by 1,000+ Edge engineers, improving analytics and diagnostic capabilities"
  To: "Enhanced a telemetry query DSL used by 1,000+ Edge engineers, improving analytics and diagnostic capabilities"
- Reorder: move platform work to the top of the Microsoft section, with the testing platform bullet first.
- Rename: `CI/CD & Internal Tooling` to `Operations, Reliability, & Production Support`.
- Restore the platform migration and layout-ownership bullets because they are materially relevant platform evidence and there was not sufficient justification to cut them.
- Reframe: "Led coordination for a team of 5 engineers during a C#-to-TypeScript/React platform migration"
  To: "Drove migration of Whiteboard's layout engine from C# to TypeScript/React within its backing framework"
- Swap out: "Designed telemetry query APIs ensuring statistically valid results for product experimentation and feature analysis"
  For: "Developed automation that generated dashboards from telemetry data for new feature rollouts" in `Operations, Reliability, & Production Support`
- Consider reintroducing mentoring under `Operations, Reliability, & Production Support` when it fits cleanly and strengthens the team-operations story.

## Draft Positioning

- Position Patrick as a platform/backend engineer who has repeatedly built the systems other engineers depend on, then supported them in production.
- Be explicit about transferable strengths for Terraform/AWS-heavy work without claiming hands-on tools that are not documented.
- Keep the final recruiter-facing export named `Patrick Tierney.pdf`.
- Use the summary plus the section order to tell a cleaner story: platform systems first, then operational ownership, then backend services.
- Treat the older "coordinated a team of 6 engineers" wording as legacy phrasing for the testing-platform accomplishment, not as a separate omitted point.
- Treat the older generalized layout-engine-features wording the same way: as legacy phrasing for the retained layout-engine work, not as a separate omitted point.
- Avoid gratuitous heading changes when the baseline wording already works.

## Propagation Decisions

- Recommended global wording: `Drove migration of Whiteboard's layout engine from C# to TypeScript/React within its backing framework`
- Recommended role-specific variant: `Co-designed and implemented a telemetry platform for Microsoft Whiteboard using OpenTelemetry, making the service easier to diagnose in production while keeping developer overhead low`
- Recommended reusable heading option: `Operations, Reliability, & Production Support`
