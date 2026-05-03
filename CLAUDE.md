# Takshashila Scholar Configuration

## Project Overview

**Takshashila Scholar** - Semi-automated research assistant for public policy research

**Mission**: Support the complete policy research lifecycle — from literature review and source synthesis through drafting op-eds, policy briefs, discussion documents, and grant proposals — with durable knowledge management in Obsidian.

---

## User Background

### Research Profile
- **Role**: Public policy researcher and educator at the Takshashila Institution (takshashila.org.in)
- **Domains**: Technology policy, semiconductor geopolitics, public finance, foreign policy, economics
- **Outputs**: Op-eds (Indian newspapers), policy briefs, discussion documents, grant proposals, newsletters, course content
- **Target outlets**: The Hindu, Indian Express, Mint, ORF, Observer Research Foundation, SSRN

### Tool Stack

| Tool | Use |
|------|-----|
| Obsidian | Primary knowledge base for research notes |
| Zotero | Reference management (papers, reports, govt docs) |
| Google Docs / Drive | Collaborative drafts and institutional documents |
| R + Quarto | Data analysis and website publishing |
| GitHub | Version control |

---

## Global Configuration

### Language Settings
- Respond in English
- Use Indian policy vocabulary where appropriate (e.g., "Union Budget", "PLI scheme", "DPIIT", not generic equivalents)

### Working Directory Standards
- Plan documents: `/plan` folder
- Temporary files: `/temp` folder
- Auto-create folders if they don't exist

### Task Execution Principles
- Discuss approach before complex tasks
- Confirm before writing to Google Docs or sending external messages
- Preserve existing files; make backups before overwriting
- Clean up temporary files after completion

### Work Style
- Use TodoWrite to track progress on multi-step tasks
- Ask proactively when topic domain knowledge is needed
- Bias toward action when instructions are clear

---

## Core Workflows

### Policy Research Lifecycle (7 Stages)

**Entry point for any researcher: `/scholar`** — routes you to the right stage based on where you are.
**`/draft-review` is available at any stage** — not just after a complete draft.

```
Hypothesis → Sources → Actor Mapping → Causal Analysis → Drafting → Review → Dissemination
```

| Stage | Core Tools | Entry |
|-------|-----------|-------|
| H. Hypothesis | `hypothesis-development` skill | `/scholar` → Path A |
| 1. Ideation (exploratory) | `research-ideation` skill + `policy-analyst` agent | `/research-init` |
| 2. Sources | `government-source-finder` agent + parliamentwatch + Zotero | `/parliament-search`, `/zotero-review` |
| 3. Actor Mapping | `stakeholder-analysis` skill | `stakeholder-analysis` |
| 4. Causal Analysis | `causal-loop-analysis` skill (with leverage ranking) | `causal-loop-analysis` |
| 5. Drafting | `op-ed-writing`, `policy-brief-writing`, `simulation-design`, `course-content-writing` | `/op-ed`, `/policy-brief`, `/grant-proposal` |
| 6. Review | `argument-critique` + `takshashila-values-review` + `paper-self-review` | `/draft-review` |
| 7. Dissemination | `post-acceptance` skill + `writing-anti-ai` skill | `/promote` |

### Supporting Workflows

- **Zotero Integration**: Automated import of papers, government reports, and think tank publications via Zotero MCP
- **Obsidian Knowledge Base**: Filesystem-first project knowledge base for literature, policy notes, drafts, and institutional memory — no MCP required
- **Google Docs Export**: Writing skills offer direct export to Google Docs for collaboration
- **Skill Evolution**: `skill-development` → `skill-quality-reviewer` → `skill-improver` improvement loop

### Obsidian Project Knowledge Base Rule

- If the current repository contains `.claude/project-memory/registry.yaml`, automatically activate `obsidian-project-memory` and treat Obsidian as the default project knowledge base.
- If not yet bound but looks like a research project, activate `obsidian-project-bootstrap`.
- On every substantial research turn, update the daily note and repo-local project memory file.
- Never require Obsidian MCP or additional API keys.

---

## Skills Directory

### Research & Analysis
- **hypothesis-development**: Turn intuition into a testable claim — decomposes hypothesis into claim types, maps assumptions, generates evidence requirements, produces Research Brief that anchors the full project
- **research-ideation**: Research startup — gap analysis, research question formulation, Zotero integration
- **stakeholder-analysis**: Interest × Power matrix — map all actors, identify coalitions, veto players, and research implications
- **literature-synthesis**: Cross-source synthesis from Zotero, web PDFs, and government reports
- **citation-verification**: Multi-layer citation verification (format → source → content)
- **daily-paper-generator**: Track new policy publications and reports

### Policy Writing
- **policy-brief-writing**: Structured policy brief (Problem → Evidence → Options → Recommendation)
- **op-ed-writing**: Newspaper op-ed in Pranay's voice — evidence-based, non-partisan, plain language
- **discussion-document-writing**: Takshashila-style discussion documents
- **grant-proposal-writing**: Grant proposals with theory of change, logframe, funder alignment
- **simulation-design**: Design complete policy simulations for adult learners — scenario brief, role cards, facilitator guide, debrief template; Takshashila-specific (GCPP/MIPP/executive education)
- **course-content-writing**: Modular course content for adult learners — lecture outlines, reading guides, case studies, discussion questions, assessment rubrics; Indian policy context
- **writing-anti-ai**: Remove AI writing patterns; keep voice natural and expert
- **doc-coauthoring**: Document co-authoring workflow
- **post-acceptance**: Post-publication: promotion materials, newsletter snippets, social posts

### Pre-submission Review
- **paper-self-review**: Structure and logic completeness check
- **argument-critique**: Adversarial review — explicit fallacy taxonomy, mandatory FLAW/FIX format, editorial summary at top; every critique is actionable
- **takshashila-values-review**: Review draft through Takshashila's 4 values (Freedom, Pluralism, Citizenship/Constitutional, Realism in IR) — surfaces tensions as questions, not verdicts
- **causal-loop-analysis**: Extract implicit causal claims; render as Mermaid diagram; identify reinforcing/balancing loops, unsupported links; leverage point ranking + policy intervention menu
- **review-response**: Systematic response to reviewer/editor comments after submission

### Obsidian Knowledge Base
- **obsidian-project-memory**: Default Obsidian project-memory orchestrator
- **obsidian-project-bootstrap**: Bootstrap or import a research project into the vault
- **obsidian-research-log**: Daily notes, plans, hub updates, progress routing
- **obsidian-link-graph**: Repair wikilinks across canonical notes
- **obsidian-synthesis-map**: Higher-level synthesis notes and comparison summaries
- **obsidian-project-lifecycle**: Detach, archive, purge, and note-level lifecycle
- **zotero-obsidian-bridge**: Bridge Zotero collections into durable Obsidian paper notes
- **obsidian-literature-workflow**: Paper-note normalization and literature review inside the vault
- **obsidian-markdown**: Obsidian Flavored Markdown reference
- **obsidian-cli**: Obsidian CLI reference
- **obsidian-bases / json-canvas / defuddle**: Support for `.base`, `.canvas`, and web-to-markdown extraction

### Utilities & Workflow
- **planning-with-files**: Planning and progress tracking with Markdown files
- **git-workflow**: Git workflow standards
- **verification-loop**: Verification and testing loops
- **skill-development / skill-improver / skill-quality-reviewer**: Skill authoring and improvement
- **command-development / plugin-structure / agent-identifier / hook-development / mcp-integration**: Extension development

---

## Commands

### Research Workflow Commands

| Command | Function |
|---------|----------|
| `/scholar` | **START HERE** — routes any researcher to the right stage based on topic and current progress |
| `/research-init` | Start a new policy research project (Obsidian setup, Zotero collection, research question) |
| `/parliament-search` | Search Indian parliamentary committee reports via local parliamentwatch project |
| `/literature-synthesis` | Synthesize sources on a topic from Zotero + web into a structured review |
| `/zotero-review` | Read papers from Zotero collection, synthesize into Obsidian literature review |
| `/zotero-notes` | Batch create/update Obsidian notes from Zotero papers |
| `/obsidian-init` | Bootstrap Obsidian project knowledge base for current research |
| `/obsidian-ingest` | Ingest a new file or directory into the vault |
| `/obsidian-review` | Generate project-linked literature synthesis from Obsidian notes |
| `/obsidian-notes` | Normalize paper notes and connect to project knowledge |
| `/obsidian-sync` | Force incremental or full repair sync |
| `/obsidian-link` | Repair or strengthen project wikilinks |
| `/obsidian-note` | Archive, purge, or rename a single canonical note |
| `/obsidian-project` | Detach, archive, purge, or rebuild a project knowledge base |
| `/obsidian-views` | Generate `.base` views and extra canvases |

### Writing Commands

| Command | Function |
|---------|----------|
| `/op-ed` | Draft newspaper op-ed from argument outline |
| `/policy-brief` | Draft policy brief from notes/sources |
| `/grant-proposal` | Scaffold grant proposal with theory of change |
| `/draft-review` | Full pre-submission review: structure + argument critique + values + causal map |
| `/rebuttal` | Generate response to reviewer/editor comments |
| `/mine-writing-patterns` | Extract writing patterns from exemplar texts |
| `/presentation` | Create presentation outline |
| `/promote` | Generate promotion content (newsletter, social media, email) |

### Project Management Commands

| Command | Function |
|---------|----------|
| `/plan` | Create implementation plan |
| `/commit` | Commit changes with Conventional Commits format |
| `/update-github` | Commit and push to GitHub |
| `/update-readme` | Update README documentation |
| `/verify` | Verify changes |
| `/checkpoint` | Create checkpoint |
| `/learn` | Extract reusable patterns |
| `/create_project` | Create new project |
| `/update-memory` | Check and update CLAUDE.md memory |

---

## Agents

### Research Agents
- **policy-analyst** — Evidence gathering, stakeholder mapping, policy gap identification
- **government-source-finder** — Search for government reports, ministry documents, committee reports, think tank PDFs
- **literature-reviewer** — Systematic literature review with Zotero MCP integration
- **literature-reviewer-obsidian** — Filesystem-first literature review from Obsidian vault
- **research-knowledge-curator-obsidian** — Default curator for project plans, daily logs, literature, and writing in Obsidian
- **paper-miner** — Extract writing knowledge and arguments from exemplar policy papers

### Writing Agents
- **grant-writer** — Structure and draft grant proposals; align with funder priorities
- **rebuttal-writer** — Systematic rebuttal/response writing for peer review or editorial feedback

### Planning Agents
- **dev-planner** — Task planning and breakdown for complex research projects

---

## Hooks

| Hook | Trigger | Function |
|------|---------|----------|
| `session-start.js` | Session start | Show Git status, todos, commands, and bound Obsidian project-memory status |
| `skill-forced-eval.js` | Every user input | Evaluate available skills; hint Obsidian curator flow on research turns |
| `session-summary.js` | Session end | Generate work log; remind minimum Obsidian write-back |
| `stop-summary.js` | Session stop | Quick status check, temp file detection |
| `security-guard.js` | File operations | Security validation (key detection, dangerous command interception) |

---

## Rules

| Rule File | Purpose |
|-----------|---------|
| `policy-core.md` | Policy research standards: evidence-based, non-partisan, plain language, Indian context |
| `grant-writing.md` | Grant proposal standards: theory of change, logframe, funder alignment |
| `writing-style.md` | Pranay's voice: domain-expert confidence, fewer em dashes, no AI tells |
| `agents.md` | Agent orchestration: auto-invocation timing, parallel execution |
| `security.md` | Security standards: key management, sensitive file protection |

---

## Naming Conventions

### Skill Naming
- Format: kebab-case
- Prefer gerund form (verb+ing)
- Example: `policy-brief-writing`, `grant-proposal-writing`

### Tags Naming
- Title Case; abbreviations all caps
- Example: `[Policy, India, Semiconductors]`

---

## Task Completion Summary

After each meaningful task, provide a brief summary:

```
📋 Operation Review
1. [Main operation]
2. [Modified files]

📊 Current Status
• [Git/filesystem status]

💡 Next Steps
1. [Targeted suggestions]
```
