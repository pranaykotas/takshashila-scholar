---
name: find-framework
description: Use this skill when the user asks to "find a framework for", "which framework applies to", "what frameworks exist for", or "help me think about [problem] using a framework". Searches 99 Takshashila policy frameworks by problem description, matching against use_cases and tags. Returns top 3-5 relevant frameworks with title, why-it-applies, and link.
version: 1.0.0
tags: [Analysis, Frameworks, PolicyAnalysis, India]
---

# Find Framework

Surface relevant frameworks from Takshashila's 99-framework library by matching a policy problem description against framework use cases and tags.

## Data Source

**Local (preferred):** `frameworks.json` at one of these paths (first found wins):
1. `$FRAMEWORKS_PATH` (environment variable if set)
2. `../frameworks/frameworks.json` (sibling repo — standard Takshashila setup)
3. `~/Projects/frameworks/frameworks.json`
4. `~/.claude/plugins/takshashila-frameworks/frameworks.json`

**Fallback (if no local file):** Direct the user to `https://frameworks.pranaykotas.com/find-framework.html` with instructions to describe their problem there.

## Process

### Step 1: Locate frameworks.json

Try each path in order. If found, confirm: "Found [N] frameworks at [path]."

If not found: output the fallback message (see Output Format section).

### Step 2: Match frameworks to the problem

Read the user's problem description. For each framework entry, score relevance by:
1. **use_cases match** — does any use_case string semantically match the problem? (keyword overlap, conceptual match)
2. **tags match** — do the tags align with the problem domain?
3. **summary match** — does the summary describe something applicable?

Return the **top 3–5 matches**, ranked by relevance. Do not return frameworks that are only tangentially related — a match should be genuinely useful for this problem.

### Step 3: Output

For each matched framework, output:
- **Title**
- **Why it applies** — one sentence connecting the framework to this specific problem (not just the framework's generic description)
- **Link** — `https://frameworks.pranaykotas.com/[slug]`

Then: offer to go deeper. "Want me to apply [top framework] to your problem? I can walk through it in detail."

---

## Output Format

### If local file found:

```
Found [N] relevant frameworks for "[problem summary]":

**1. [Framework Title]**
Why it applies: [One sentence connecting to this specific problem]
Link: https://frameworks.pranaykotas.com/[slug]

**2. [Framework Title]**
Why it applies: [...]
Link: https://frameworks.pranaykotas.com/[slug]

**3. [Framework Title]**
Why it applies: [...]
Link: https://frameworks.pranaykotas.com/[slug]

[4-5 if relevant]

---
Want me to apply [top framework] to your problem in detail? Say "apply [framework name]" or continue with `/policy-analysis` to run the full Bardach analysis.
```

### If local file not found:

```
Frameworks database not found locally. You can find all 99 frameworks at:

https://frameworks.pranaykotas.com/find-framework.html

Describe your problem there to get framework recommendations. Or clone the frameworks repo:

  git clone https://github.com/pranaykotas/frameworks
  (then re-run /find-framework)

Based on the problem description, likely relevant framework categories:
- [Category 1]: [frameworks.pranaykotas.com/categories/category-1]
- [Category 2]: [frameworks.pranaykotas.com/categories/category-2]
```

---

## Integration Points

### In Bardach Step 1 (define the problem)
After the problem is defined, automatically offer framework lookup:
> "You described a [type] problem. Let me check which frameworks apply — running find-framework."
Then call this skill and show top 2–3 results before moving to Step 2.

### In `/scholar` routing
New routing branch: "I want to find a framework for my problem" → this skill.

### In `/student-start` onboarding
Mention `frameworks.pranaykotas.com` as the vocabulary-building resource for students who don't yet know what frameworks exist.

---

## Categories available in frameworks.json

Based on the actual data, frameworks span:
- `public-policy` — general policy analysis frameworks
- `public-finance` — fiscal, budget, and taxation frameworks
- `foreign-policy-defence-geopolitics` — IR, security, geopolitics
- `political-thinking` — political economy, institutions, power
- `society` — social policy, inequality, community

When the local file is unavailable, use these categories to give directional guidance.
