---
name: obsidian-writeback
description: Deterministically create or update one canonical Obsidian note in the bound project knowledge base using the project_kb.py helper
args:
  - name: kind
    description: knowledge, paper, experiment, result, or writing
    required: true
  - name: query
    description: Semantic query used to resolve the best existing canonical note when no explicit note path is given
    required: false
  - name: note
    description: Explicit project-relative note path to create or update
    required: false
  - name: title
    description: Preferred title when creating a new note
    required: false
tags: [Research, Obsidian, Writeback, Canonical Notes]
---

# /obsidian-writeback - Deterministic Canonical Note Writeback

Use this command when the user explicitly wants a canonical Obsidian note to be created or updated and you do not want to rely on ad-hoc freeform vault editing.

## Default workflow

1. Resolve the bound project knowledge base.
2. Read the minimum context first:
   - `.opencode/project-memory/<project_id>.md`
   - `00-Hub.md`
   - `01-Plan.md`
   - the best matching canonical note, if it already exists
3. Synthesize the final markdown content **before** writing.
4. Save that prepared markdown to a temporary file.
5. Call the deterministic helper:

```bash
python3 "$HOME/.opencode/skills/obsidian-project-memory/scripts/project_kb.py" writeback-note \
  --cwd "$PWD" \
  --kind "$kind" \
  --query "$query" \
  --title "$title" \
  --content-file "$temp_file"
```

If the target path is already known, prefer:

```bash
python3 "$HOME/.opencode/skills/obsidian-project-memory/scripts/project_kb.py" writeback-note \
  --cwd "$PWD" \
  --kind "$kind" \
  --note "$note" \
  --title "$title" \
  --content-file "$temp_file"
```

## What the helper does

- resolves the best canonical target note,
- updates that note or creates it if missing,
- normalizes frontmatter (`type`, `title`, `project`, `status`, `updated`),
- refreshes `00-Hub.md` core index safely,
- appends a minimal writeback record to today's `Daily/`,
- updates repo-local project memory.

## Preferred usage

- Use this command for:
  - `Knowledge/Project-Overview.md`
  - `Knowledge/Research-Questions.md`
  - canonical experiment notes
  - canonical result notes
  - canonical paper notes
  - writing notes that already have a stable durable target
- Prefer this command whenever the user has asked for **actual knowledge-base maintenance**, not just exploration.

## Final response

Include:
- whether the helper created or updated the note,
- the final canonical note path,
- any related daily / project-memory writeback surfaces,
- optional Obsidian open shortcuts.
