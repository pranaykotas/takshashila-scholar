---
name: bardach-policy-analysis
description: Use this skill when the user asks to "analyse this policy", "apply Bardach", "8-step policy analysis", "eightfold path", or "systematically analyse a policy problem". Walks through Eugene Bardach's 8-step methodology with Takshashila's India-specific lenses layered in at each step. Guided mode by default (asks questions, walks through all 8 steps); modular on request (jump to a specific step). Produces a Policy Analysis Memo at the end.
version: 1.0.0
tags: [Analysis, PolicyAnalysis, Bardach, India, Frameworks]
---

# Bardach Policy Analysis

Systematic policy analysis using Bardach's 8-step methodology, with Takshashila's India-specific analytical lenses embedded at each stage. Produces a structured Policy Analysis Memo.

## Design Rationale

Bardach's 8 steps are an **analytical methodology** — what to do in what order. Takshashila's India-specific wisdom provides **conceptual lenses** — how to think at each stage given India's specific institutional context, state capacity constraints, and federal structure. This skill combines both.

| Bardach Step | Takshashila Layer |
|---|---|
| 1. Define the problem | State capacity lens: spending / size / capability / ambition |
| 2. Assemble evidence | Parliament search, CAG reports, ministry data; India baseline |
| 3. Construct alternatives | Markets / Societies / Governments — all can fail |
| 4. Select criteria | Better-or-worse not good-or-bad; political feasibility counts |
| 5. Project outcomes | Causal loop analysis; second-order effects; naming the weakest link |
| 6. Confront trade-offs | Good intentions ≠ good outcomes; implementation leakage |
| 7. Decide | Capacity must exist for policy to work; name the decision-maker |
| 8. Tell your story | Indian register; Takshashila language rules; right audience |

---

## Modes

### Guided mode (default)
Walk through all 8 steps in sequence. At each step, ask the user the key question for that step, then record the answer and move to the next step. Produce the Policy Analysis Memo at the end.

### Modular mode (on request)
If the user says "just step 3" or "only the alternatives" or "skip to the recommendation", jump directly to that step without requiring prior steps. Still produce output in the standard memo format for that section.

### Integration mode
Steps can hand off to other skills:
- Step 1 → `hypothesis-development` skill (if the problem statement needs sharpening)
- Step 2 → `/parliament-search` command (for committee reports and government sources)
- Step 3 → `stakeholder-analysis` skill (to map which actors each alternative serves)
- Step 5 → `causal-loop-analysis` skill (for named-loop causal map of projected outcomes)
- Step 8 → `op-ed-writing` or `policy-brief-writing` skill (for the final output format)

---

## Process (Guided Mode)

### Entry
Ask: "What is the policy problem you want to analyse? Give me a brief description — a few sentences is enough."

Then proceed step by step. At each step, present the key questions, record the user's input, and say "Moving to Step [N+1]" before proceeding.

---

### Step 1: Define the Problem

**Present to user:**
> "Let's define the problem precisely. A well-defined policy problem:
> - States what welfare is being lost, or what coordination is failing
> - Names who is affected and how
> - Is framed as a problem, not as the absence of your preferred solution (e.g., not 'we need a semiconductor PLI' but 'India's semiconductor import dependence creates supply chain vulnerability')
>
> Apply the state capacity check: Is this a spending problem? A size problem? A capability problem? Or an ambition problem (state overreaching or abdicating)?
> Also: Is this a Union List, State List, or Concurrent List issue?"

**Record:** Problem statement, state capacity diagnosis, federal jurisdiction.

**Reference:** `references/state-capacity-lens.md`

---

### Step 2: Assemble the Evidence

**Present to user:**
> "What evidence do we have on the magnitude of this problem and the effects of possible solutions?
>
> Key sources for Indian policy:
> - Ministry annual reports and policy documents
> - CAG audit reports (often reveal implementation gaps)
> - Parliamentary Standing Committee reports (use `/parliament-search`)
> - NITI Aayog, RBI, and sector regulator reports
> - Academic research and think-tank publications
>
> Mark uncertainty: What is known? What is estimated? What is assumed?"

**Record:** Evidence base, known/estimated/assumed distinction, key data gaps.

---

### Step 3: Construct the Alternatives

**Present to user:**
> "List 3–5 genuinely distinct policy alternatives. Include:
> - Non-intervention (explicit option with costs stated)
> - Market-based approaches
> - Government provision or regulation
> - Hybrid/PPP approaches
> - Community/social norm approaches
>
> All three sectors can fail — markets, governments, and communities. Don't default to a pure-state or pure-market solution.
>
> Which alternative challenges your prior?"

**Reference:** `references/failure-modes.md`

**Record:** 3–5 alternatives with one-sentence description each.

---

### Step 4: Select the Criteria

**Present to user:**
> "What criteria will you use to evaluate the alternatives? Common criteria:
> - Efficiency (does it improve welfare at reasonable cost?)
> - Equity (who gains, who loses — is the distribution acceptable?)
> - Political feasibility (can it actually pass and be sustained?)
> - Administrative feasibility (can the implementing agency deliver it?)
> - Legality (is it within constitutional/legal bounds?)
>
> Think better-or-worse, not good-or-bad. Political feasibility is a legitimate criterion, not a cop-out."

**Reference:** `references/india-policy-priors.md`

**Record:** 3–5 evaluation criteria with brief justification.

---

### Step 5: Project the Outcomes

**Present to user:**
> "For each alternative, project outcomes on each criterion. This is inherently uncertain — acknowledge it.
>
> Key check: Not every unintended consequence is unforeseeable. For each alternative, ask:
> - What happens in adjacent systems when this fires?
> - What is the causal chain? Where is the weakest link?
> - Short-run vs. long-run effects — do they point in opposite directions?
>
> I can run a full causal loop analysis on the most important alternative if useful — just say 'causal analysis'."

**Record:** Outcome projections per alternative per criterion, second-order effects noted.

---

### Step 6: Confront the Trade-offs

**Present to user:**
> "Compare alternatives explicitly on the criteria. There is rarely a dominant option — acknowledge genuine trade-offs.
>
> Key checks:
> - Good intentions do not equal good outcomes. Evaluate by effects, not stated goals.
> - One rupee of government spending is not one rupee of welfare delivered. Factor in implementation leakage and administrative costs.
> - Where do your criteria conflict? Who wins and who loses under each trade-off?"

**Record:** Comparison table; explicit trade-off statements.

---

### Step 7: Decide

**Present to user:**
> "State your recommendation. Do not hide behind 'further research is needed.'
>
> Before recommending, check:
> - Does the implementing agency have the capability, mandate, and resources?
> - Is this politically feasible — or is there a second-best option that is?
> - Who is your recommendation addressed to? (Minister, regulator, Parliament, state government)
>
> If the first-best is politically or administratively impossible, recommend the second-best explicitly rather than pretending the first-best is achievable."

**Record:** Recommendation, decision-maker, implementation capacity check, 2–3 concrete steps.

---

### Step 8: Tell Your Story

**Present to user:**
> "How will you communicate this analysis?
>
> - Who is your audience? (Ministry official, parliamentary committee, newspaper reader, think-tank audience)
> - What format? (Op-ed, policy brief, discussion document, internal memo)
> - What does your audience already believe, and what does your analysis add?
>
> Apply Takshashila language rules: Indian subcontinent not South Asia; West Asia not Middle East; no jargon. Plain language, domain-expert confidence."

**Record:** Target audience, format, key message, suggested outlet if applicable.

---

## Output: Policy Analysis Memo

After all 8 steps are complete, produce this memo:

```
POLICY ANALYSIS MEMO
=====================

Problem: [One sentence — what welfare is being lost, for whom]
Jurisdiction: [Union / State / Concurrent — who can act]
State capacity diagnosis: [Spending / Size / Capability / Ambition problem]

Evidence base: [Sources used; mark known vs. estimated vs. assumed]

Alternatives considered:
1. [Name] — [one sentence description]
2. [Name] — [one sentence description]
3. [Name] — [one sentence description]
[4–5 if applicable]

Evaluation criteria: [list with brief justification]

Projected outcomes:
[Table or prose comparing alternatives on each criterion]

Key trade-offs:
[Explicit statement of where criteria conflict and who wins/loses]

Causal chain: [X → Y → Z — the theory of change in one sentence]
Key loop: [Name one dominant reinforcing or balancing loop]
Weakest link: [The step most likely to fail, and why]

Recommended option: [Name]
- Decision-maker: [who must act]
- Implementation capacity check: [does the agency have capability, mandate, resources?]
- Concrete steps: [2–3 specific actions]
- Necessary condition for success: [what must be true for this to work]

Second-order effects to watch: [what the recommendation does not control for]

Narrative framing:
- Audience: [who]
- Format: [op-ed / policy brief / memo]
- Key message: [what the reader should believe after reading]
- Suggested outlet (if public): [outlet name]
```

---

## Quality Checklist

- [ ] Problem framed as a welfare loss or coordination failure — not as absence of preferred solution
- [ ] State capacity diagnosis applied (spending / size / capability / ambition)
- [ ] Federal jurisdiction identified (Union / State / Concurrent)
- [ ] Evidence base distinguishes known, estimated, and assumed
- [ ] At least 3 genuine alternatives including non-intervention
- [ ] Criteria are explicit and defensible
- [ ] Second-order effects checked
- [ ] Causal chain and weakest link identified
- [ ] Trade-offs confronted explicitly — no dominant alternative asserted without argument
- [ ] Recommendation names a specific decision-maker
- [ ] Implementation capacity check completed
- [ ] No Takshashila language violations (South Asia, Middle East, jargon)
- [ ] No AI writing tells

---

## References

- `references/bardach-steps.md` — All 8 steps with India annotations
- `references/state-capacity-lens.md` — Four-dimension state capacity framework
- `references/failure-modes.md` — Market, government, and social failure typology
- `references/india-policy-priors.md` — India-specific mental models and priors
- `rules/takshashila-language.md` — Vocabulary and framing standards
