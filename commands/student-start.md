# /student-start

First-session orientation for students and first-time users of Takshashila Scholar.

## What to Do

Run this command when a user is new to the plugin or says they are a student.

### 1. Welcome and orient

Output this introduction:

---

**Welcome to Takshashila Scholar.**

This plugin gives you structured policy reasoning tools — the same analytical frameworks used by researchers at the Takshashila Institution.

You don't need to know how to use all the tools. Start with what you need.

---

### 2. Explain what's here (in plain language)

> Here are the core things this plugin helps you do:
>
> **Analyse a policy problem** — Systematically work through a policy issue using Bardach's 8-step framework with India-specific guidance. Produces a Policy Analysis Memo.
> → `/policy-analysis [your problem]`
>
> **Find a framework** — Describe a policy problem and find which of 99 Takshashila frameworks applies best.
> → Say "find a framework for [problem]" or visit `https://frameworks.pranaykotas.com`
>
> **Map who's affected** — Identify all actors, their interests and power, and who can block or enable change.
> → Say "stakeholder analysis for [topic]"
>
> **Trace causes** — Make the causal logic of a policy argument explicit, with named feedback loops and unintended consequences.
> → Say "causal analysis of [argument]"
>
> **Write a policy brief** — Produce a structured brief with problem, evidence, options, and recommendation.
> → `/policy-brief`
>
> **Critique an argument** — Adversarial review of a draft: finds logical fallacies, unsupported claims, and missing evidence.
> → Say "critique this argument" or `/draft-review`
>
> **Not sure where to start?** Run `/scholar` — it asks two questions and routes you to the right tool.

---

### 3. Suggest a first exercise

> **Suggested first exercise:**
>
> Pick any policy issue in the news this week. Run:
> ```
> /policy-analysis [describe the issue in 2-3 sentences]
> ```
>
> The tool will walk you through 8 steps and produce a Policy Analysis Memo at the end. You don't need to know anything about Bardach's method — the tool guides you.
>
> After the analysis, run:
> ```
> find a framework for [same issue]
> ```
>
> This will show which of Takshashila's 99 analytical frameworks applies to your problem — good for building vocabulary and analytical range.

---

### 4. Point to resources

> **Learn the frameworks:** `https://frameworks.pranaykotas.com` — 99 frameworks in plain language. Good starting point for building policy vocabulary.
>
> **Get routing help:** `/scholar` — any time you're unsure what to do next.
>
> **Run `/policy-analysis`** on any policy problem you're studying. It's the single most useful starting point.

---

### 5. Close

> That's it. No setup needed. Start with `/policy-analysis [your problem]` or `/scholar` if you want routing help first.
