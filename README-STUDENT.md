<div align="center">

  <img src="LOGO.png" alt="Takshashila Scholar Logo" width="60%"/>

</div>

# Takshashila Scholar — For Students and Policy Enthusiasts

> A structured way to think about Indian policy problems — using the same analytical tools as researchers at the [Takshashila Institution](https://takshashila.org.in). Works as a plugin for Claude Code, Anthropic's free AI assistant.

**→ Takshashila researcher or fellow? See [README.md](README.md)**

---

## What is this?

Most people use AI assistants to get quick answers. This plugin does something different: it makes you *think more rigorously* about a policy problem by walking you through it step by step.

You describe a policy problem. The tool asks you questions — who is affected, what are the alternatives, what does the evidence show, what are the trade-offs, who needs to act. At the end you have a structured Policy Analysis Memo: your own thinking, made explicit and defensible.

It is not a shortcut. It is a scaffold.

---

## What does it actually look like?

**You type:**
```
/policy-analysis Should India expand its semiconductor PLI scheme to include
chip design subsidies, or is the existing focus on fabrication sufficient?
```

**The tool walks you through 8 questions:**
1. What exactly is the problem? (Not "we need better policy" — what welfare is actually being lost, for whom?)
2. What evidence exists on the scale of the problem?
3. What are the genuine alternatives — including doing nothing?
4. What criteria matter for evaluating them (efficiency, equity, political feasibility)?
5. What does the causal chain look like? Where is the weakest link?
6. What are the real trade-offs — who gains, who loses?
7. What do you recommend, and who needs to act?
8. Who is your audience, and how do you frame this for them?

**You get:** A Policy Analysis Memo with your answers structured and ready to use as the basis for a paper, essay, or op-ed.

---

## Who made the analytical framework?

The 8-step methodology comes from Eugene Bardach's *A Practical Guide for Policy Analysis* — the standard text in most public policy programmes worldwide.

The India-specific lenses come from the Takshashila Institution's teaching tradition:
- **State capacity check**: is this a spending problem, a capability problem, or an ambition problem?
- **Federal jurisdiction**: is this Union List, State List, or Concurrent List?
- **All sectors can fail**: don't default to either pure-government or pure-market solutions
- **Better or worse, not good or bad**: policy analysis is comparative, not moral

These are not arbitrary additions. They reflect the institutional knowledge of researchers who have studied Indian policy for decades.

---

## The intellectual tradition behind it

Takshashila Scholar is built on four commitments of the [Takshashila Institution](https://takshashila.org.in). These are made explicit so you know where the analytical judgements come from:

- **Freedom** — individual liberty matters; arbitrary state power should be limited
- **Pluralism** — India's diversity is a feature, not a problem; multiple value systems are legitimate
- **Citizenship** — civic participation, accountability, and constitutional fidelity are obligations, not optionals
- **Realism in international relations** — India's foreign policy is best assessed by interests and power, not by ideology or wishful thinking

You may disagree with some of these. That is fine. Knowing the starting premises helps you identify where your analysis diverges.

---

## Getting started: 3 steps

### Step 1: Install Claude Code

Claude Code is Anthropic's free AI assistant that runs in your terminal. Think of it as Claude (the AI chatbot) with memory and access to your files.

```bash
npm install -g @anthropic/claude-code
```

You need [Node.js](https://nodejs.org) installed first, and an [Anthropic account](https://console.anthropic.com) — the free tier is sufficient.

### Step 2: Install the plugin

```bash
git clone https://github.com/pranaykotas/takshashila-scholar ~/.claude/plugins/takshashila-scholar
```

### Step 3: Run it

Open your terminal in any folder and type:

```bash
claude
```

Then in the Claude Code session, type:

```
/student-start
```

This will orient you and suggest a first exercise.

---

## Your first exercise

Pick any policy issue in the news this week. Run:

```
/policy-analysis [describe the issue in 2–3 sentences]
```

Do not look anything up first. Answer the questions from what you already know, and flag what you do not know as evidence gaps. The point is to see how the analytical structure clarifies your thinking — not to produce a perfect memo.

After the analysis, try:

```
find a framework for [same issue]
```

This will show which of Takshashila's 99 analytical frameworks apply to your problem. Good for building analytical vocabulary.

---

## Two starting points — which one is right for you?

**"I have an argument I want to make"**
You already have a view. You want to test it, defend it, find the evidence for it.
```
hypothesis-development
```
Trigger: say "I have a hypothesis: [your argument]"

This walks you through: Is the claim falsifiable? What's the causal mechanism? What assumptions does it rest on? What evidence would disprove it? Produces a Research Brief that anchors everything you write next.

---

**"I have a question I need to think through"**
You don't have a view yet. You need to work through the options systematically.
```
/policy-analysis [describe the question]
```
This walks you through Bardach's 8 steps: define the problem, gather evidence, consider alternatives, evaluate trade-offs, make a recommendation. Produces a Policy Analysis Memo.

---

**Not sure which?** Ask yourself: "Can I state my argument in one sentence?"
- Yes → `hypothesis-development`
- Not yet → `/policy-analysis`

Or just run `/scholar` — it asks you this question and routes you.

---

## What else can it do?

| Task | How to trigger |
|------|---------------|
| Test a hypothesis or argument | "I have a hypothesis: [your argument]" |
| Analyse a policy problem systematically | `/policy-analysis [problem]` |
| Find a policy framework for a problem | "find a framework for [problem]" |
| Critique the logic of an argument | "critique this argument: [paste text]" |
| Map all the actors in a policy area | "stakeholder analysis for [topic]" |
| Make the causal logic of an argument explicit | "causal analysis of [argument]" |
| Write a structured policy brief | `/policy-brief` |
| Write a newspaper op-ed | `/op-ed` |
| Find parliamentary committee reports | `/parliament-search [topic]` |
| Get routing help | `/scholar` |

---

## The frameworks library

[frameworks.pranaykotas.com](https://frameworks.pranaykotas.com) has 99 policy frameworks explained in plain language — with examples, use cases, and when not to apply them. Good for building the vocabulary of policy analysis before you run a full Bardach analysis.

Good starting frameworks for students:
- **Outlays Outputs Outcomes** — the basic chain from spending to results
- **Seven Stages of the Policy Pipeline** — how a policy idea becomes law becomes implementation
- **Principal-Agent Problem** — why the people who design policy and the people who implement it often want different things
- **Regulatory Capture** — why the regulator often ends up serving the regulated

---

## A note on what this is not

This tool will not write a policy paper for you. It will ask you questions and structure your answers. The thinking is yours.

It will not tell you the "right" answer to a policy question. It will surface the trade-offs and make you confront them explicitly. Policy analysis is about "better or worse compared to what alternative" — not about moral verdicts.

It will not replace reading. The evidence gaps it surfaces are real gaps. Filling them requires finding primary sources: committee reports, ministry data, academic research. The `/parliament-search` command helps with this for Indian topics.

---

## Questions or issues

Open a GitHub issue at [github.com/pranaykotas/takshashila-scholar](https://github.com/pranaykotas/takshashila-scholar/issues).

## License

MIT
