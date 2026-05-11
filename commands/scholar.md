---
name: scholar
description: Entry point for all Takshashila research workflows. Asks the researcher what they are working on and where they are in the research lifecycle, then routes them to the right skill or command. Designed so any Takshashila researcher — not just the repo owner — can start without knowing all the available skills.
---

# /scholar — Research Lifecycle Guide

The front door to Takshashila Scholar. Use this when starting a new research project, when you are unsure what to do next, or when helping another researcher get started.

## What to Do

1. **Greet and ask for the topic and output type:**

   > "What are you working on? Give me a short description of the topic and what you want to produce at the end — for example: an op-ed on India's semiconductor policy, a policy brief on data governance, a discussion document on defence procurement, a grant proposal, a course module, or a simulation exercise."

2. **Ask the key diagnostic question to determine the right entry point:**

   > "And where are you right now? Pick the one that fits best:
   > (A) I have an idea or intuition but haven't started yet
   > (B) I have a hypothesis or argument — something I want to argue and defend
   > (C) I have a policy problem I need to analyse — I don't have a view yet, I need to work through the options
   > (D) I've done some reading and have sources
   > (E) I have a draft I want to review
   > (F) I'm ready to submit and want final checks
   > (G) I want to find a framework that applies to my problem
   > (H) I am a student or first-time user — I want to get oriented"

   **If the answer is ambiguous between B and C**, ask one clarifying question:
   > "Do you already have a view — something you want to argue — or are you still working out what you think?"
   > - Already have a view → **(B)** `hypothesis-development`
   > - Still working out what I think → **(C)** `/policy-analysis`

3. **Route to the right starting point** based on their answer:

   | Stage | Route to | What it produces |
   |-------|---------|-----------------|
   | A — Idea, no hypothesis | `research-ideation` → `hypothesis-development` | Research Brief |
   | B — Has a hypothesis to defend | `hypothesis-development` directly | Research Brief with causal skeleton, assumption map, evidence requirements |
   | C — Has a problem, no view yet | `/policy-analysis` → `bardach-policy-analysis` | Policy Analysis Memo with alternatives, criteria, trade-offs, recommendation |
   | D — Has sources, no hypothesis | `hypothesis-development` (crystallise what the evidence suggests) | Research Brief |
   | D — Has sources and a hypothesis | `stakeholder-analysis` or `causal-loop-analysis` | Actor map or causal loop diagram |
   | E — Has a draft | `/draft-review` | Argument critique + values review + causal check |
   | F — Ready to submit | `/draft-review` then `takshashila-values-review` | Pre-submission review |
   | G — Wants a framework | `find-framework` | Top 3–5 matching frameworks from 99-framework library |
   | H — Student / first-time user | `/student-start` | Orientation + first exercise |

   **The B vs C distinction is the most important routing decision:**
   - **B (hypothesis-development)**: "I think India's PLI scheme will fail to attract fabs because domestic demand is too thin." The researcher has a claim. The tool stress-tests it.
   - **C (/policy-analysis)**: "Should India expand PLI to chip design?" The researcher has a question. The tool works through the options systematically.
   - When in doubt, ask: "Can you state your argument in one sentence?" If yes → B. If not → C.

4. **After routing, show the full lifecycle map** so the researcher knows what comes next:

```
THE TAKSHASHILA RESEARCH LIFECYCLE
═══════════════════════════════════════════════════════════════════

PATH A — You have a hypothesis (something you want to argue):
  [H]  hypothesis-development   → Research Brief: claim decomposition,
                                   causal skeleton, assumption map,
                                   evidence requirements
   ↓
  [2]  Sources                  → /parliament-search + /zotero-review
                                   + government-source-finder
   ↓
  [3]  Actor mapping            → stakeholder-analysis
   ↓
  [4]  Causal analysis          → causal-loop-analysis
                                   (takes skeleton from Research Brief →
                                   named loops, cross-connections,
                                   leverage points)
   ↓
  [5]  Draft                    → /op-ed  /policy-brief  /grant-proposal
                                   simulation-design  course-content-writing
   ↓
  [6]  Review                   → /draft-review
   ↓
  [7]  Disseminate              → /promote

PATH B — You have a policy problem (still working out what you think):
  [P]  /policy-analysis         → Policy Analysis Memo: problem definition,
                                   alternatives, criteria, projected outcomes,
                                   trade-offs, recommendation, narrative framing
   ↓
  [H]  hypothesis-development   ← CONVERGENCE POINT
       (Once Bardach Step 7 produces a recommendation, crystallise it
       into a testable hypothesis before drafting a full paper or op-ed)
   ↓
  [3] → [4] → [5] → [6] → [7]  (same as Path A from here)

PATH C — Still exploring, no hypothesis or problem framing yet:
  [1]  Ideation                 → /research-init → research-ideation skill
   ↓
  [2]  Sources                  → /parliament-search + /zotero-review
   ↓
  [H]  Crystallise              → hypothesis-development  ← CONVERGENCE POINT
   ↓
  [3] → [4] → [5] → [6] → [7]  (same as Path A from here)

═══════════════════════════════════════════════════════════════════
  KEY DISTINCTION:
  Path A = "I think X because Y" → defend it → hypothesis-development
  Path B = "Should we do X?" → work it out → /policy-analysis
  When in doubt: "Can you state your argument in one sentence?"
  Yes → Path A.  Not yet → Path B.
═══════════════════════════════════════════════════════════════════
  /draft-review is available at ANY stage — on a hypothesis, a source
  synthesis, a causal map, an outline, or a full draft.
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

### Policy analysis (Bardach 8-step)
Trigger phrase: "analyse this policy", "apply Bardach", "systematic policy analysis"
What it produces: Policy Analysis Memo — problem definition, alternatives, criteria, projected outcomes, trade-offs, recommendation, narrative framing.
Command: `/policy-analysis`

### Find framework
Trigger phrase: "find a framework for", "which framework applies", "what frameworks exist"
What it produces: Top 3–5 matching frameworks from the 99-framework library with why-it-applies and links.
Skill: `find-framework`

### Causal loop analysis
Trigger phrase: "causal analysis" or "map the causal logic"
What it produces: Mermaid causal diagram with named loops, cross-connections between loops, layer model (if applicable), structural actor positions, leverage point ranking, policy intervention menu.

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
