---
name: scholar
description: Entry point for all Takshashila research workflows. Asks the researcher what they are working on and where they are in the research lifecycle, then routes them to the right skill or command. Designed so any Takshashila researcher — not just the repo owner — can start without knowing all the available skills.
---

# /scholar — Research Lifecycle Guide

The front door to Takshashila Scholar. Use this when starting a new research project, when you are unsure what to do next, or when helping another researcher get started.

## What to Do

1. **Greet and ask for the topic and output type:**

   > "What are you working on? Give me a short description of the topic and what you want to produce at the end — for example: an op-ed on India's semiconductor policy, a policy brief on data governance, a discussion document on defence procurement, a grant proposal, a course module, or a simulation exercise."

2. **Ask about current stage:**

   > "And where are you right now?
   > (A) I have an idea or intuition but haven't started yet
   > (B) I have a hypothesis or argument I want to test
   > (C) I've done some reading and have sources
   > (D) I have a draft I want to review
   > (E) I'm ready to submit and want final checks"

3. **Route to the right starting point** based on their answer:

   | Stage | Route to |
   |-------|---------|
   | A — Idea, no hypothesis | `research-ideation` skill → then `hypothesis-development` skill |
   | B — Has a hypothesis | `hypothesis-development` skill directly |
   | C — Has sources, no hypothesis | `hypothesis-development` skill (crystallise what the sources suggest) |
   | C — Has sources and a hypothesis | `stakeholder-analysis` or `causal-loop-analysis` depending on what they need next |
   | D — Has a draft | `/draft-review` command |
   | E — Ready to submit | `/draft-review` then `takshashila-values-review` skill |

4. **After routing, show the full lifecycle map** so the researcher knows what comes next:

```
THE TAKSHASHILA RESEARCH LIFECYCLE
═══════════════════════════════════════════════════════════════════

PATH A — You have a hypothesis already:
  [H]  hypothesis-development   → produces Research Brief
   ↓
  [2]  Sources                  → /parliament-search + /zotero-review + government-source-finder
   ↓
  [3]  Actor mapping            → stakeholder-analysis skill
   ↓
  [4]  Causal analysis          → causal-loop-analysis skill
   ↓
  [5]  Draft                    → /op-ed  /policy-brief  /grant-proposal
                                   simulation-design  course-content-writing
   ↓
  [6]  Review                   → /draft-review  (available at ANY stage — see below)
   ↓
  [7]  Disseminate              → /promote

PATH B — Still exploring:
  [1]  Ideation                 → /research-init → research-ideation skill
   ↓
  [2]  Sources                  → /parliament-search + /zotero-review
   ↓
  [H]  Crystallise              → hypothesis-development skill  ← CONVERGENCE POINT
   ↓
  [3] → [4] → [5] → [6] → [7]  (same as Path A from here)

═══════════════════════════════════════════════════════════════════
  /draft-review is available at ANY stage.
  Run it on your hypothesis, your source synthesis, your causal map,
  your outline, or your full draft. You do not need a finished piece.
═══════════════════════════════════════════════════════════════════
```

5. **At the end of each skill or command, print:**

   > **You are at stage [X].** Next step: [command or skill] — [one-sentence description of what it will do].
   > Also available now: `/draft-review` on anything you have so far.

## Routing Details

### Hypothesis-development skill
Trigger phrase: "I have a hypothesis" or "help me test my idea"
What it produces: Research Brief — a structured document with the hypothesis, claim decomposition, assumptions map, evidence requirements, and next steps.

### Sources (Stage 2)
- `/parliament-search [topic]` — searches Indian parliamentary committee reports (requires parliamentwatch project at `~/Projects/parliamentwatch`)
- `/zotero-review` — searches Zotero library
- `government-source-finder` agent — finds ministry documents, CAG reports, regulatory consultations

### Stakeholder analysis
Trigger phrase: "stakeholder analysis" or "who are the actors in [topic]"
What it produces: Interest × Power matrix, coalition map, veto player list, research implications.

### Causal loop analysis
Trigger phrase: "causal analysis" or "map the causal logic"
What it produces: Mermaid causal diagram, loop inventory, leverage point ranking, policy intervention menu.

### Drafting
- `/op-ed` — newspaper op-ed (600–900 words, Indian outlets)
- `/policy-brief` — structured policy brief for ministry/committee audience
- `/grant-proposal` — grant proposal with theory of change and logframe
- `simulation-design` skill — role-play exercise for teaching
- `course-content-writing` skill — lecture, reading guide, case study, discussion questions

### Review
- `/draft-review` — full pre-submission review (structure + argument + values)
- `argument-critique` skill — adversarial logical review with mandatory fixes
- `takshashila-values-review` skill — review through Takshashila's 4 commitments

### Dissemination
- `/promote` — social media posts, newsletter snippets, email pitch

## Notes for Facilitating Other Researchers

If you are helping a colleague from Takshashila who is new to this tool:
- Start with `/scholar` — walk them through the two questions
- After routing, explain what each step produces and why it comes before the next
- The Research Brief from `hypothesis-development` is the key document — every subsequent step should reference it
- Remind them that `/draft-review` can be used at any stage, not just at the end
