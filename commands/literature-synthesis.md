---
name: literature-synthesis
description: Synthesize sources on a policy topic from Zotero, web, and government documents. Produces a structured synthesis organized by theme (not source-by-source). Uses the literature-synthesis skill.
---

Use the `literature-synthesis` skill to synthesize sources on a topic.

Start by asking the user:
1. What is the specific research question or topic?
2. What time range? (default: last 5 years, plus seminal older works)
3. Are there sources already in Zotero, or do we start fresh?
4. Should we include government documents? (If yes, also invoke `government-source-finder` agent.)

Then:
- Search existing Zotero library first.
- Search web for additional sources (academic, government, think tank).
- Import new finds to Zotero.
- Synthesize by theme (not source-by-source).
- Create Obsidian synthesis note if vault is active.
- Ask if the user wants to export to Google Docs.
