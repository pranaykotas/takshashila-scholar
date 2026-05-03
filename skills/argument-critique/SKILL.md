---
name: argument-critique
description: Use this skill when the user asks to "critique this argument", "poke holes in this", "play devil's advocate", "hostile review", or as part of pre-submission review. Adversarially reviews a draft — identifies logical vulnerabilities, factual gaps, unstated assumptions, and missing counterarguments. Every critique comes with a path to fix it.
version: 1.0.0
tags: [Review, Critique, Arguments, Pre-submission]
---

# Argument Critique

Adversarial pre-submission review. Play the hostile reviewer: find the gaps, challenge the evidence, stress-test the logic. The goal is to surface weaknesses the author can address before external reviewers do.

## Principle

Every critique includes a one-line suggestion for addressing it. This is not demolition — it is stress-testing in service of a stronger piece.

---

## Review Dimensions

### 1. Central Argument Clarity

- Can the thesis be stated in one sentence? If not, the piece may be unfocused.
- Does the conclusion actually follow from the evidence and argument presented?
- Is the argument circular anywhere? (The conclusion restated as a premise.)
- Is the central claim falsifiable? What would have to be true for the argument to be wrong?

### 2. Evidence Quality

- What are the key empirical claims? List them.
- For each: what is the source? How strong/verifiable is it?
- Is there selection bias — evidence that supports the argument while ignoring contradictory data?
- Are sources appropriate for the claim? (Anecdote used as systemic evidence; one country's data generalized to India; outdated data presented as current.)
- Are there data points a reviewer would immediately flag as outdated, disputed, or from a low-credibility source?

### 3. Unstated Assumptions

- What must be true for this argument to hold? List the key assumptions.
- Which assumption is most vulnerable — if it were wrong, does the argument collapse?
- Are any causal claims actually correlational? ("A is associated with B" presented as "A causes B")
- Are there time-horizon assumptions? (Short-run vs. long-run effects)
- Are there scope assumptions? (Works in one context, not generalized.)

### 4. Counterarguments

- What is the strongest opposing position? Is it addressed?
- Who would object to this piece — and on what grounds? Be specific: which constituency, which analytical tradition, which empirical finding?
- Are there obvious objections missing? (A reviewer reading this will ask: "What about X?" — and X isn't in the piece.)
- Is the counterargument strawmanned (addressed in a weakened form) rather than engaged at its strongest?

### 5. Internal Consistency

- Does the conclusion follow from the premises?
- Are there contradictions between sections? (Introduction says X; conclusion implies not-X.)
- Does the framing in the opening match the argument in the body?
- Do the recommendations follow from the analysis, or do they feel grafted on?

### 6. Scope and Precision

- Is the argument overstated for the evidence? ("X proves Y" when the evidence shows "X is consistent with Y in context Z under assumptions A and B")
- Are there important boundary conditions not stated?
- Is "India" treated as a monolith when regional variation matters?
- Are terms defined consistently throughout? (A word used loosely in one place and precisely in another.)

---

## Logical Fallacy Taxonomy

Systematically scan for these named fallacies. When found, name them explicitly — do not just describe the problem.

| Fallacy | What to look for |
|---------|-----------------|
| **Circular reasoning** | Conclusion restated as a premise ("X is good policy because good policy has these features") |
| **False dilemma** | Only two options presented when more exist ("Either we subsidise fabs or we fall behind") |
| **Correlation-causation conflation** | Causal claim made from co-occurrence data alone |
| **Hasty generalisation** | One case or country generalised to all; India treated as monolith |
| **Appeal to authority** | Expert cited as evidence without engaging with the argument they made |
| **Slippery slope** | Unwarranted chain of consequences ("if A, then inevitably B, then C, then catastrophe") |
| **Strawmanning** | Counterargument engaged in weakened form |
| **Loaded language / framing bias** | Emotionally charged or politically loaded terms doing argumentative work |
| **Scope creep** | Conclusion is wider than the evidence ("this proves that X is always/never...") |
| **Non sequitur** | Conclusion does not follow from premises even if premises are true |

---

## Output Format

Produce a structured critique. **Always begin with the Editorial Summary.**

```
## Argument Critique

### Editorial Summary
VERDICT: [Accept as is / Accept with revisions / Major rework needed / Fundamental problem with argument]
CORE ISSUE: [The single most important problem — one sentence]
FIRST FIX: [The one thing to address before anything else]

---

### Central Argument
[State the thesis as you understood it in one sentence.]
[If the thesis is unclear, flag that first — unclear thesis is automatically a Major Gap.]

### Logical Fallacies Detected
[Scan systematically through the taxonomy above. Name each fallacy found.]

FALLACY: [Name from taxonomy]
WHERE: [Paragraph or section where it appears]
FLAW: [What's wrong, one sentence]
FIX: [Concrete rewrite or structural change — not just "remove this" but "rewrite as X" or "restructure paragraph Y to Z"]

[Repeat for each fallacy found. If none found, state: "No named logical fallacies detected."]

### Fatal Flaws (if any)
[Things that would cause a reviewer to reject or fundamentally question the piece.]
FLAW: [What's wrong]
FIX: [Concrete fix]

### Major Gaps
[Significant weaknesses that need addressing before submission.]
FLAW: [What's wrong]
FIX: [Concrete fix — specific enough that the author knows exactly what to write]

### Minor Issues
[Things to tighten that won't cause rejection but will improve the piece.]
FLAW: [What's wrong]
FIX: [Concrete fix]

### Strongest Points
[What the piece does well — what a sympathetic reviewer would highlight.]

### Key Assumptions (explicit)
[List the 2–4 assumptions the argument rests on. Author should verify these are defensible.]

### Unanswered Objection
[The one objection a hostile reviewer is most likely to raise. Is it in the piece? If not, suggest where and how to address it.]
```

---

## Calibration

**Be specific, not vague.** "The evidence is weak" is unhelpful. "The claim in paragraph 3 that India's semiconductor imports grew 40% relies on a 2019 NASSCOM report — this is outdated and should be replaced with MeitY 2024 data" is actionable.

**Be fair.** Flag genuine weaknesses. Do not manufacture problems or critique stylistic preferences as logical errors.

**Proportionate severity.** Most pieces have no fatal flaws. Use "Fatal flaw" only when the piece would be rejected or significantly misread as written. Most issues are Major or Minor.

**One fix per issue.** The author can disagree with your fix. The fix just needs to show that the issue is addressable, not that your suggested fix is the only solution.
