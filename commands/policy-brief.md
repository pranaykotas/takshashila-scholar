---
name: policy-brief
description: Draft a policy brief. Asks for the policy problem, intended decision-maker audience, and available sources; then drafts a structured brief (executive summary + problem + options + recommendation).
---

Use the `policy-brief-writing` skill to draft a policy brief.

Start by asking the user:
1. What is the specific policy problem (one sentence)?
2. Who is the intended audience (which ministry, committee, regulator, or decision-maker)?
3. Are there sources already in Zotero, or do we need to search first?
4. What is the preferred length: short (800–1200 words), standard (1500–2500 words), or extended?

Then:
- If sources needed: use `literature-synthesis` skill or `government-source-finder` agent first.
- Draft executive summary; share with user before proceeding.
- Draft full policy brief.
- Apply `writing-anti-ai` pass.
- Ask if the user wants to export to Google Docs.
