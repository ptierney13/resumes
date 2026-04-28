# Posting Gap Registry

This file records how Patrick has handled specific requirement gaps in past applications. Each entry captures Patrick's actual experience level, any approved framing for analog positioning, and the rules for when that answer can be applied silently in future postings versus when to re-prompt.

Read this file during the Requirement Audit step before prompting Patrick about any gap. If a registry entry covers the requirement and the posting is sufficiently close to the entry's "apply silently when" condition, use the approved framing without re-asking.

---

## Terraform

**Patrick's direct experience:** None confirmed.

**Closest analog:** Azure DevOps YAML-based CI/CD pipelines and Azure-centric cloud automation. Conceptually adjacent to IaC tooling but not hands-on Terraform.

**Approved framing:** Position as cloud automation experience in Azure environments; do not claim Terraform directly. If the posting lists Terraform as a preferred or nice-to-have tool, note the gap in the proposal and offer to frame analogous Azure DevOps/CI experience instead. Do not use language that implies hands-on Terraform use.

**Apply silently when:** Terraform appears as a preferred or bonus skill, and the posting is primarily a DevOps, platform, or infrastructure role where Azure or general cloud automation experience is the core ask.

**Re-prompt when:** Terraform is listed as a primary or required skill, or the role is explicitly Terraform-specialist/heavy IaC. Ask Patrick whether he has gained any direct Terraform experience since this entry was last updated.

---

## AWS (EC2, ECS, RDS, S3, CloudWatch, etc.)

**Patrick's direct experience:** None confirmed. Background is Azure-centered.

**Closest analog:** Azure equivalents — Azure Container Apps or AKS for compute, Azure Blob Storage, Azure Monitor/Application Insights for observability.

**Approved framing:** Position as cloud-platform experience in Azure environments with transferable architecture knowledge. Note clearly in the proposal when AWS is a hard requirement. Do not claim AWS service experience directly.

**Apply silently when:** AWS is one of several listed cloud platforms and the posting does not require deep AWS-specific expertise (e.g., "experience with a major cloud provider").

**Re-prompt when:** AWS is the primary required cloud platform, or the role requires hands-on AWS operations, AWS certifications, or deep service-specific knowledge.

---

## Kubernetes / Container Orchestration

**Patrick's direct experience:** Not yet confirmed.

**Closest analog:** CI/CD pipeline ownership, Azure DevOps, and cloud service deployment work. Conceptual familiarity likely but no documented hands-on Kubernetes evidence.

**Approved framing:** Unknown — prompt Patrick if this requirement appears in a materially relevant posting.

**Apply silently when:** N/A — prompt first.

**Re-prompt when:** Always, until Patrick provides an answer and this entry is updated.

---

## MongoDB / PostgreSQL / NoSQL Databases

**Patrick's direct experience:** None confirmed. Relevant data-store experience comes from SQL, Azure-based data services, and telemetry/graph data models.

**Closest analog:** SQL and relational data modeling, Microsoft Graph resource models, Azure-backed telemetry data stores.

**Approved framing:** Frame through SQL and structured data modeling experience; do not claim NoSQL database hands-on use.

**Apply silently when:** Database experience is a supporting skill in a broader platform or backend role and SQL experience is an acceptable substitute.

**Re-prompt when:** The posting requires hands-on NoSQL/Postgres/MongoDB work as a core responsibility.

---

## How to Add a New Entry

When Patrick answers a gap question during a tailoring session, add an entry here immediately using the template below. Do not wait until finalization.

```
## <Technology or Requirement>

**Patrick's direct experience:** <None / Limited / Describe what exists>

**Closest analog:** <What in Patrick's background is most adjacent>

**Approved framing:** <Exact approved positioning language, or "Unknown — prompt first" if not yet answered>

**Apply silently when:** <The posting conditions under which this answer applies without re-asking>

**Re-prompt when:** <The posting conditions that warrant asking Patrick again>
```
