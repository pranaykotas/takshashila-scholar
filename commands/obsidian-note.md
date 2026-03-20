---
name: obsidian-note
description: Manage a single canonical note lifecycle inside the bound Obsidian project knowledge base, including archive, purge, rename, candidate lookup, and deterministic writeback handoff
args:
  - name: action
    description: archive, purge, rename, find, or writeback
    required: true
  - name: kind
    description: knowledge, paper, experiment, result, or writing
    required: true
  - name: query
    description: Search query or project-relative note path depending on the action
    required: true
  - name: dest
    description: Destination note path for rename
    required: false
tags: [Research, Obsidian, Note Lifecycle, Canonical Notes]
---

# /obsidian-note - Single Canonical Note Lifecycle

Use this command to operate on one canonical note.

## Workflow

### Find

Use:
```bash
python3 "$HOME/.opencode/skills/obsidian-project-memory/scripts/project_kb.py" find-canonical-note --cwd "$PWD" --kind "$kind" --query "$query"
```

### Archive / Purge / Rename

Use:
```bash
python3 "$HOME/.opencode/skills/obsidian-project-memory/scripts/project_kb.py" note-lifecycle --cwd "$PWD" --mode "$action" --note "$query"
```

If `action=rename`, also pass:
```bash
--dest "$dest"
```

### Writeback

If `action=writeback`, prefer `/obsidian-writeback` for the full deterministic flow. The low-level helper is:

```bash
python3 "$HOME/.opencode/skills/obsidian-project-memory/scripts/project_kb.py" writeback-note --cwd "$PWD" --kind "$kind" --query "$query" --title "$dest" --content-file "$temp_file"
```

## Expected behavior

- `archive` -> move the note into `Archive/` and repair direct links in `00-Hub.md`, `01-Plan.md`, and explicit index notes
- `purge` -> permanently delete the note and repair direct links in the same canonical surfaces
- `rename` -> move the note and repair direct links without treating it as delete + create
- `find` -> return candidate canonical notes and recommended reads
- `writeback` -> deterministically create or update the resolved canonical note through the helper instead of relying on ad-hoc manual vault edits

## Final response

Include:
- affected note path(s)
- repaired index or hub surfaces
- optional Obsidian open/URI shortcuts
- for `purge`, make the permanence explicit
