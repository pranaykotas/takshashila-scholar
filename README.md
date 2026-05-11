<div align="center">

  <img src="LOGO.png" alt="Takshashila Scholar Logo" width="60%"/>

  <p>
    <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License"/>
    <img src="https://img.shields.io/badge/Claude_Code-Compatible-blueviolet?style=flat-square" alt="Claude Code"/>
    <img src="https://img.shields.io/badge/Forked_from-claude--scholar-blue?style=flat-square" alt="Forked from claude-scholar"/>
  </p>

</div>

> Structured policy reasoning tools for Takshashila researchers. Works as a [Claude Code](https://github.com/anthropics/claude-code) plugin. Embeds Bardach's 8-step analysis, causal loop diagrams, stakeholder mapping, and draft review — with India's institutional context built in at every step.

**→ Student or outside user? See [README-STUDENT.md](README-STUDENT.md)**

---

## For the research team: where to start

The three highest-value entry points for an experienced researcher:

**1. Stress-test a draft before it goes to an editor**
```
/draft-review
```
Paste your draft. Runs argument critique (expert mode), values review, and causal analysis. The argument critique will find the 2–3 things your editor or a hostile peer reviewer would raise — before they do.

**2. Map the causal claims in a piece you are writing**
```
causal analysis of [paste your argument]
```
Produces a Mermaid diagram with named feedback loops (R1 "ecosystem flywheel" etc.), cross-connections between loops, and a ranked list of which causal links are weakest. Good for discussion documents and policy briefs before submission.

**3. Find committee reports you may have missed**
```
/parliament-search [topic]
```
Searches all 16 DRSCs. Surfaces the most relevant reports immediately — not just a list, but "report #3 is most relevant because it contains data on X." Requires [parliamentwatch](https://github.com/pranaykotas/parliamentwatch) installed locally.

---

## The full research lifecycle

```
[H]  HYPOTHESIS     hypothesis-development skill → Research Brief
 ↓
[2]  SOURCES        /parliament-search + government-source-finder agent + /zotero-review
 ↓
[3]  ACTORS         stakeholder-analysis skill → Interest × power matrix
 ↓
[4]  CAUSAL MAP     causal-loop-analysis skill → named loops, cross-connections, leverage points
 ↓
[5]  DRAFT          /op-ed  /policy-brief  discussion-document-writing  /grant-proposal
 ↓
[6]  REVIEW         /draft-review ← available at any stage, not just at the end
 ↓
[7]  DISSEMINATE    /promote
```

`/draft-review` and `/scholar` work at any stage — on a hypothesis, a source synthesis, a causal map, or a finished draft.

---

## Intellectual tradition

Takshashila Scholar is built on the four commitments of the [Takshashila Institution](https://takshashila.org.in):

- **Freedom** — individual liberty, limits on arbitrary state power
- **Pluralism** — India's diversity, legitimacy of multiple value systems
- **Citizenship** — civic participation, accountability, constitutional fidelity
- **Realism in international relations** — foreign policy by interests and power, not ideology

The `takshashila-values-review` skill checks any draft against all four. The `rules/takshashila-language.md` file enforces vocabulary standards: Indian subcontinent not South Asia, West Asia not Middle East, no jargon.

---

## Installation

**Claude Code** is Anthropic's AI assistant for your terminal — think of it as Claude with access to your files and persistent instructions. Install it once:

```bash
npm install -g @anthropic/claude-code
```

You need an [Anthropic account](https://console.anthropic.com). The free tier works for most research tasks.

**Install the plugin:**

```bash
# Global install (applies to all your projects)
git clone https://github.com/pranaykotas/takshashila-scholar ~/.claude/plugins/takshashila-scholar

# Or project-level (inside a specific research folder)
git clone https://github.com/pranaykotas/takshashila-scholar .claude/plugins/takshashila-scholar
```

**Optional: set paths for integrations**

```bash
# Obsidian vault
export OBSIDIAN_VAULT_PATH="/path/to/your/vault"

# Frameworks library (enables local framework search)
# Clone https://github.com/pranaykotas/frameworks as a sibling repo, or:
export FRAMEWORKS_PATH="/path/to/frameworks/frameworks.json"
```

Then open Claude Code in your research project and run `/scholar`.

For Zotero integration: [MCP_SETUP.md](MCP_SETUP.md)
For Obsidian setup: [OBSIDIAN_SETUP.md](OBSIDIAN_SETUP.md)

---

## Key skills for researchers

### Draft review

`/draft-review` runs three checks in sequence:

| Check | What it catches |
|-------|----------------|
| `argument-critique` (expert mode) | Logical flaws, weak evidence, unanswered objections — FLAW/FIX format, no taxonomy lecture |
| `takshashila-values-review` | Tensions with Takshashila's four commitments — surfaces as questions, not verdicts |
| `causal-loop-analysis` | Implicit causal claims made explicit; weakest links flagged |

Say "expert critique" to skip explanations and get straight to the findings.

### Causal loop analysis (v2.0 — publication standard)

Makes the theory of change in any policy argument fully explicit:

- **Core causal chain** — "deny X → deny Y → deny Z" with weakest link identified
- **Named loops** — R1 "ecosystem flywheel", B1 "budget constraint" (not just labels)
- **Cross-connections** — where Loop R1 structurally undermines Loop R2
- **Layer model** — energy → chips → infrastructure → models → applications; which layer does the intervention target?
- **Structural actor positions** — where each key actor sits in the causal map
- **Leverage point ranking** — magnitude × accessibility matrix → priority interventions

### Op-ed writing with voice calibration

`/op-ed` now asks for 2–3 paragraphs of your previous writing before drafting. It reads your sentence length, assertion style, and use of examples, then matches that register throughout. If you skip this step it uses the default Takshashila researcher voice.

### Policy analysis (Bardach 8-step)

`/policy-analysis` walks through Bardach's methodology with India-specific lenses: state capacity diagnosis, federal jurisdiction check, all-sectors-can-fail alternatives, political feasibility, implementation capacity. Produces a Policy Analysis Memo. Useful for new topics, grant framing, or structuring a discussion document.

### Parliament search

`/parliament-search [topic]` searches all 16 Departmentally Related Standing Committees and immediately surfaces the most relevant reports — not just a count, but "report #3 is most relevant because it contains X." Requires [parliamentwatch](https://github.com/pranaykotas/parliamentwatch).

---

## Commands reference

| Command | What it does |
|---------|-------------|
| `/scholar` | Routes you to the right tool based on topic and stage |
| `/draft-review` | Full pre-submission review — use at any stage |
| `/policy-analysis` | Bardach 8-step analysis → Policy Analysis Memo |
| `/parliament-search [topic]` | Search 16 committee reports; surfaces top hits |
| `/op-ed` | Draft op-ed with voice calibration |
| `/policy-brief` | Draft policy brief with causal chain box |
| `/grant-proposal` | Scaffold grant proposal with theory of change |
| `/research-init` | Start a new research project |
| `/literature-synthesis` | Synthesize sources into structured review |
| `/zotero-review` | Synthesize Zotero papers into Obsidian |
| `/rebuttal` | Response to reviewer/editor comments |
| `/promote` | Post-publication: social posts, newsletter, email pitch |
| `/student-start` | First-session orientation for students |

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) to add skills, extend existing ones, or adapt for other South Asian contexts.

---

## Forked from

[claude-scholar](https://github.com/Galaxy-Dawn/claude-scholar) by Galaxy-Dawn (MIT). ML/CS components replaced with policy research components. Obsidian integration, Zotero MCP, and skill/agent/command architecture retained and adapted.

## License

MIT
