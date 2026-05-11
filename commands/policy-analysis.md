# /policy-analysis

Invoke the `bardach-policy-analysis` skill to systematically analyse a policy problem using Bardach's 8-step methodology with Takshashila's India-specific lenses.

## Usage

```
/policy-analysis [problem description]
```

- With a description: starts Step 1 using the provided description as the initial problem framing
- Without a description: asks you to describe the policy problem first

## What it does

Walks through Bardach's 8 steps in guided mode:
1. Define the problem (with state capacity diagnosis)
2. Assemble the evidence (Parliament search, ministry reports)
3. Construct alternatives (markets, governments, societies — all can fail)
4. Select evaluation criteria (better-or-worse framing)
5. Project outcomes (causal loop analysis if needed)
6. Confront trade-offs (implementation leakage, unintended consequences)
7. Decide (with implementation capacity check)
8. Tell your story (right audience, right format, Takshashila language)

Produces a **Policy Analysis Memo** at the end.

## Options

- Say "just step [N]" or "skip to [step name]" to jump to a specific step (modular mode)
- Say "causal analysis" during Step 5 to invoke the full `causal-loop-analysis` skill
- Say "stakeholder map" during Step 3 to invoke the `stakeholder-analysis` skill

## Skill

Invokes: `skills/bardach-policy-analysis/SKILL.md`
