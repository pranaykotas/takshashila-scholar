---
name: discussion-document-writing
description: Use this skill when the user asks to "write a discussion document", "draft a Takshashila discussion paper", or needs a longer analytical document (2000–6000 words) that maps a policy problem, reviews evidence, and opens space for debate — without necessarily concluding with a single recommendation.
version: 1.0.0
tags: [Writing, Policy, DiscussionDocument, Takshashila]
---

# Discussion Document Writing

Produces Takshashila-style discussion documents: longer analytical pieces that map a policy problem, synthesize evidence, identify trade-offs, and frame the debate — without necessarily committing to a single recommendation.

## Purpose
Discussion documents differ from policy briefs in that they:
- Are written for an informed audience (researchers, practitioners, policymakers)
- Explore multiple perspectives and trade-offs more fully
- May present a range of recommendations or leave open questions for debate
- Are more suitable for complex, contested, or early-stage policy questions

## Structure

### Abstract (150–200 words)
- What question does this document address?
- What is the scope?
- What are the key findings or arguments?

### 1. Introduction
- Frame the policy problem.
- State why it matters now.
- Describe the structure of the document.
- 300–500 words.

### 2. Context and Background
- Regulatory, institutional, historical context.
- Key actors and their interests.
- Existing policy landscape.
- 500–1000 words.

### 3. Problem Analysis
- Disaggregate the problem into its components.
- Use frameworks where useful (e.g., market failure types, principal-agent problems, coordination failures).
- Draw on evidence: data, case studies, comparative examples.
- 800–1500 words.

### 3b. Causal Analysis (mandatory)
- State the central causal chain as a single sentence: "X → Y → Z"
- Identify the weakest link — the one step that, if broken, collapses the argument.
- Name the key reinforcing and balancing loops (e.g., R1 "ecosystem flywheel", B1 "budget constraint").
- Map cross-connections between loops: where does one loop undermine or amplify another?
- If the system has stacked interdependencies, name the layers and show which layer the intervention targets.
- Flag unsupported causal links explicitly.
- Use `causal-loop-analysis` skill to produce a Mermaid diagram and full loop inventory.
- 200–400 words of prose + diagram.

### 4. Policy Options / Debate
- Present the main positions or approaches in the literature/debate.
- For each: evidence base, assumptions, trade-offs, feasibility.
- Be fair to positions the author may not personally favor.
- 500–1000 words.

### 5. Analysis and Implications
- Author's own assessment.
- Which approaches are most promising? Why?
- What are the key uncertainties?
- 400–800 words.

### 6. Conclusion
- Summary of key findings.
- Open questions for further research or debate.
- 200–300 words.

### References
- Comprehensive; all claims sourced.

## Process

1. Ask the user: what is the core question this document addresses?
2. Ask: is this meant to conclude with recommendations, or is it primarily mapping the debate?
3. Pull sources from Zotero; supplement with web search.
4. Draft abstract and section headers — share structure with user before drafting body.
5. Draft section by section.
6. Apply `writing-anti-ai` pass.
7. Offer to export to Google Docs.

## Quality Checklist
- [ ] Abstract can stand alone
- [ ] Problem clearly framed with evidence
- [ ] Causal chain stated explicitly; weakest link identified
- [ ] Key loops named with descriptive names (not just R1/R2 labels)
- [ ] Cross-connections between loops noted where they exist
- [ ] Multiple perspectives fairly represented
- [ ] Trade-offs explicit
- [ ] Evidence cited throughout
- [ ] No AI writing tells
- [ ] Length 2000–6000 words

## Length Norms
- Short discussion note: 2000–3000 words
- Standard discussion document: 3000–5000 words
- Extended paper: 5000–8000 words
