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
| **Review** | Self-review checklist, response to reviewer/editor comments |
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

## Core Workflows

### Research Lifecycle

```
Ideation → Literature Review → Drafting → Review → Publication
```

**Key commands:**
- `/research-init` — start a new policy research project (Obsidian + Zotero setup)
- `/literature-synthesis` — synthesize sources by theme
- `/op-ed` — draft newspaper op-ed
- `/policy-brief` — draft structured policy brief
- `/grant-proposal` — scaffold and draft grant proposal
- `/zotero-review` — synthesize Zotero collection into Obsidian notes
- `/rebuttal` — respond to reviewer/editor comments
- `/promote` — generate promotion content

### Writing Skills

| Skill | Purpose |
|---|---|
| `op-ed-writing` | Newspaper op-eds (600–900 words, Pranay's voice) |
| `policy-brief-writing` | Structured policy briefs (problem → evidence → options → recommendation) |
| `discussion-document-writing` | Takshashila-style discussion documents (2000–6000 words) |
| `grant-proposal-writing` | Grant proposals with theory of change and logframe |
| `literature-synthesis` | Cross-source synthesis (academic + government + think tank) |

### Agents

| Agent | Purpose |
|---|---|
| `policy-analyst` | Evidence mapping, stakeholder analysis, feasibility assessment |
| `grant-writer` | Full grant proposal drafting with funder alignment |
| `government-source-finder` | Indian government documents, committee reports, CAG, regulatory filings |
| `literature-reviewer` | Systematic literature review with Zotero integration |

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

## Forked From

This project is forked from [claude-scholar](https://github.com/Galaxy-Dawn/claude-scholar) by Galaxy-Dawn, licensed MIT. ML/CS-specific components have been replaced with policy research components. The Obsidian integration, Zotero MCP integration, and skill/agent/command architecture are retained and adapted.

## License

MIT
