#!/usr/bin/env bash
# ============================================================
# Claude Scholar — Codex CLI Installer
# ============================================================
# Usage: bash scripts/setup.sh
# Supports fresh install and safer incremental updates.

set -euo pipefail

CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
BACKUP_ROOT="$CODEX_HOME/.codex-scholar-backups"
BACKUP_STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$BACKUP_ROOT/$BACKUP_STAMP"
BACKUP_READY=0
BACKUP_COUNT=0
UPDATED_COUNT=0
SKIPPED_COUNT=0

# --- State flags ---
SKIP_PROVIDER=false
SKIP_AUTH=false
PROVIDER_NAME=""
PROVIDER_URL=""
MODEL=""
API_KEY=""

# --- Colors ---
green()  { printf "\033[32m%s\033[0m" "$1"; }
red()    { printf "\033[31m%s\033[0m" "$1"; }
yellow() { printf "\033[33m%s\033[0m" "$1"; }
bold()   { printf "\033[1m%s\033[0m" "$1"; }
info()   { echo -e "\033[1;34m[INFO]\033[0m $*"; }
warn()   { echo -e "\033[1;33m[WARN]\033[0m $*"; }
error()  { echo -e "\033[1;31m[ERROR]\033[0m $*"; exit 1; }

# --- Presets ---
declare -a PRESET_NAMES=("openai" "custom")
declare -a PRESET_LABELS=("OpenAI (official)" "Custom provider")
declare -a PRESET_URLS=("https://api.openai.com/v1" "")
declare -a PRESET_MODELS=("gpt-5.4" "")

ensure_backup_dir() {
  if [ "$BACKUP_READY" -eq 0 ]; then
    mkdir -p "$BACKUP_DIR"
    BACKUP_READY=1
    info "Backup directory: $BACKUP_DIR"
  fi
}

backup_path() {
  local target="$1"
  [ -e "$target" ] || return 0

  ensure_backup_dir

  local rel="${target#$CODEX_HOME/}"
  if [ "$rel" = "$target" ]; then
    rel="$(basename "$target")"
  fi

  mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
  if [ -d "$target" ]; then
    cp -R "$target" "$BACKUP_DIR/$rel"
  else
    cp -p "$target" "$BACKUP_DIR/$rel"
  fi
  BACKUP_COUNT=$((BACKUP_COUNT + 1))
}

ensure_parent_dir() {
  local target_path="$1"
  local parent_dir
  parent_dir="$(dirname "$target_path")"

  if [ -e "$parent_dir" ] && [ ! -d "$parent_dir" ]; then
    backup_path "$parent_dir"
    rm -f "$parent_dir"
  fi

  mkdir -p "$parent_dir"
}

copy_file_safely() {
  local src_file="$1"
  local target_file="$2"

  ensure_parent_dir "$target_file"

  if [ -f "$target_file" ] && cmp -s "$src_file" "$target_file"; then
    SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
    return 0
  fi

  if [ -e "$target_file" ]; then
    backup_path "$target_file"
    [ -d "$target_file" ] && rm -rf "$target_file"
  fi

  cp -p "$src_file" "$target_file"
  UPDATED_COUNT=$((UPDATED_COUNT + 1))
}

copy_dir_safely() {
  local src_dir="$1"
  local target_dir="$2"

  if [ -e "$target_dir" ] && [ ! -d "$target_dir" ]; then
    backup_path "$target_dir"
    rm -f "$target_dir"
  fi
  ensure_parent_dir "$target_dir/.dir"
  mkdir -p "$target_dir"

  while IFS= read -r -d '' src_file; do
    local rel="${src_file#$src_dir/}"
    local target_file="$target_dir/$rel"
    copy_file_safely "$src_file" "$target_file"
  done < <(find "$src_dir" -type f -print0)
}

check_deps() {
  command -v git >/dev/null || error "Git is required."
  command -v python3 >/dev/null || error "Python 3 is required."
  if ! command -v codex >/dev/null; then
    warn "Codex CLI not found. Install: npm i -g @openai/codex"
  fi
}

detect_existing() {
  echo ""
  if [ -f "$CODEX_HOME/config.toml" ]; then
    info "Existing config.toml found at $CODEX_HOME/config.toml"
    local cur_model cur_provider
    cur_model=$(grep '^model ' "$CODEX_HOME/config.toml" 2>/dev/null | head -1 | sed 's/.*= *"//;s/".*//' || true)
    cur_provider=$(grep '^model_provider ' "$CODEX_HOME/config.toml" 2>/dev/null | head -1 | sed 's/.*= *"//;s/".*//' || true)
    [ -n "$cur_model" ] && info "  Current model: $cur_model"
    [ -n "$cur_provider" ] && info "  Current provider: $cur_provider"
    echo ""
    read -rp "Keep existing provider/model config? [Y/n]: " keep_config
    if [ "$keep_config" != "n" ] && [ "$keep_config" != "N" ]; then
      SKIP_PROVIDER=true
      info "Keeping existing provider/model configuration"
    fi
  fi

  if [ -f "$CODEX_HOME/auth.json" ]; then
    local existing_key
    existing_key=$(grep -o '"OPENAI_API_KEY"[[:space:]]*:[[:space:]]*"[^"]*"' "$CODEX_HOME/auth.json" 2>/dev/null | sed 's/.*: *"//;s/"$//' || true)
    if [ -n "$existing_key" ]; then
      local masked="${existing_key:0:8}...${existing_key: -4}"
      info "Existing API key found: $masked"
      read -rp "Keep existing API key? [Y/n]: " keep_key
      if [ "$keep_key" != "n" ] && [ "$keep_key" != "N" ]; then
        SKIP_AUTH=true
        info "Keeping existing API key"
      fi
    fi
  fi
}

choose_provider() {
  if [ "$SKIP_PROVIDER" = true ]; then
    return
  fi

  echo ""
  bold "Select API provider:"
  echo ""
  for i in "${!PRESET_LABELS[@]}"; do
    echo "  $((i+1))) ${PRESET_LABELS[$i]}"
  done
  echo ""

  local choice
  read -rp "Enter choice [1-2] (default: 1): " choice
  choice="${choice:-1}"

  local idx=$((choice - 1))
  if [ "$idx" -lt 0 ] || [ "$idx" -ge "${#PRESET_NAMES[@]}" ]; then
    error "Invalid choice: $choice"
  fi

  PROVIDER_NAME="${PRESET_NAMES[$idx]}"
  PROVIDER_URL="${PRESET_URLS[$idx]}"
  MODEL="${PRESET_MODELS[$idx]}"

  if [ "$PROVIDER_NAME" = "custom" ]; then
    read -rp "Provider name: " PROVIDER_NAME
    read -rp "Base URL: " PROVIDER_URL
    read -rp "Model name: " MODEL
  else
    echo ""
    read -rp "Model name (default: $MODEL): " input_model
    MODEL="${input_model:-$MODEL}"
  fi

  info "Provider: $PROVIDER_NAME | URL: $PROVIDER_URL | Model: $MODEL"
}

configure_api_key() {
  if [ "$SKIP_AUTH" = true ]; then
    return
  fi

  echo ""
  read -rp "Enter API key (OPENAI_API_KEY, or press Enter to skip): " API_KEY
  if [ -z "$API_KEY" ]; then
    warn "No API key set. Make sure OPENAI_API_KEY is in your environment."
    SKIP_AUTH=true
  fi
}

generate_fresh_config() {
  local template="$1"
  local target="$2"

  sed -e "s|__MODEL__|$MODEL|g" \
      -e "s|__PROVIDER_NAME__|$PROVIDER_NAME|g" \
      -e "s|__PROVIDER_URL__|$PROVIDER_URL|g" \
      "$template" > "$target"
  info "Generated config.toml (model=$MODEL, provider=$PROVIDER_NAME)"
}

merge_scholar_config() {
  local target="$1"
  local template="$2"

  TARGET_PATH="$target" TEMPLATE_PATH="$template" python3 <<'PY'
import os
import pathlib
import re


def read(path: str) -> str:
    return pathlib.Path(path).read_text()


def extract_section_block(text: str, header: str) -> str:
    pattern = rf"(^\[{re.escape(header)}\]\n(?:.*\n)*?)(?=^\[|\Z)"
    m = re.search(pattern, text, flags=re.M)
    return m.group(1).rstrip() if m else ""


def extract_agent_sections(text: str):
    pattern = r"(^\[agents\.[^\]]+\]\n(?:.*\n)*?)(?=^\[|\Z)"
    return re.findall(pattern, text, flags=re.M)


target_path = os.environ['TARGET_PATH']
template_path = os.environ['TEMPLATE_PATH']
target = read(target_path)
template = read(template_path)
added = []

for section in ['features', 'mcp_servers.zotero', 'mcp_servers.zotero.env']:
    if f'[{section}]' not in target:
        block = extract_section_block(template, section)
        if block:
            target += '\n\n' + block + '\n'
            added.append(section)

for block in extract_agent_sections(template):
    header = re.search(r'^\[(agents\.[^\]]+)\]$', block, flags=re.M).group(1)
    if f'[{header}]' not in target:
        target += '\n\n' + block.rstrip() + '\n'
        added.append(header)

pathlib.Path(target_path).write_text(target.rstrip() + '\n')
print(','.join(added))
PY
}

generate_config() {
  local template="$SRC_DIR/config.toml"
  local target="$CODEX_HOME/config.toml"

  [ -f "$template" ] || error "Template config.toml not found at $template"

  if [ -f "$target" ]; then
    backup_path "$target"
    cp "$target" "${target}.bak"
    info "Backed up config.toml → config.toml.bak"
  fi

  if [ "$SKIP_PROVIDER" = true ]; then
    local added
    added=$(merge_scholar_config "$target" "$template")
    if [ -n "$added" ]; then
      info "Merged Scholar sections into existing config.toml: $added"
    else
      info "Config already had the required Scholar sections"
    fi
  else
    generate_fresh_config "$template" "$target"
  fi
}

write_auth() {
  if [ "$SKIP_AUTH" = true ]; then
    return
  fi

  local target="$CODEX_HOME/auth.json"
  if [ -f "$target" ]; then
    backup_path "$target"
    cp "$target" "${target}.bak"
    info "Backed up auth.json → auth.json.bak"
  fi
  cat > "$target" <<EOF
{
  "OPENAI_API_KEY": "$API_KEY"
}
EOF
  chmod 600 "$target"
  info "Wrote auth.json (permissions: 600)"
}

copy_components() {
  if [ -d "$SRC_DIR/skills" ]; then
    copy_dir_safely "$SRC_DIR/skills" "$CODEX_HOME/skills"
  fi
  if [ -d "$SRC_DIR/agents" ]; then
    copy_dir_safely "$SRC_DIR/agents" "$CODEX_HOME/agents"
  fi
  if [ -f "$SRC_DIR/AGENTS.md" ]; then
    copy_file_safely "$SRC_DIR/AGENTS.md" "$CODEX_HOME/AGENTS.md"
  fi
  if [ -d "$SRC_DIR/scripts" ]; then
    copy_dir_safely "$SRC_DIR/scripts" "$CODEX_HOME/scripts"
  fi
  if [ -d "$SRC_DIR/utils" ]; then
    copy_dir_safely "$SRC_DIR/utils" "$CODEX_HOME/utils"
  fi

  info "Synced repo-managed Codex components"
}

configure_mcp() {
  if ! grep -q '\[mcp_servers\.zotero\]' "$CODEX_HOME/config.toml" 2>/dev/null; then
    return
  fi

  if awk '/\[mcp_servers\.zotero\]/{flag=1;next}/^\[/{flag=0}flag && /enabled = true/{found=1}END{exit(found?0:1)}' "$CODEX_HOME/config.toml"; then
    info "Zotero MCP already enabled"
    return
  fi

  echo ""
  read -rp "Enable Zotero MCP server? [y/N]: " enable_zotero
  if [ "$enable_zotero" = "y" ] || [ "$enable_zotero" = "Y" ]; then
    python3 - "$CODEX_HOME/config.toml" <<'PY'
import pathlib
import re
import sys
path = pathlib.Path(sys.argv[1])
text = path.read_text()
text = re.sub(r'(\[mcp_servers\.zotero\]\n(?:.*\n)*?enabled = )false', r'\1true', text, count=1)
path.write_text(text)
PY
    info "Zotero MCP enabled"
    if ! command -v zotero-mcp >/dev/null 2>&1; then
      warn "zotero-mcp not found. Install latest with: uv tool install --reinstall git+https://github.com/Galaxy-Dawn/zotero-mcp.git"
    fi
  fi
}

main() {
  echo ""
  echo "╔══════════════════════════════════════╗"
  echo "║   Claude Scholar Installer (Codex)   ║"
  echo "╚══════════════════════════════════════╝"
  echo ""

  check_deps

  info "Source: $SRC_DIR"
  info "Target: $CODEX_HOME"
  mkdir -p "$CODEX_HOME"

  detect_existing
  choose_provider
  configure_api_key
  generate_config
  write_auth
  copy_components
  configure_mcp

  echo ""
  echo "============================================================"
  info "Installation complete!"
  info "Updated files: $UPDATED_COUNT | Unchanged files skipped: $SKIPPED_COUNT | Backups created: $BACKUP_COUNT"
  if [ "$BACKUP_READY" -eq 1 ]; then
    info "Recover previous files from: $BACKUP_DIR"
  fi
  echo ""
  echo "  Config:  $CODEX_HOME/config.toml"
  echo "  Auth:    $CODEX_HOME/auth.json"
  echo "  Skills:  $CODEX_HOME/skills/"
  echo "  Agents:  $CODEX_HOME/agents/"
  echo ""
  info "Existing model/provider/API key settings are preserved when you choose the incremental update path."
  echo "  Run $(bold 'codex') to start."
  echo "============================================================"
}

main "$@"
