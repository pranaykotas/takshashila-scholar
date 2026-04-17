---
name: op-ed-writing
description: Use this skill when the user asks to "write an op-ed", "draft a newspaper article", "write a column", or needs a 600–900 word opinion piece for Indian newspapers or think tank platforms. Applies Pranay's writing style — domain-expert voice, direct argument, concrete hook.
version: 1.0.0
tags: [Writing, Op-Ed, India, Policy]
---

# Op-Ed Writing

Drafts newspaper op-eds and opinion columns for Indian policy audiences. Applies Pranay Kotasthane's established voice: domain-expert confidence, direct argument, plain language, concrete evidence.

## Target Outlets
- The Hindu, Indian Express, Mint, Business Standard (formal register)
- ORF, Carnegie India, Takshashila blog (think tank register)
- The Print, Scroll (slightly more accessible register)

## Structure

### Hook (50–100 words)
Open with ONE of:
- A specific recent event or news peg
- A surprising statistic or data point
- A concrete paradox or contradiction
- A sharp question

**Never** open with: historical preamble, definitions, "In recent years...", broad philosophical claims.

### Thesis (1–2 sentences)
State the central argument clearly. The reader should know what the piece argues after the first two paragraphs.

### Body (400–600 words)
- 3–4 paragraphs, each advancing the argument.
- Evidence → analysis → implication per paragraph.
- Use specific examples, not abstract principles.
- Anticipate and address the strongest counterargument (1 paragraph).

### Conclusion (80–120 words)
- Restate the argument at a higher level of generality.
- End with a concrete implication, recommendation, or sharp observation.
- **Never** end with "more research is needed" or "urgent attention is required".

## Voice Rules (from writing-style.md)
- No em dashes as stylistic crutch.
- No AI tells: "It is important to note", "In conclusion", "Delve into", "Nuanced", "Multifaceted".
- Active voice; named agents.
- Direct assertions; no hedged non-statements.
- Domain vocabulary used precisely.

## Process

1. Ask the user: what is the central argument, and what is the news peg (if any)?
2. Ask: target outlet?
3. Draft the hook and thesis paragraph first — confirm with user before proceeding.
4. Draft full piece.
5. Run `writing-anti-ai` pass.
6. Check word count: 600–900 words for most outlets.
7. Offer to export to Google Docs.

## Quality Checklist
- [ ] Hook is concrete and specific (not a historical preamble)
- [ ] Central argument stated by paragraph 2
- [ ] Each body paragraph advances the argument
- [ ] Counterargument addressed
- [ ] Conclusion has a specific implication or recommendation
- [ ] Word count 600–900
- [ ] No AI writing tells
- [ ] Indian policy terminology correct
