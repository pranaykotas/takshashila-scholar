<div align="center">

  <img src="LOGO.png" alt="Takshashila Scholar Logo" width="60%"/>

  <p>
    <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License"/>
    <img src="https://img.shields.io/badge/Claude_Code-Compatible-blueviolet?style=flat-square" alt="Claude Code"/>
    <img src="https://img.shields.io/badge/Forked_from-claude--scholar-blue?style=flat-square" alt="Forked from claude-scholar"/>
  </p>

</div>

> A structured policy reasoning toolkit for Takshashila researchers and students. Works as a [Claude Code](https://github.com/anthropics/claude-code) plugin. Combines Bardach's 8-step policy analysis methodology, stakeholder mapping, causal loop analysis, and publication-ready writing tools — all grounded in India's institutional context.

---

## Who is this for?

**If you are a student or first-time user:**
```
/student-start
```
This will orient you in 2 minutes and suggest a first exercise.

**If you are a researcher:**
```
/scholar
```
It asks two questions — what you are working on, and where you are in the process — and routes you to the right tool.

**If you have a specific policy problem to analyse:**
```
/policy-analysis [describe your problem]
```
Walks you through Bardach's 8 steps with India-specific guidance. Produces a Policy Analysis Memo.

---

## What this does

Takshashila Scholar supports three kinds of users at different stages:

### For students
- **Analyse a policy problem** systematically using Bardach's 8-step framework (`/policy-analysis`)
- **Find a framework** from Takshashila's 99-framework library (`find a framework for...`)
- **Critique an argument** — find logical flaws, unsupported claims, missing evidence (`/draft-review`)
- Learn the analytical vocabulary at [frameworks.pranaykotas.com](https://frameworks.pranaykotas.com)

### For researchers
The complete policy research lifecycle:

```
[H]  HYPOTHESIS     Turn an intuition into a testable, falsifiable claim
 ↓
[2]  SOURCES        Parliamentary committee reports, ministry documents, Zotero
 ↓
[3]  ACTORS         Interest × power matrix; veto players; coalition map
 ↓
[4]  CAUSAL MAP     Named loops, cross-connections, layer models, leverage points
 ↓
[5]  DRAFT          Op-ed, policy brief, discussion document, simulation, course module
 ↓
[6]  REVIEW         ← Available at any stage, not just at the end
 ↓
[7]  DISSEMINATE    Social posts, newsletter snippet, email pitch
```

`/draft-review` works at any stage — on a hypothesis, a source synthesis, a causal map, or a finished draft.

### For educators
- **Simulation design**: Complete policy simulations — scenario brief, role cards, facilitator guide, debrief (`simulation-design` skill)
- **Course content**: Lecture outlines, reading guides, case studies, discussion questions, rubrics (`course-content-writing` skill)
- **Frameworks library**: 99 frameworks in plain language for building vocabulary ([frameworks.pranaykotas.com](https://frameworks.pranaykotas.com))

---

## Intellectual tradition

Takshashila Scholar is built on the four commitments of the [Takshashila Institution](https://takshashila.org.in):

- **Freedom**: Support for individual liberty and limits on arbitrary state power
- **Pluralism**: Recognition of India's diversity and the legitimacy of multiple value systems
- **Citizenship**: Obligations of civic participation, accountability, and constitutional fidelity
- **Realism in international relations**: Foreign policy assessed by interests and power, not ideology

These commitments are embedded in every skill. The `takshashila-values-review` skill reviews drafts through these four lenses. They are made explicit so any researcher — not just those at the institution — understands the intellectual tradition they are working within.

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

Set path to frameworks.json (optional — enables local framework search):

```bash
export FRAMEWORKS_PATH="/path/to/frameworks/frameworks.json"
# Or clone the frameworks repo as a sibling: ../frameworks/frameworks.json
```

Then open Claude Code in your research project directory and run `/scholar` or `/student-start`.

For Zotero integration, see [MCP_SETUP.md](MCP_SETUP.md).
For Obsidian setup, see [OBSIDIAN_SETUP.md](OBSIDIAN_SETUP.md).

---

## Core tools

### Policy analysis (Bardach 8-step)

Systematic policy analysis using Bardach's *A Practical Guide for Policy Analysis* with Takshashila's India-specific lenses at each step.

```
/policy-analysis [problem description]
```

| Bardach Step | Takshashila Layer |
|---|---|
| 1. Define the problem | State capacity: spending / size / capability / ambition |
| 2. Assemble evidence | Parliament search, CAG reports, Union / State / Concurrent jurisdiction |
| 3. Construct alternatives | Markets, governments, societies — all can fail |
| 4. Select criteria | Better-or-worse not good-or-bad; political feasibility counts |
| 5. Project outcomes | Causal loop analysis; second-order effects |
| 6. Confront trade-offs | Implementation leakage; good intentions ≠ good outcomes |
| 7. Decide | Implementation capacity check; name the decision-maker |
| 8. Tell your story | Indian register; Takshashila language standards |

Produces a **Policy Analysis Memo**.

### Causal loop analysis

Makes the implicit theory of change in any policy argument explicit — as a Mermaid diagram with named feedback loops, cross-connections between loops, layer models for stacked interdependencies, and ranked leverage points.

Trigger: "causal analysis", "map the causal logic", "make my argument's theory of change explicit"

**Output includes:**
- Core causal chain as a single sentence ("X → Y → Z")
- Named reinforcing loops (R1 "ecosystem flywheel") and balancing loops (B1 "budget constraint")
- Cross-connections: where one loop undermines or amplifies another
- Layer model: which layer the intervention targets and what adaptation pressure it creates
- Structural actor positions in the causal map
- Leverage point ranking (magnitude × accessibility) → priority interventions

### Framework finder

Search 99 Takshashila policy frameworks by describing your problem.

Trigger: "find a framework for [problem]", "which framework applies to [topic]"

Matches against framework use cases and tags. Returns top 3–5 with one-sentence why-it-applies and links to [frameworks.pranaykotas.com](https://frameworks.pranaykotas.com).

### Stakeholder analysis

Interest × power matrix for any policy problem.

Trigger: "stakeholder analysis", "who are the actors in [topic]", "who can block this"

Produces: actor map, coalition analysis, veto player list, research implications.

---

## Commands reference

### Entry points

| Command | What it does |
|---------|-------------|
| `/scholar` | Routes you to the right tool based on your topic and stage |
| `/student-start` | First-session orientation for students and first-time users |
| `/policy-analysis` | Bardach 8-step policy analysis → Policy Analysis Memo |

### Research

| Command | What it does |
|---------|-------------|
| `/research-init` | Start a new research project |
| `/parliament-search [topic]` | Search 16 parliamentary committee reports by keyword |
| `/literature-synthesis` | Synthesize sources into a structured review |
| `/zotero-review` | Synthesize Zotero papers into Obsidian literature review |
| `/zotero-notes` | Batch create Obsidian notes from Zotero papers |

### Writing

| Command | What it does |
|---------|-------------|
| `/op-ed` | Draft newspaper op-ed (600–900 words, Indian outlets) |
| `/policy-brief` | Draft policy brief for ministry/committee audience |
| `/grant-proposal` | Scaffold grant proposal with theory of change |
| `/draft-review` | Full pre-submission review (any stage) |
| `/rebuttal` | Response to reviewer/editor comments |
| `/promote` | Post-publication: social posts, newsletter, email pitch |

---

## Skills reference

### Analysis

| Skill | What it does |
|-------|-------------|
| `bardach-policy-analysis` | 8-step policy analysis with India-specific lenses |
| `find-framework` | Search 99 frameworks by problem description |
| `hypothesis-development` | Turns intuition into testable claim; produces Research Brief |
| `stakeholder-analysis` | Interest × power matrix; coalition map; veto player analysis |
| `causal-loop-analysis` | Named loops, cross-connections, layer models, leverage points |
| `research-ideation` | Exploratory research startup |
| `citation-verification` | Multi-layer citation check |

### Writing

| Skill | What it does |
|-------|-------------|
| `op-ed-writing` | Newspaper op-eds in Takshashila researcher voice |
| `policy-brief-writing` | Structured briefs for ministry/committee audiences |
| `discussion-document-writing` | Takshashila-format discussion documents |
| `grant-proposal-writing` | Proposals with theory of change and logframe |
| `simulation-design` | Complete policy simulations for adult learners |
| `course-content-writing` | Lecture outlines, reading guides, case studies, rubrics |
| `writing-anti-ai` | Remove AI writing patterns; keep prose expert and natural |
| `post-acceptance` | Post-publication promotion materials |

### Review

| Skill | What it does |
|-------|-------------|
| `argument-critique` | Fallacy taxonomy + FLAW/FIX format + editorial summary |
| `takshashila-values-review` | Four-lens values review (Freedom, Pluralism, Citizenship, Realism) |
| `paper-self-review` | Structure and completeness check |
| `review-response` | Systematic rebuttal of reviewer comments |

---

## Integrations

### ParliamentWatch

If you have [parliamentwatch](https://github.com/pranaykotas/parliamentwatch) installed locally, `/parliament-search` queries it directly. Covers all 16 Departmentally Related Standing Committees. Returns AI-summarised committee reports.

Setup: clone parliamentwatch to `~/Projects/parliamentwatch`.

### Frameworks library

[frameworks.pranaykotas.com](https://frameworks.pranaykotas.com) — 99 policy frameworks explained in plain language with use cases and tags. Clone the repo as `../frameworks/` to enable local search via the `find-framework` skill.

### Zotero

Import papers, government reports, and think tank publications. Read full text. Organize by project. See [MCP_SETUP.md](MCP_SETUP.md).

### Obsidian

Project knowledge base for research notes, daily logs, literature notes, drafts. See [OBSIDIAN_SETUP.md](OBSIDIAN_SETUP.md).

### Google Docs

Writing skills export directly to Google Docs for collaboration. Requires Google Workspace MCP.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) to add new skills, extend existing ones, or adapt this plugin for other South Asian institutional contexts.

---

## Forked from

Forked from [claude-scholar](https://github.com/Galaxy-Dawn/claude-scholar) by Galaxy-Dawn (MIT license). ML/CS-specific components replaced with policy research components. The Obsidian integration, Zotero MCP integration, and skill/agent/command architecture are retained and adapted.

## License

MIT
