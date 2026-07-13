# Worked example

This shows RBF applied to a hypothetical op-ed, and what got cut to fit the format.

## Source (hypothetical)

An 1,800-word op-ed titled "India's Semiconductor Push Needs Fewer Fabs, More Fabless" arguing that India's PLI-driven fab subsidies are misallocated, and that India should redirect incentives toward chip design (fabless) startups instead. The piece spends ~600 words on the history of the Semicon India programme, ~500 words on global fab economics, ~400 words on the design argument, and ~300 words on two policy recommendations at the end.

## What RBF keeps

- The recommendation (redirect incentives to fabless design) — this is the Bottom Line, even though it appears near the end of the source.
- The 3–4 reasons the author gives for why fabs are the wrong bet (capital intensity, technology-node lag, global overcapacity — only if the source actually states these).
- The two concrete policy asks, if the source names them (e.g., "expand the Design Linked Incentive scheme," "create a fabless-specific credit guarantee").
- India Implications: included here, because the whole piece is about Indian policy — but only the specific mechanisms the source names, not general commentary on Indian semiconductor strategy that RBF itself might independently know.

## What RBF drops

- The history of the Semicon India programme (context, not conclusion).
- General global fab economics not tied directly to the author's argument.
- Any restatement like "India faces a challenge in the semiconductor sector" — a policymaker already knows this; it adds no information.

## Output

```
**Source:** "India's Semiconductor Push Needs Fewer Fabs, More Fabless" — [Author], [Outlet], [Date] — [URL]

## Bottom Line
India's fab-first semiconductor strategy is misallocating scarce subsidy capital; the government should redirect PLI-style incentives from fabrication toward chip design (fabless) startups, where India already has a talent and cost advantage.

## Key Arguments & Results
- Fab economics require sustained multi-billion-dollar capital commitments at the leading edge; India's current subsidy envelope cannot sustain competitiveness against the US, Taiwan, and South Korea.
- Global fab capacity is already expanding faster than demand in the node ranges India is targeting, risking stranded capacity.
- India's existing chip-design workforce (cited by the author as ~20% of global VLSI design engineers) is an underused asset relative to its fab base.
- Fabless firms require a fraction of the capital of a fab and can reach profitability faster, giving India more shots on goal per rupee of subsidy.

## India Implications
- The author recommends expanding the Design Linked Incentive (DLI) scheme's funding ceiling and creating a dedicated credit guarantee facility for fabless startups.
- The author argues MeitY should rebalance the Semicon India programme's incentive mix rather than launching new standalone fab subsidies.
```

Note the omission of any editorializing about whether this argument is correct — RBF reports what the source argues, it does not evaluate it. Use `argument-critique` for that.
