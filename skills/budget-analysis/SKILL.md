---
name: budget-analysis
description: Use this skill when the user says "analyse the budget", "budget analysis", "how much did India spend on X", "compare BE vs actuals", "state budget for Y", "track scheme spending", "budget data for Z ministry", or wants to extract analytical insight from Union or State government budget documents. Guides the analyst from naming a budget to document extraction, ratio computation, chart specifications, and story angles. Does not write the final piece — hands off to op-ed-writing, policy-brief-writing, or discussion-document-writing.
version: 1.0.0
tags: [Research, Budget, PublicFinance, India, DataAnalysis, Takshashila]
---

# Budget Analysis

Guide an analyst through an Indian budget analysis — from identifying the right documents to producing a structured data summary with computed ratios, chart specifications, and story angles. The writing step is handled by the op-ed, policy brief, or discussion document skills.

## When to Use This Skill

- Analyst wants to write about government spending on a topic
- Analyst has budget data and wants to know what it means
- Analyst wants to compare BE (Budget Estimates) vs RE (Revised Estimates) vs Actuals
- Analyst wants to track a ministry, scheme, or sector over multiple years
- Analyst wants to compare states on the same domain

Do not use for revenue/tax analysis (use causal-loop-analysis or hypothesis-development for fiscal policy arguments).

---

## Design Rationale

Budget documents are large, inconsistently formatted, and written for auditors, not analysts. The skill adds value at three points:

1. **Document guidance** — tells the analyst exactly which file to download and which table to open, saving hours of navigation
2. **Parsing messy data** — accepts raw PDF copy-paste, Excel tables, or CSV; extracts a clean structured table and asks the analyst to confirm before computing anything
3. **Ratio computation + interpretation** — turns raw numbers into the ratios that carry analytical meaning (utilisation rate, YoY growth, % of GDP)

The CLI version additionally integrates with:
- `/parliament-search` — for CAG reports, Finance Committee findings, and PAC reports that contextualise the budget data
- `defuddle` — to fetch and parse budget documents directly from government URLs
- Zotero — to store extracted budget data as a citable source

---

## Analytical Frames

Present these after gathering scope. Analyst picks the one that fits their question.

| Frame | Core question | Typical use |
|-------|---------------|-------------|
| **Time Series** | Is spending growing or shrinking? Is budgeted money actually spent? | Track a ministry or scheme across 5–7 years; BE vs Actuals trend |
| **Component Breakdown** | Within this budget head, what are the sub-parts? What share does each hold? | Decompose a ministry into schemes, or a scheme into object heads (salary / capital / transfers) |
| **Scheme Tracking** | Is a specific scheme receiving and utilising its promised allocation? | PLI, MGNREGS, PM-KISAN, Jal Jeevan Mission, PM Awas Yojana |
| **Cross-State Comparison** | How does one state compare to peers on the same sector? | Education spend as % of GSDP: Karnataka vs Tamil Nadu vs UP |

**Multi-tier modifier:** Health, education, agriculture, water, and other Concurrent List subjects draw spending from both Union and State budgets. If the analyst names such a domain, ask: Union-only, State-only, or combined? For combined, guide extraction from both sources and compute the consolidated picture (Union transfers + State own funds).

---

## Process

### Step 1 — Gather scope

Ask in one message:
- Union Budget or a State Budget? (If state: which state?)
- Which year or year range? (e.g. FY2026, or FY2020–FY2025)
- Which domain, ministry, or sector? (or full budget overview)
- If Concurrent List subject: Union-only, State-only, or combined?

### Step 2 — Present the four frames

Show the table above. Ask which frame fits their question. Wait for their choice.

### Step 3 — Document guidance

Tell the analyst exactly where to find the data. Use `defuddle` to fetch and preview the relevant government page if the analyst does not have the file.

**Union Budget** (indiabudget.gov.in):

| Need | Document | Location |
|------|----------|----------|
| Ministry-wise totals BE/RE/Actuals | Expenditure Profile | Budget documents → Expenditure Profile |
| Scheme-level breakdown | Statement 14 | Expenditure Budget Vol 2 → Statement 14 |
| Revenue side | Receipt Budget | Budget documents → Receipt Budget |
| Quick aggregates, % of GDP | Budget at a Glance | Budget documents → Budget at a Glance |

**State Budgets** (state finance department websites):

| Need | Document |
|------|----------|
| Aggregates + % of GSDP | Budget at a Glance |
| Department + object-head breakdown | Detailed Demands for Grants |
| Previous years' actuals | Annual Financial Statement |

Key state URLs: Karnataka (finance.karnataka.gov.in), Maharashtra (finance.maharashtra.gov.in), Tamil Nadu (tnbudget.tn.gov.in), Rajasthan (finance.rajasthan.gov.in), Uttar Pradesh (budget.up.nic.in). For others: search "[state name] state budget finance department".

**CLI advantage — fetch directly:** If the analyst provides a URL, use `defuddle parse <url> --md` to extract the table rather than asking them to copy-paste.

### Step 4 — Supplement with parliamentary oversight

Run `/parliament-search [domain] budget` to find:
- CAG (Comptroller and Auditor General) reports on the ministry/scheme — these contain actual utilisation data and flag systematic underspending
- Public Accounts Committee (PAC) findings on expenditure quality
- Finance Standing Committee reports on budget allocation rationale

These often contain the most analytical content: not just what was spent but whether it was spent effectively.

### Step 5 — Accept and parse data

Say: "Paste whatever you have — raw PDF copy-paste, an Excel table, CSV figures. Any format is fine."

Extract a clean structured table. Present it: "Here is what I understood from your data:" followed by the table. Ask: "Does this look right? Is anything missing?" **Do not compute ratios until the analyst confirms.**

For large files: extract the relevant section only. Government budget spreadsheets can be 50,000+ rows — ask the analyst to paste only the ministry or scheme rows they need.

### Step 6 — Compute ratios (only after confirmation)

| Ratio | Formula | What it reveals |
|-------|---------|----------------|
| BE → RE revision | (RE − BE) / BE × 100 | Mid-year reprioritisation — a large negative means the ministry lost funds |
| RE → Actuals utilisation | Actuals / RE × 100 | Implementation capacity — below 85% is a consistent underperformer |
| YoY nominal growth | (This year − Last year) / Last year × 100 | Whether allocation is growing in real terms |
| % of total budget | Amount / Total budget × 100 | Political priority signal |
| % of GDP / GSDP | Amount / GDP × 100 | International comparability; use nominal GDP from Economic Survey |
| Capital vs revenue split | Capital / Total × 100 | Investment vs consumption; critical for infrastructure ministries |

**Flag anomalies:**
- Utilisation below 85% in multiple consecutive years → systematic implementation failure
- Single-year YoY spike above 50% → election-year spend or scheme launch; check if sustained
- BE revised down by more than 20% → ministry lost political priority mid-year

### Step 7 — Chart specifications

Recommend 2–3 charts. State exact axes, units, and what to annotate. The analyst builds these in R, Excel, or Datawrapper.

| Frame | Recommended chart | Key details |
|-------|------------------|-------------|
| Time Series | Grouped bar (BE/RE/Actuals per FY) + line overlay (% of GDP) | Dual y-axis; annotate policy events (scheme launch, budget cut) |
| Component Breakdown | Horizontal bar sorted descending; or stacked bar across years | Label largest component; show % not just absolute |
| Scheme Tracking | Line chart per scheme across years | Annotate years with sharp changes |
| Cross-State | Dot plot or horizontal bar with national average marked | Label state names; sort by value |

For R users, suggest `ggplot2` with `geom_col()` + `geom_line()` for the dual-axis time series. For Datawrapper, the grouped bar chart type handles BE/RE/Actuals grouping well.

### Step 8 — Story angles

Produce 3–5 evidence-grounded story angles. Each should be one sentence that could become a headline or lead paragraph. Be specific to the numbers:

**Not:** "Defence spending increased."
**Yes:** "Defence capital expenditure grew 18% YoY in FY2025 but utilisation fell to 78%, the lowest in five years — suggesting India is budgeting ambition it lacks the capacity to execute."

### Step 9 — Handoff

End with: "Take this data summary and story angles to the op-ed-writing skill for a newspaper piece, the policy-brief-writing skill for a structured recommendation memo, or the discussion-document-writing skill for a longer analysis. Store budget document sources in Zotero before you close the files."

---

## Integration Points

| Tool | When to use |
|------|-------------|
| `defuddle parse <url> --md` | Fetch and parse a government budget page or PDF URL directly |
| `/parliament-search [domain] budget` | Find CAG reports, PAC findings, Finance Committee reports |
| `zotero-obsidian-bridge` | Store extracted budget data as a citable source |
| `hypothesis-development` | After identifying the story angle, sharpen it into a testable claim |
| `causal-loop-analysis` | If the budget pattern reveals a structural problem (chronic underspending), map the causal loops |
| `op-ed-writing` | Draft the newspaper piece from the story angles |
| `policy-brief-writing` | Draft the structured recommendation memo |
| `discussion-document-writing` | Draft the longer analytical piece |

---

## Output

A structured data summary containing:
- Confirmed clean data table (analyst-verified)
- Computed ratios with anomaly flags
- 2–3 chart specifications (axes, units, annotations)
- 3–5 story angles (specific, number-grounded, one sentence each)
- Pointer to the writing skill to use next

The skill does not produce the final written piece.

---

## India-specific notes

- **FRBM targets** — the Fiscal Responsibility and Budget Management Act sets deficit targets. When analysing Union Budget totals, note whether the year's fiscal deficit was above or below the FRBM ceiling (3% of GDP) — it changes the interpretation of spending increases.
- **Off-budget items** — some Union spending runs through public sector enterprises and extra-budgetary resources (EBR), which do not appear in the standard expenditure statements. For infrastructure sectors (railways, roads), note this caveat.
- **State capacity diagnosis** — use the four-dimension framework: expenditure (too much/too little), size (overstaffed/understaffed), capability (right skills/systems), ambition (overreaching/abdicated). Budget data speaks most directly to the expenditure dimension; ratio analysis helps diagnose capability.
- **Central transfers to states** — for Concurrent List subjects, Union spending often flows to states as Centrally Sponsored Schemes (CSS). The Union budget shows the transfer; the state budget shows how it was spent. Both are needed for a complete picture.
