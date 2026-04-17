---
name: draft-review
description: Full pre-submission review of a policy piece. Runs four checks in sequence: (1) structure and logic check, (2) argument critique, (3) Takshashila values review, (4) causal loop analysis. Produces a consolidated review memo the author can work from.
---

Run a full pre-submission review of the provided draft. Execute all four checks in sequence and produce a consolidated review memo.

## Steps

1. **Read the draft** — ask the user to paste or point to the file if not already provided.

2. **Structure review** — use `paper-self-review` skill:
   - Is the structure complete? (hook/intro, argument, evidence, conclusion/recommendation)
   - Are all claims connected to evidence?
   - Is the word count appropriate for the format?

3. **Argument critique** — use `argument-critique` skill:
   - Can the thesis be stated in one sentence?
   - Fatal flaws, major gaps, minor issues
   - Strongest points
   - Key unstated assumptions
   - Unanswered objection

4. **Values review** — use `takshashila-values-review` skill:
   - Freedom lens
   - Pluralism & Tolerance lens
   - Citizenship & Constitutional Values lens
   - Realism in IR lens (if applicable)
   - Overall framing check

5. **Causal loop analysis** — use `causal-loop-analysis` skill:
   - Extract causal claims
   - Render Mermaid diagram
   - Identify reinforcing/balancing loops
   - Flag unsupported links
   - Surface missing second-order effects
   - Identify leverage points

## Output Format

Produce a single consolidated review memo with four clearly labeled sections. Keep each section concise — the author needs to be able to scan this and act on it, not re-read the piece inside the review.

```
# Draft Review: [Piece Title or Topic]

## 1. Structure Check
[Brief assessment — what works, what's missing]

## 2. Argument Critique
[Fatal flaws / Major gaps / Minor issues / Strongest points]

## 3. Values Review
[Tensions per value, or "No tension found" per value]

## 4. Causal Map
[Mermaid diagram + loop inventory + unsupported links + missing effects]

## Summary: Top 3 Things to Fix Before Submission
1. [Most important]
2. [Second most important]
3. [Third most important]
```

End with the "Top 3 Things to Fix" summary — this is the actionable takeaway for the author.

## After the review

Offer to:
- Work through any specific issue flagged
- Redraft a section that has a fatal flaw
- Run `/causal-loop-analysis` again after revisions to check if the causal logic tightened
