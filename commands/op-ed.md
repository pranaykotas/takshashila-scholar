---
name: op-ed
description: Draft a newspaper op-ed. Asks for the central argument, news peg, and target outlet; then drafts a 600–900 word piece in Pranay's voice. Applies writing-anti-ai pass before delivering.
---

Use the `op-ed-writing` skill to draft a newspaper op-ed.

Start by asking the user:
1. What is the central argument (one sentence)?
2. What is the news peg or hook (recent event, data point, or paradox)?
3. Which outlet is the target? (The Hindu / Indian Express / Mint / ORF / other)

Then:
- Draft the hook and thesis paragraph first.
- Share with the user; get confirmation before writing the full piece.
- Draft the full op-ed (600–900 words).
- Apply `writing-anti-ai` pass.
- Ask if the user wants to export to Google Docs.
