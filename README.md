<div align="center">

  <img src="LOGO.png" alt="Takshashila Scholar Logo" width="60%"/>

  <p>
    <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License"/>
    <img src="https://img.shields.io/badge/Claude_Code-Compatible-blueviolet?style=flat-square" alt="Claude Code"/>
    <img src="https://img.shields.io/badge/Forked_from-claude--scholar-blue?style=flat-square" alt="Forked from claude-scholar"/>
  </p>

</div>

> Semi-automated research assistant for **public policy research**, built for the [Takshashila Institution](https://takshashila.org.in). Forked from [claude-scholar](https://github.com/Galaxy-Dawn/claude-scholar) and adapted for policy research workflows: literature synthesis, policy brief writing, op-ed drafting, grant proposals, and knowledge management.

Supports [Claude Code](https://github.com/anthropics/claude-code) with Zotero MCP and Obsidian integration.

## What This Does

Takshashila Scholar supports the full policy research lifecycle:

| Stage | What it helps with |
|---|---|
| **Ideation** | Research question formulation, gap analysis, literature framing |
| **Literature & Sources** | Systematic source collection (academic + government + think tank), Zotero integration, synthesis |
| **Drafting** | Op-eds, policy briefs, discussion documents, grant proposals |
| **Review** | Self-review checklist, argument critique, values alignment, causal loop analysis |
| **Dissemination** | Promotion content, newsletter snippets, presentation outlines |

## Quick Start

### Prerequisites
- [Claude Code](https://github.com/anthropics/claude-code) installed
- A local [Obsidian](https://obsidian.md) vault (recommended; not mandatory)
- [Zotero](https://zotero.org) with the [Zotero MCP server](MCP_SETUP.md) (recommended for source management)

### Installation

```bash
# Clone this repo as your Claude Code plugin directory
git clone https://github.com/pranaykotas/takshashila-scholar ~/.claude/plugins/takshashila-scholar

# Or add as a project-level plugin in your research project
git clone https://github.com/pranaykotas/takshashila-scholar .claude/plugins/takshashila-scholar
```

Then follow [MCP_SETUP.md](MCP_SETUP.md) to configure Zotero integration.

Set environment variables:
```bash
export OBSIDIAN_VAULT_PATH="/path/to/your/vault"
export OBSIDIAN_VAULT_NAME="YourVaultName"  # optional
```

### First Use

Start a new policy research project:
```
/research-init
```

Draft an op-ed:
```
/op-ed
```

Draft a policy brief:
```
/policy-brief
```

Synthesize literature on a topic:
```
/literature-synthesis
```

---

## Commands

### Research Workflow

| Command | Function |
|---|---|
| `/research-init` | Start a new policy research project (Obsidian + Zotero setup, research question) |
| `/literature-synthesis` | Synthesize sources on a topic from Zotero + web into a structured review |
| `/zotero-review` | Read papers from a Zotero collection; synthesize into Obsidian literature review |
| `/zotero-notes` | Batch create/update Obsidian notes from Zotero papers |

### Writing

| Command | Function |
|---|---|
| `/op-ed` | Draft newspaper op-ed from argument outline |
| `/policy-brief` | Draft structured policy brief from notes/sources |
| `/grant-proposal` | Scaffold grant proposal with theory of change and logframe |
| `/draft-review` | Full pre-submission review: structure + argument critique + values + causal map |
| `/rebuttal` | Generate response to reviewer/editor comments |
| `/mine-writing-patterns` | Extract writing patterns from exemplar texts |
| `/presentation` | Create conference presentation outline |
| `/poster` | Design academic poster |
| `/promote` | Generate promotion content (newsletter, social media, email) |

### Obsidian Knowledge Base

| Command | Function |
|---|---|
| `/obsidian-init` | Bootstrap Obsidian project knowledge base for current research |
| `/obsidian-ingest` | Ingest a new file or directory into the vault |
| `/obsidian-review` | Generate project-linked literature synthesis from Obsidian notes |
| `/obsidian-notes` | Normalize paper notes and connect to project knowledge |
| `/obsidian-sync` | Force incremental or full repair sync |
| `/obsidian-link` | Repair or strengthen project wikilinks |
| `/obsidian-note` | Archive, purge, or rename a single canonical note |
| `/obsidian-project` | Detach, archive, purge, or rebuild a project knowledge base |
| `/obsidian-views` | Generate `.base` views and extra canvases |

### Project Management

| Command | Function |
|---|---|
| `/plan` | Create implementation plan |
| `/checkpoint` | Save progress checkpoint |
| `/learn` | Extract reusable patterns from session |
| `/commit` | Commit changes with Conventional Commits format |
| `/update-github` | Commit and push to GitHub |
| `/update-readme` | Update README documentation |
| `/update-memory` | Check and update CLAUDE.md memory |
| `/verify` | Verify changes |
| `/create_project` | Create new project from template |

---

## Skills

### Policy Writing

| Skill | Purpose |
|---|---|
| `op-ed-writing` | Newspaper op-eds (600–900 words, Pranay's voice, target: The Hindu / IE / Mint) |
| `policy-brief-writing` | Structured policy briefs (problem → evidence → options → recommendation) |
| `discussion-document-writing` | Takshashila-style discussion documents (2000–6000 words) |
| `grant-proposal-writing` | Grant proposals with theory of change and logframe |
| `literature-synthesis` | Cross-source synthesis from Zotero, web PDFs, and government reports |
| `doc-coauthoring` | Iterative co-authoring for proposals, specs, and decision documents |
| `writing-anti-ai` | Remove AI writing patterns; keep prose natural and expert |
| `post-acceptance` | Post-publication: promotion materials, newsletter snippets, social posts |

### Pre-Submission Review

| Skill | Purpose |
|---|---|
| `paper-self-review` | Completeness and structure check before submission |
| `argument-critique` | Adversarial review — logical vulnerabilities, evidence gaps, missing counterarguments; every critique includes a fix |
| `takshashila-values-review` | Review through Takshashila's four commitments (Freedom, Pluralism, Citizenship, Realism); surfaces tensions as questions |
| `causal-loop-analysis` | Extract implicit causal claims; render as Mermaid diagram; identify reinforcing/balancing loops and unsupported links |
| `review-response` | Systematic response to reviewer/editor comments after submission |

### Literature & Sources

| Skill | Purpose |
|---|---|
| `research-ideation` | Research startup — gap analysis, research question formulation, Zotero integration |
| `citation-verification` | Multi-layer citation verification (format → source → content) |
| `zotero-obsidian-bridge` | Bridge Zotero collections into durable Obsidian paper notes |
| `daily-paper-generator` | Track new policy publications and reports |
| `publication-chart-skill` | Publication-quality figures and tables for research outputs |

### Obsidian Knowledge Base

| Skill | Purpose |
|---|---|
| `obsidian-project-memory` | Default orchestrator for Obsidian project knowledge base |
| `obsidian-project-bootstrap` | Bootstrap or import a research project into the vault |
| `obsidian-research-log` | Daily notes, plans, hub updates, progress routing |
| `obsidian-literature-workflow` | Paper-note normalization and literature review inside the vault |
| `obsidian-synthesis-map` | Higher-level synthesis notes and comparison summaries |
| `obsidian-link-graph` | Repair wikilinks across canonical notes |
| `obsidian-project-lifecycle` | Detach, archive, purge, and note-level lifecycle |
| `obsidian-markdown` | Obsidian Flavored Markdown reference |
| `obsidian-bases` | Create and edit Obsidian Bases (`.base` files) |
| `obsidian-cli` | Obsidian CLI reference |
| `json-canvas` | Create and edit JSON Canvas files |
| `defuddle` | Extract clean markdown content from web pages |

### Utilities & Extension Development

| Skill | Purpose |
|---|---|
| `planning-with-files` | Planning and progress tracking with Markdown files |
| `git-workflow` | Git workflow standards |
| `verification-loop` | Verification and testing loops |
| `skill-development` | Skill authoring — structure, triggers, prompts |
| `skill-improver` | Iterative skill quality improvement |
| `skill-quality-reviewer` | Review and grade skill quality |
| `command-development` | Build new Claude Code slash commands |
| `plugin-structure` | Claude Code plugin layout and conventions |
| `agent-identifier` | Configure and identify Claude agents |
| `hook-development` | Build Claude Code session hooks |
| `mcp-integration` | Connect and use MCP servers |
| `latex-conference-template-organizer` | Organize messy conference LaTeX templates |

---

## Agents

| Agent | Purpose |
|---|---|
| `policy-analyst` | Evidence mapping, stakeholder analysis, policy gap identification |
| `grant-writer` | Full grant proposal drafting with funder alignment |
| `government-source-finder` | Indian government documents, committee reports, CAG, regulatory filings |
| `literature-reviewer` | Systematic literature review with Zotero MCP integration |
| `literature-reviewer-obsidian` | Filesystem-first literature review from Obsidian vault |
| `research-knowledge-curator-obsidian` | Default curator for project plans, daily logs, literature, and writing in Obsidian |
| `paper-miner` | Extract writing knowledge and arguments from exemplar policy papers |
| `rebuttal-writer` | Systematic rebuttal/response writing for peer review or editorial feedback |
| `dev-planner` | Task planning and breakdown for complex research projects |

---

## Integrations

### Zotero
Zotero is the primary reference management system. Supports:
- Import papers, government reports, think tank publications
- Full-text reading via Zotero MCP
- Organized collections per research project
- BibTeX export

See [MCP_SETUP.md](MCP_SETUP.md) for configuration.

### Obsidian
Obsidian is the default project knowledge base. Project structure:

```
Research/{project-slug}/
  00-Hub.md
  01-Plan.md
  Sources/
  GovernmentDocs/
  PolicyBriefs/
  OpEds/
  GrantProposals/
  Notes/
  Daily/
  Archive/
```

See [OBSIDIAN_SETUP.md](OBSIDIAN_SETUP.md) for configuration.

### Google Docs
Writing skills offer direct export to Google Docs for collaboration. Requires Google Workspace MCP configured in your Claude Code settings.

---

## Forked From

This project is forked from [claude-scholar](https://github.com/Galaxy-Dawn/claude-scholar) by Galaxy-Dawn, licensed MIT. ML/CS-specific components have been replaced with policy research components. The Obsidian integration, Zotero MCP integration, and skill/agent/command architecture are retained and adapted.

## License

MIT
