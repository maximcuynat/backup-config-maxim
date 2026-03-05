# ------------------------------------------------------------
# context-node.zsh — Détection et actions Node/npm
# ------------------------------------------------------------

_ctx_node_detect() {
  [[ -f package.json ]]
}

_ctx_node_manager() {
  if [[ -f bun.lockb ]]; then echo "bun"
  elif [[ -f pnpm-lock.yaml ]]; then echo "pnpm"
  elif [[ -f yarn.lock ]]; then echo "yarn"
  else echo "npm"
  fi
}

_ctx_node_actions() {
  local mgr=$(_ctx_node_manager)
  local actions=()

  if [[ ! -d node_modules ]]; then
    actions+=("📦  $mgr install (node_modules absent !)|$mgr install")
  fi

  # Scripts depuis package.json
  if command -v jq &>/dev/null; then
    local scripts=$(jq -r '.scripts | keys[]' package.json 2>/dev/null | head -6)
    while IFS= read -r script; do
      [[ -z "$script" ]] && continue
      actions+=("▶️   $mgr run $script|$mgr run $script")
    done <<< "$scripts"
  else
    actions+=("▶️   $mgr run dev|$mgr run dev")
    actions+=("▶️   $mgr run build|$mgr run build")
    actions+=("▶️   $mgr run test|$mgr run test")
  fi

  printf '%s\n' "${actions[@]}"
}

_ctx_node_badge() {
  local mgr=$(_ctx_node_manager)
  local name=$(jq -r '.name // ""' package.json 2>/dev/null)
  local version=$(jq -r '.version // ""' package.json 2>/dev/null)

  if [[ -n "$name" ]]; then
    echo "$mgr · $name@$version"
  else
    echo "$mgr"
  fi
}
