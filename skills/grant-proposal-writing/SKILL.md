---
name: grant-proposal-writing
description: Use this skill when the user asks to "write a grant proposal", "draft a funding application", "create a theory of change", or needs to prepare a proposal for an external funder. Applies the standards in rules/grant-writing.md.
version: 1.0.0
tags: [Writing, Grant, Funding, ToC]
---

# Grant Proposal Writing

Scaffolds and drafts grant proposals: structured funding applications with theory of change, logframe, budget narrative, and funder-aligned framing.

## Before Starting
Ask the user:
1. Who is the funder? (Name, type: foundation, government, bilateral aid, etc.)
2. What are the funder's stated priorities? (User provides or we search.)
3. What is the proposed programme/project?
4. What is the budget range?
5. Is there a specific template or format required?
6. What is the deadline?

## Default Structure
(Override with funder's template if provided.)

### Executive Summary (1 page max)
- Problem (1 sentence)
- Proposed solution (2–3 sentences)
- Expected impact (2–3 sentences)
- Budget ask and duration

### Problem Statement
- Specific, evidence-based description of the problem
- Why it matters to the funder's priorities
- Why now — what makes this moment the right time to act
- Why Takshashila — institutional fit and prior work
- Sources: peer-reviewed research, government data, credible think tank reports

### Proposed Programme/Project
- Objectives (SMART)
- Key activities
- Timeline with milestones
- Deliverables

### Theory of Change
```
Inputs → Activities → Outputs → Outcomes → Impact
```
- Make causal logic explicit at each step
- State assumptions underlying each causal link
- Identify key risks

### Team and Institutional Capacity
- PI and team credentials (brief)
- Takshashila's relevant track record
- Partnerships, if any

### Budget and Justification
- Line items with justification
- No unexplained lump sums
- Indirect cost rate if applicable

### Monitoring and Evaluation
- How will outputs and outcomes be measured?
- Who will verify?
- What will the funder receive and when?

### Sustainability
- What happens after the grant period?
- Is continued funding sought, or is the project self-terminating?

## Theory of Change Template

```markdown
## Theory of Change

**Problem**: [Specific problem statement]

**Our Intervention**: [What Takshashila will do]

**Causal Logic**:
- If we [Activity 1], then [Output 1], because [Mechanism/Assumption]
- If [Output 1] is achieved, then [Outcome 1], because [Mechanism/Assumption]
- If [Outcome 1] is achieved, then [Impact], because [Mechanism/Assumption]

**Key Assumptions**:
1. [Assumption 1]
2. [Assumption 2]

**Key Risks**:
1. [Risk 1] — Mitigation: [How we address it]
2. [Risk 2] — Mitigation: [How we address it]
```

## Process

1. Collect funder information (website, past grants, stated priorities).
2. Draft ToC first — align with user before drafting full proposal.
3. Draft executive summary — get approval before full draft.
4. Draft full proposal section by section.
5. Check: every claim about the problem is sourced; every budget line is justified.
6. Apply `writing-anti-ai` pass.
7. Offer to export to Google Docs.

## Quality Checklist
- [ ] Problem statement is specific and evidenced
- [ ] Theory of change is explicit (not implied)
- [ ] Objectives are SMART
- [ ] Outputs/outcomes/impact are distinguished
- [ ] Budget fully justified
- [ ] M&E plan is concrete
- [ ] Funder priorities reflected (not distorted)
- [ ] No AI writing tells
