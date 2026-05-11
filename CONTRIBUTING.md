# Contributing to Takshashila Scholar

Takshashila Scholar is an open-source Claude Code plugin for policy research. Contributions are welcome from Takshashila researchers, students, and external collaborators.

---

## How to add a new skill

### 1. Create the skill directory

```
skills/[skill-name]/
  SKILL.md               — main skill definition (required)
  references/            — supporting reference files (optional)
    [reference].md
```

Skill names: kebab-case, gerund form where possible (`policy-brief-writing`, not `write-policy-brief`).

### 2. Write SKILL.md

Use this frontmatter:

```yaml
---
name: skill-name
description: One-sentence description. Start with trigger phrases: "Use this skill when the user asks to...". Include what the skill produces.
version: 1.0.0
tags: [Category1, Category2]
---
```

The `description` field is critical — it is what Claude reads to decide whether to invoke the skill. Include the exact trigger phrases a user would say.

### 3. Skill quality checklist

Before submitting a new skill:

- [ ] Trigger phrases in description match natural user language
- [ ] The skill produces a named, specific output (not just "analysis")
- [ ] India-specific context is included where relevant (not generic Western policy defaults)
- [ ] Language complies with `rules/takshashila-language.md` (Indian subcontinent not South Asia, West Asia not Middle East, no jargon)
- [ ] Takshashila's four commitments are not violated — run `takshashila-values-review` on any draft outputs the skill produces
- [ ] No personal workflow assumptions (no hardcoded personal paths, no personal names as defaults)
- [ ] Quality checklist is included in the skill

### 4. Register the skill

Add an entry to `CLAUDE.md` under the appropriate section in the Skills Directory.

### 5. Add a command (if needed)

If the skill warrants a slash command, add `commands/[command-name].md`. Commands are thin wrappers — they explain what the skill does and how to invoke it. Keep command files under 30 lines.

---

## How to improve an existing skill

1. Read the existing SKILL.md and understand what it currently does.
2. Make the minimum change needed — don't refactor surrounding content.
3. Bump the minor version (1.0.0 → 1.1.0 for improvements, 1.0.0 → 2.0.0 for breaking changes to output format).
4. Test: invoke the skill in Claude Code on a real policy problem and verify the output matches the documented format.

---

## Review criteria

Pull requests are reviewed for:

| Criterion | What we check |
|-----------|--------------|
| Trigger phrases | Do they match how a researcher would actually phrase the request? |
| Output quality | Does the output format produce something publication-ready? |
| India grounding | Is the skill adapted to India's institutional context, or is it a generic Western policy template? |
| Language compliance | Does it follow `rules/takshashila-language.md`? |
| Values alignment | Does the output sit comfortably within Takshashila's four commitments? |
| No personalisation | Does it assume any specific person's file paths, tools, or preferences? |

---

## Adapting for other South Asian contexts

This plugin is designed to be adaptable. If you are building a version for a Sri Lankan, Bangladeshi, or Nepali policy context:

1. Create a new `rules/[country]-language.md` with jurisdiction-specific vocabulary standards.
2. Update `CLAUDE.md` to reference the new rules file.
3. Adjust the `bardach-policy-analysis` skill's Step 1 to reference the relevant federal/unitary structure and constitutional framework.
4. Add country-specific source-finding guidance in `references/bardach-steps.md`.

Please open a GitHub issue before starting a major localisation effort — we may be able to help or coordinate.

---

## Reporting issues

Open a GitHub issue with:
- Which skill or command is affected
- What you expected it to do
- What it actually did
- The policy problem or input you were working with (redact sensitive content if needed)
