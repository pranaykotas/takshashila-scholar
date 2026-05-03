<div align="center">

  <img src="LOGO.png" alt="Takshashila Scholar Logo" width="60%"/>

  <p>
    <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License"/>
    <img src="https://img.shields.io/badge/Claude_Code-Compatible-blueviolet?style=flat-square" alt="Claude Code"/>
    <img src="https://img.shields.io/badge/Forked_from-claude--scholar-blue?style=flat-square" alt="Forked from claude-scholar"/>
  </p>

</div>

> A semi-automated research assistant for public policy researchers, built for the [Takshashila Institution](https://takshashila.org.in). Works as a [Claude Code](https://github.com/anthropics/claude-code) plugin. Turn an intuition into a rigorous argument — with stakeholder maps, causal analysis, and publication-ready drafts.

---

## Start here

If you are a Takshashila researcher and this is your first time, run:

```
/scholar
```

It will ask you two questions — what you are working on, and where you are in the process — and route you to the right tool. You do not need to know all the commands listed below.

---

## What this does

Takshashila Scholar supports the complete policy research lifecycle, from the first intuition to the published piece. It is designed for researchers who already have domain knowledge and need help making their arguments more rigorous, their evidence more systematic, and their writing cleaner.

```
[H]  HYPOTHESIS     Turn an intuition into a testable claim
 ↓
[2]  SOURCES        Find parliamentary committee reports, ministry documents, academic papers
 ↓
[3]  ACTORS         Map who has power, who has interest, who can block
 ↓
[4]  CAUSAL MAP     Make the argument's causal logic explicit; find leverage points
 ↓
[5]  DRAFT          Write the op-ed, policy brief, simulation, or course module
 ↓
[6]  REVIEW         ← Available at any stage, not just at the end
 ↓
[7]  DISSEMINATE    Social posts, newsletter, email pitch
```

**Two ways to start:**
- **You already have a hypothesis** → run `hypothesis-development` skill first, then gather sources
- **You are still exploring** → run `/research-init` first, gather sources, then crystallise your hypothesis

`/draft-review` works at any stage. Use it on your hypothesis, a source synthesis, a causal map, or a finished draft.

---

## Installation

### Prerequisites
- [Claude Code](https://github.com/anthropics/claude-code) installed
- A local [Obsidian](https://obsidian.md) vault (recommended; not mandatory)
- [Zotero](https://zotero.org) with the [Zotero MCP server](MCP_SETUP.md) (recommended)

### Install

```bash
# As a global Claude Code plugin (applies to all your projects)
git clone https://github.com/pranaykotas/takshashila-scholar ~/.claude/plugins/takshashila-scholar

# Or as a project-level plugin (in a specific research project)
git clone https://github.com/pranaykotas/takshashila-scholar .claude/plugins/takshashila-scholar
```

Set your Obsidian vault path (optional but recommended):

```bash
export OBSIDIAN_VAULT_PATH="/path/to/your/vault"
```

Then open Claude Code in your research project directory and run `/scholar`.

For Zotero integration, see [MCP_SETUP.md](MCP_SETUP.md).
For Obsidian setup, see [OBSIDIAN_SETUP.md](OBSIDIAN_SETUP.md).

---

## The research lifecycle in detail

### Stage H: Hypothesis development

Every piece of policy research rests on a hypothesis — an empirical or causal claim that can, in principle, be proved wrong. This skill turns a researcher's intuition into a rigorous, testable statement.

**What it asks:**
- State your hypothesis in one sentence
- What would have to be true to prove you wrong?
- Is this an empirical claim, a causal claim, or a normative claim?

**What it produces — a Research Brief containing:**
- The refined, falsifiable hypothesis
- A decomposition into empirical, causal, and normative claims
- A skeleton causal diagram
- Key assumptions, ranked by fragility
- Specific evidence requirements (what you must find to publish this argument)
- The strongest competing hypothesis

The Research Brief anchors every subsequent stage. The final draft should be consistent with it.

**Trigger phrases:** "I have a hypothesis", "I want to argue that", "help me test my idea"

---

### Stage 2: Sources

Three ways to find Indian policy evidence:

| Tool | What it searches |
|------|-----------------|
| `/parliament-search [topic]` | All 16 Departmentally Related Standing Committees — finds committee reports on any policy topic |
| `government-source-finder` agent | Ministry websites, CAG reports, regulatory consultations, PRS India |
| `/zotero-review` | Your Zotero library |

Parliamentary committee reports are primary sources — non-partisan, evidence-rich, and often overlooked. Search them first.

---

### Stage 3: Stakeholder analysis

Maps the political economy of the policy problem. Uses the standard **interest × power matrix**.

**What it produces:**
- All actors plotted on a 2×2 grid (high/low power × high/low interest)
- Coalition map: who supports, who opposes, who could swing
- Veto player analysis: who must be on-side for the policy to pass
- Research implications: whose objections the argument must pre-empt

**Indian institutional patterns built in:** inter-ministerial turf, Centre-state federalism, parliamentary committee as stakeholder, industry association vs. individual firm interests.

**Trigger phrases:** "stakeholder analysis", "who are the actors in", "who can block this"

---

### Stage 4: Causal loop analysis

Makes the argument's implicit theory of change explicit — as a Mermaid diagram with feedback loops, unsupported links, and ranked leverage points.

**What it produces:**
- Causal map (Mermaid diagram, renders in Obsidian and GitHub)
- Loop inventory: reinforcing loops (amplifiers) and balancing loops (constraints)
- Unsupported links: which causal claims are cited vs. assumed
- **Leverage point ranking** (new): each intervention ranked by magnitude × accessibility — priority interventions sit in the top-right quadrant
- **Policy intervention menu** (new): concrete, actor-specific recommendations derived from the leverage points

**Trigger phrases:** "causal analysis", "map the causal logic", "what are the leverage points"

---

### Stage 5: Drafting

| Output | Command / Skill | Length / Format |
|--------|----------------|-----------------|
| Newspaper op-ed | `/op-ed` | 600–900 words; Indian outlets |
| Policy brief | `/policy-brief` | 1500–3000 words; ministry/committee audience |
| Discussion document | `discussion-document-writing` skill | 2000–6000 words; Takshashila format |
| Grant proposal | `/grant-proposal` | Theory of change + logframe |
| **Policy simulation** | `simulation-design` skill | Scenario brief + role cards + facilitator guide + debrief |
| **Course content** | `course-content-writing` skill | Lecture outline, reading guide, case study, discussion questions, rubric |

All drafts check against the Research Brief from Stage H.

#### Simulations

Takshashila simulations are for GCPP, MIPP, and executive education participants — working professionals, civil servants, journalists. They are built around genuine role tension (every actor faces a real trade-off), Indian institutional context (inter-ministerial committees, state-centre negotiations), and a debrief that connects to real policy history.

The skill produces four documents: scenario brief (shared with all), role cards (confidential per actor), facilitator guide (instructor only), and debrief template.

#### Course content

Content is designed for adult learners — no oversimplification, Indian examples first, discussion questions that require analysis not recall. Modules can include any combination of: lecture outline, reading guide, case study, discussion questions, assessment rubric.

---

### Stage 6: Review

`/draft-review` runs a full pre-submission check. It can be invoked at any stage — on a hypothesis, a source synthesis, a causal map, or a complete draft.

**What it runs:**

| Check | What it catches |
|-------|----------------|
| `paper-self-review` | Structure and completeness |
| `argument-critique` | Logical flaws + concrete fixes (see below) |
| `takshashila-values-review` | Alignment with Takshashila's four commitments |
| `causal-loop-analysis` | Causal vulnerabilities |

#### Argument critique (enhanced)

The critique now scans explicitly for ten named logical fallacies:

| Fallacy | Example |
|---------|---------|
| Circular reasoning | Conclusion restated as a premise |
| False dilemma | Only two options when more exist |
| Correlation-causation conflation | Association presented as mechanism |
| Hasty generalisation | One case generalised; India as monolith |
| Appeal to authority | Expert cited without engaging their argument |
| Slippery slope | Unwarranted consequence chain |
| Strawmanning | Counterargument addressed in weakened form |
| Loaded language | Emotionally charged terms doing argumentative work |
| Scope creep | Conclusion wider than evidence |
| Non sequitur | Conclusion does not follow from premises |

Every flaw found must include:
```
FLAW: [what's wrong — one sentence]
FIX: [concrete rewrite or structural change]
```

The output begins with an Editorial Summary:
```
VERDICT: Accept / Accept with revisions / Major rework needed
CORE ISSUE: [the single most important problem]
FIRST FIX: [the one thing to address before anything else]
```

---

### Stage 7: Dissemination

`/promote` generates social media posts, newsletter snippets, and email pitches after a piece is published.

---

## Commands

### Entry point

| Command | What it does |
|---------|-------------|
| `/scholar` | **Start here.** Routes you to the right stage based on your topic and where you are in the process. |

### Research workflow

| Command | What it does |
|---------|-------------|
| `/research-init` | Start a new research project (Obsidian setup, Zotero collection, research question) |
| `/parliament-search [topic]` | Search 16 parliamentary committee reports by keyword; get AI summaries |
| `/literature-synthesis` | Synthesize sources into a structured review |
| `/zotero-review` | Read Zotero papers; synthesize into Obsidian literature review |
| `/zotero-notes` | Batch create Obsidian notes from Zotero papers |

### Writing

| Command | What it does |
|---------|-------------|
| `/op-ed` | Draft a newspaper op-ed |
| `/policy-brief` | Draft a policy brief |
| `/grant-proposal` | Scaffold a grant proposal with theory of change |
| `/draft-review` | Full pre-submission review (available at any stage) |
| `/rebuttal` | Generate response to reviewer/editor comments |
| `/promote` | Generate promotion content |
| `/presentation` | Create presentation outline |

### Obsidian

| Command | What it does |
|---------|-------------|
| `/obsidian-init` | Bootstrap project knowledge base |
| `/obsidian-ingest` | Ingest file or directory into vault |
| `/obsidian-review` | Synthesize Obsidian notes into literature review |
| `/obsidian-sync` | Force incremental or full repair sync |
| `/obsidian-link` | Repair wikilinks |
| `/obsidian-note` | Archive, purge, or rename a single note |
| `/obsidian-project` | Detach, archive, or rebuild a project knowledge base |

---

## Skills

### Analysis

| Skill | What it does |
|-------|-------------|
| `hypothesis-development` | Turns intuition into testable claim; produces Research Brief |
| `stakeholder-analysis` | Interest × power matrix; coalition map; veto player analysis |
| `causal-loop-analysis` | Causal diagram + loop inventory + leverage point ranking + intervention menu |
| `research-ideation` | Exploratory research startup; gap analysis; Zotero integration |
| `citation-verification` | Multi-layer citation check |
| `daily-paper-generator` | Track new publications on a topic |

### Writing

| Skill | What it does |
|-------|-------------|
| `op-ed-writing` | Newspaper op-eds; Indian outlets; evidence-based voice |
| `policy-brief-writing` | Structured briefs for ministry/committee audiences |
| `discussion-document-writing` | Takshashila-format discussion documents |
| `grant-proposal-writing` | Proposals with theory of change and logframe |
| `simulation-design` | Complete policy simulations for adult learners |
| `course-content-writing` | Lecture outlines, reading guides, case studies, discussion questions, rubrics |
| `literature-synthesis` | Cross-source synthesis |
| `writing-anti-ai` | Remove AI writing patterns; keep prose expert and natural |
| `post-acceptance` | Post-publication promotion materials |

### Review

| Skill | What it does |
|-------|-------------|
| `argument-critique` | Fallacy taxonomy + FLAW/FIX format + editorial summary |
| `takshashila-values-review` | Four-lens values review |
| `paper-self-review` | Structure and completeness check |
| `review-response` | Systematic rebuttal of reviewer comments |

---

## Agents

Agents handle multi-step research tasks that require coordinating several tools.

| Agent | What it does |
|-------|-------------|
| `government-source-finder` | Finds Indian government documents — ministry websites, CAG, parliamentary committee reports, regulatory filings |
| `policy-analyst` | Evidence mapping, policy gap identification |
| `literature-reviewer` | Systematic literature review with Zotero MCP |
| `grant-writer` | Full grant proposal drafting with funder alignment |
| `rebuttal-writer` | Systematic rebuttal for peer review |
| `paper-miner` | Extract writing patterns from exemplar policy papers |
| `research-knowledge-curator-obsidian` | Maintain Obsidian vault alongside research work |

---

## Integrations

### ParliamentWatch

If you have [parliamentwatch](https://github.com/pranaykotas/parliamentwatch) installed locally, `/parliament-search` will query it directly — no web scraping required. Searches all 16 Departmentally Related Standing Committees. Returns AI-summarized committee reports as Markdown.

Setup: clone parliamentwatch to `~/Projects/parliamentwatch` and follow its README.

### Zotero

Import papers, government reports, and think tank publications. Read full text. Organize by project. Export BibTeX. See [MCP_SETUP.md](MCP_SETUP.md).

### Obsidian

Project knowledge base. Research notes, daily logs, literature notes, drafts, and institutional memory. See [OBSIDIAN_SETUP.md](OBSIDIAN_SETUP.md).

### Google Docs

Writing skills can export directly to Google Docs for collaboration. Requires Google Workspace MCP configured in Claude Code settings.

---

## For Takshashila researchers

This tool is in active development for internal Takshashila use. A few things to know:

- **Start with `/scholar`** — don't try to learn all the commands first
- **The Research Brief is the key document** — everything else references it
- **`/draft-review` can be used at any stage** — not just when you have a finished draft
- **Indian context is built in** — committee reports, PLI schemes, Union Budget, DRSC structure, GST Council, Centre-state dynamics are all understood
- If something doesn't work as expected, raise it with Pranay or open a GitHub issue

---

## Forked from

Forked from [claude-scholar](https://github.com/Galaxy-Dawn/claude-scholar) by Galaxy-Dawn (MIT license). ML/CS-specific components replaced with policy research components. The Obsidian integration, Zotero MCP integration, and skill/agent/command architecture are retained and adapted.

## License

MIT
