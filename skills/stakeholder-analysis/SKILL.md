---
name: stakeholder-analysis
description: Use this skill when the user asks to "do a stakeholder analysis", "map the stakeholders", "who are the actors in [policy area]", "interest power matrix", "who can block this policy", "coalition mapping", "who needs to be on side", or as part of the research lifecycle before drafting. Maps all relevant actors on an interest × power matrix, identifies coalitions and veto players, and derives implications for the research argument.
version: 1.0.0
tags: [Analysis, Stakeholders, PolicyAnalysis, PoliticalEconomy, Takshashila]
---

# Stakeholder Analysis

Map the political economy of a policy problem. Identify who has power and who has interest, what coalitions exist, who can block, and what this means for your argument.

## Framework

Based on the **interest × power matrix** — a standard tool in policy analysis and advocacy planning.

| Quadrant | Power | Interest | Strategy |
|----------|-------|----------|----------|
| **Key Players** | High | High | Manage Closely — keep engaged, address their concerns |
| **Latent Blockers** | High | Low | Keep Satisfied — don't ignore; they can mobilize |
| **Advocates** | Low | High | Keep Informed — potential amplifiers or vocal opponents |
| **Peripheral** | Low | Low | Monitor — low priority, but can shift |

**Power** = ability to influence the policy outcome (formal authority, financial resources, political networks, veto rights, implementation control)

**Interest** = degree to which the actor is affected by or invested in the policy outcome (directly affected, aligned with institutional mandate, financially at stake)

---

## Process

### Step 1: Identify Stakeholders

Cast wide before narrowing. For each category, list all plausible actors:

**State actors:**
- Central government ministries (which ones? Who is lead ministry?)
- Regulatory bodies (TRAI, SEBI, CCI, DPIIT, etc.)
- Parliamentary committees (which DRSC?)
- State governments (if federalism is relevant)
- Public sector enterprises (if relevant)

**Non-state actors:**
- Industry associations (CII, FICCI, NASSCOM, sector-specific bodies)
- Individual firms (domestic champions, foreign entrants, incumbents)
- Civil society and advocacy groups
- Academic and think tank voices (who gets cited in policy debates)
- Media (which outlets shape discourse on this issue)

**International actors:**
- Foreign governments with stake in the outcome
- International organizations (WTO, IMF, World Bank, etc.)
- Multinational corporations
- Foreign-funded NGOs (if relevant)

**Sub-national actors:**
- State governments with competing interests
- Local governments or urban bodies (if applicable)

### Step 2: Score on Interest and Power

For each actor, score on two dimensions:

**Power score (1–5):**
- 5: Formal veto or approval authority (Ministry, Cabinet)
- 4: Significant implementation control or political influence
- 3: Can delay or complicate but not block
- 2: Marginal influence through voice or advocacy
- 1: Minimal formal or informal influence

**Interest score (1–5):**
- 5: Core mandate or financial interest directly at stake
- 4: Significant secondary interest
- 3: Moderate concern; would engage if asked
- 2: Peripheral interest; likely indifferent
- 1: No meaningful interest

Plot on the 2×2 matrix. Actors with Power ≥ 3 and Interest ≥ 3 are Key Players.

### Step 3: Identify Coalitions and Tensions

Group actors by likely alignment:
- **Pro-reform coalition**: Who benefits from the proposed policy? Who would campaign for it?
- **Status quo coalition**: Who benefits from the current arrangement? Who would resist change?
- **Swing actors**: Who could go either way? What would shift them?

Look for **unexpected alignments**: actors from different sectors who share the same interest in this specific issue.

### Step 4: Identify Veto Players

Veto players are actors whose agreement is *necessary* for the policy to be adopted or implemented. In India's institutional context:

- **Legislative veto**: Is a law required? Which committee? Floor majority needed?
- **Executive veto**: Which minister? Does Cabinet approval apply?
- **Regulatory veto**: Does a regulator need to approve or issue a notification?
- **Judicial veto**: Could this be challenged in court? Which court?
- **Fiscal veto**: Does the Finance Ministry need to approve spending?
- **Federal veto**: Is state consent needed? (Concurrent list items, GST Council, etc.)
- **Implementation veto**: Even if approved, who controls on-the-ground implementation? Can they obstruct?

### Step 5: Derive Research Implications

The stakeholder map has direct implications for how the argument should be made:

- **Which Key Players does the argument need to address?** Their specific concerns should be pre-empted or addressed directly.
- **Who is the most dangerous challenger?** The argument should engage their strongest objection, not their weakest.
- **What coalition does the recommendation require?** Is it politically achievable given the veto players?
- **Who is the target audience?** The argument should be pitched to actors who can move the policy outcome.

---

## Output Format

```
## Stakeholder Analysis: [Policy Topic]

### Stakeholder Map

| Actor | Type | Power (1-5) | Interest (1-5) | Quadrant | Stance |
|-------|------|-------------|----------------|----------|--------|
| [Ministry X] | State | 5 | 4 | Key Player | Pro/Against/Neutral |
| [Industry body Y] | Non-state | 3 | 5 | Advocate | ... |
| [...] | ... | ... | ... | ... | ... |

### Interest × Power Matrix (text representation)

HIGH POWER
  Key Players          Latent Blockers
  [actors here]        [actors here]
──────────────────────────────────────
  Advocates            Peripheral
  [actors here]        [actors here]
LOW POWER
         LOW INTEREST   HIGH INTEREST

### Coalition Map

**Pro-reform coalition:**
- [Actor 1] — because [interest]
- [Actor 2] — because [interest]

**Status quo coalition:**
- [Actor 1] — because [interest]

**Swing actors:**
- [Actor] — would shift if [condition]

### Veto Players

| Veto Point | Actor | Veto Type | How to Address |
|------------|-------|-----------|----------------|
| [Legislative] | [Committee] | [Approval needed] | [What the argument needs to show] |
| [Regulatory] | [Body] | [Notification required] | [...] |

### Research Implications

**Arguments to pre-empt:** [Which Key Player's concerns the draft must address]
**Strongest challenger:** [Who and why — feeds into argument-critique]
**Target audience for this piece:** [Specific actor or constituency]
**Coalition viability:** [Is the recommended policy politically achievable? What's missing?]

### Next Steps
- [ ] Run `argument-critique` — ensure draft addresses [Key Player]'s main concern
- [ ] Run `causal-loop-analysis` — trace mechanism through [critical actor]'s behaviour
- [ ] [Other steps]
```

---

## Quality Checklist

- [ ] All four quadrants populated (not just Key Players)
- [ ] At least one veto player identified per relevant institutional pathway
- [ ] Coalition map shows both pro and con (not just supporters)
- [ ] Swing actors identified — this is where policy outcomes are often determined
- [ ] Research implications are specific ("address Ministry X's concern about Y") not generic ("consider stakeholders")
- [ ] International actors included if the policy has geopolitical or trade dimensions
- [ ] Sub-national dimension addressed if the policy involves state implementation

---

## Indian Policy Context: Common Structural Patterns

**Centre-state dynamics:** Most substantive policies require state implementation. Even Central policies can be blocked by state governments through administrative non-compliance. Always check: is state consent formal (Concurrent list) or informal (implementation)?

**Inter-ministerial turf:** In India, multiple ministries often have overlapping jurisdiction. MeitY vs. DPIIT on electronics; MEA vs. Commerce on trade agreements; Finance vs. sector ministries on PLI. Who is the lead ministry? Who will resist being sidelined?

**Industry association vs. firm interest:** CII/FICCI/NASSCOM positions often reflect the median large-firm interest, not SME interests. Check: is there a split within the industry? Large vs. small? Domestic vs. foreign?

**Parliamentary committee as stakeholder:** The relevant DRSC often has ongoing work on the topic. Their recommendations are a political input even if not legally binding. Engaging with their reports is de facto engaging with the committee.
