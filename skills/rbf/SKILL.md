---
name: rbf
description: Use when the user asks to "RBF this", "reverse bollywood format this article/paper/PDF", "give me the RBF", "summarize this for a policymaker", "extract key arguments from this link/PDF/docx", or hands over a source (URL, PDF, DOCX, MD, TXT) wanting a short conclusion-first summary. Produces a ≤500-word executive summary that leads with the bottom line and the arguments/results — not an abstract, not a methodology recap.
version: 1.0.0
tags: [Research, Summarization, Policy, ExecutiveSummary, Takshashila]
---

# RBF — Reverse Bollywood Format

Turn one source document — an op-ed, paper, book chapter, or report, given as a URL, PDF, DOCX, MD, or TXT — into a short, conclusion-first executive summary for a busy policymaker.

Named for the format, not the input: Bollywood films build to the twist at the end. RBF runs it backwards — the answer comes first, the reasoning follows. Same principle as the RBF check in `paper-self-review`, applied here to someone else's writing instead of the user's own draft.

## When to Use This Skill

- User hands over a link, PDF, DOCX, or text file and wants the gist for a time-pressed reader.
- User wants "key arguments and results," not a description of what the paper is about.
- One source at a time. For synthesis across multiple sources, use `literature-synthesis` instead.
- Not a critique or evaluation of the argument's quality — use `argument-critique` for that.

## What This Is Not

- **Not an abstract.** An abstract describes what the paper is about and how it was done. RBF states what the source concludes or argues, and what it says should be done about it.
- **Not a methodology summary.** Skip how the research was conducted unless the method itself is the finding.
- **Not a place to add outside knowledge.** Every sentence in the output must trace back to something stated in the source. Do not invent arguments, extrapolate implications the source doesn't state, or add background the source never mentions — including an India Implications section if the source never raises India.

## Process

### Step 1: Get the full source text

- **URL:** fetch and extract the article's readable content (`defuddle` or `WebFetch` handles this cleanly).
- **Local file (PDF/DOCX/MD/TXT):** read the file directly (`Read` handles PDF, DOCX, and text formats natively).
- If the source can't be fetched or read, say so and stop. Don't summarize from a title or snippet alone.

### Step 2: Find the actual conclusion

Read past the abstract/intro to what the piece actually concludes or recommends — its thesis, finding, or call to action. This is often stated explicitly near the end, or in a "what should be done" section. This becomes the Bottom Line.

### Step 3: Pull out the load-bearing arguments and results

The 3–6 reasons, findings, data points, or pieces of evidence the source uses to support its conclusion. Skip throat-clearing, literature-review padding, and restatement of the problem — a policymaker already knows the problem exists; they want to know what the source says to do about it.

### Step 4: Check for an explicit India angle

Only include an India Implications section if the source itself discusses India, Indian policy, or an Indian institution by name. If the source is general or global and never mentions India, omit the section entirely — do not add one.

### Step 5: Draft and cut to fit 500 words

Draft to the template below, then cut to fit. Prefer cutting supporting detail over cutting the Bottom Line.

### Step 6: Self-check before returning output

- Does every bullet trace to a specific claim in the source? (If you can't point to where it says that, cut it.)
- Is the Bottom Line the source's conclusion, not a restatement of its topic or problem?
- Is it ≤500 words?
- Did you add an India section only if the source earned it?

## Output Format

```
**Source:** [Title, author, publication/outlet, date if available] — [URL or filename]

## Bottom Line
[1–3 sentences: the source's core conclusion, finding, or recommendation. This is the first thing a busy reader sees — make it stand alone.]

## Key Arguments & Results
- [Argument, finding, or data point 1]
- [Argument, finding, or data point 2]
- [...]

## India Implications
[Only if the source explicitly discusses India. Otherwise omit this section entirely.]
- [Implication as stated in the source]
```

## Additional Resources

- `examples/example-output.md` — a worked example showing the template applied to a sample op-ed, including what got cut and why.
