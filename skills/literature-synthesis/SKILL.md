---
name: literature-synthesis
description: Use this skill when the user asks to "synthesize sources", "review the literature on X", "summarize what we know about Y", or needs a structured synthesis of policy-relevant sources from Zotero, web PDFs, government reports, and think tank publications.
version: 1.0.0
tags: [Research, Literature, Synthesis, Policy]
---

# Literature Synthesis

Produces structured synthesis documents from heterogeneous policy sources: academic papers, government reports, think tank publications, and web PDFs. Integrates with Zotero and Obsidian.

## Source Types in Policy Research
Policy literature synthesis differs from academic literature review. Sources include:
- Academic peer-reviewed papers (SSRN, JSTOR, Google Scholar)
- Government documents: ministry reports, committee reports, budget documents, CAG reports
- Think tank publications: ORF, Carnegie, Brookings, IDFC Institute, NIPFP, CPPR
- International org reports: World Bank, IMF, OECD, ADB, UN agencies
- Regulatory filings and consultation papers: TRAI, SEBI, RBI, MCA
- News and investigative journalism (evidence, not analysis)

## Structure of Synthesis Output

### 1. Scope Note (100 words)
- What question does this synthesis address?
- Time range covered.
- Source types included and excluded.

### 2. What We Know (Evidence Map)
- Organize by sub-question or theme, not by source.
- For each sub-theme: what does the evidence say? How strong is it? Gaps?

### 3. Points of Consensus
- Where do sources agree? What is well-established?

### 4. Points of Disagreement or Uncertainty
- Where do sources disagree? What explains the disagreement?
- What remains unknown or contested?

### 5. Implications for the Research Question
- What does this synthesis enable or constrain for the user's specific question?
- What sources are missing that should be sought?

### 6. Source List
- Organized by type (academic / government / think tank / other).
- With brief annotation for key sources.

## Process

### Step 1: Define Scope
- Clarify research question and keywords with user.
- Agree on time range (default: last 5 years for policy; include seminal older works).
- Identify source types to include.

### Step 2: Collect Sources
- Check Zotero first: `zotero_search_items` for existing relevant items.
- Search web: Google Scholar, SSRN for academic; ministry sites for government; think tank sites directly.
- Use `government-source-finder` agent for Indian government document discovery.
- Import new finds to Zotero via `zotero_add_items_by_identifier` or `zotero_add_item_by_url`.
- Target: 15–40 sources for a focused synthesis; 40–80 for a broad survey.

### Step 3: Read and Extract
- For Zotero items: use `zotero_get_item_fulltext` for full text; fall back to abstract + metadata.
- For web PDFs: use `WebFetch` or `defuddle` skill for clean extraction.
- Extract per source: key claims, evidence type, methodology, limitations.

### Step 4: Synthesize
- Group by theme, not by source.
- Note consensus, disagreement, gaps.
- Avoid: a list of summaries per paper. Aim: a structured argument about what the evidence shows.

### Step 5: Output
- Write synthesis document (structure above).
- Create Obsidian synthesis map note if vault is active.
- Offer Zotero collection and Obsidian canvas.
- Offer export to Google Docs.

## Quality Checklist
- [ ] Synthesis organized by theme, not source-by-source
- [ ] Government and think tank sources included (not just academic)
- [ ] Evidence strength assessed (not all sources treated equally)
- [ ] Gaps and uncertainties noted
- [ ] All key claims traceable to sources
- [ ] Obsidian note created if vault is active
