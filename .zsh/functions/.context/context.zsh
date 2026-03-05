# ============================================================
# context.zsh — Moteur principal de détection contextuelle
# ============================================================
#
# Charge les modules dans ton .zshrc dans cet ordre :
#   source ~/context-docker.zsh
#   source ~/context-symfony.zsh
#   source ~/context-git.zsh
#   source ~/context-node.zsh
#   source ~/context.zsh
#
# ============================================================

autoload -U add-zsh-hook

# ── Couleurs ─────────────────────────────────────────────────
_C_RESET=$'\033[0m'
_C_BOLD=$'\033[1m'
_C_DIM=$'\033[2m'
_C_BORDER=$'\033[38;5;240m'
_C_TITLE=$'\033[38;5;255m'
_C_BADGE=$'\033[38;5;111m'
_C_NUM=$'\033[38;5;213m'
_C_HINT=$'\033[38;5;238m'

# ── Menu numéroté ─────────────────────────────────────────────
_ctx_menu() {
  local -a actions=("$@")
  local total=${#actions[@]}

  local folder=$(basename "$PWD")
  local badges=""
  _ctx_docker_detect  2>/dev/null && badges+="${_C_BADGE}$(_ctx_docker_badge)${_C_RESET}  "
  _ctx_symfony_detect 2>/dev/null && badges+="${_C_BADGE}$(_ctx_symfony_badge)${_C_RESET}  "
  _ctx_git_detect     2>/dev/null && badges+="${_C_BADGE}$(_ctx_git_badge)${_C_RESET}  "
  _ctx_node_detect    2>/dev/null && badges+="${_C_BADGE}$(_ctx_node_badge)${_C_RESET}  "

  echo -e "${_C_BORDER}╭─${_C_RESET} ${_C_BOLD}${_C_TITLE}${folder}${_C_RESET}  ${badges}"

  local i=1
  for action in "${actions[@]}"; do
    local label="${action%%|*}"
    echo -e "${_C_BORDER}│${_C_RESET}  ${_C_NUM}${_C_BOLD}${i})${_C_RESET}  ${label}"
    (( i++ ))
  done

  echo -e "${_C_BORDER}╰─${_C_RESET} ${_C_HINT}Numéro + Enter, ou Enter pour ignorer :${_C_RESET} \c"

  local choice
  read choice < /dev/tty

  if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= total )); then
    local cmd="${actions[$((choice - 1))]#*|}"
    echo -e "${_C_BORDER}❯${_C_RESET} ${_C_BOLD}${cmd}${_C_RESET}"
    echo ""
    eval "$cmd"
  fi
}

# ── Collecte toutes les actions ───────────────────────────────
_ctx_collect_actions() {
  local -a all=()
  _ctx_docker_detect  2>/dev/null && while IFS= read -r l; do [[ -n "$l" ]] && all+=("$l"); done < <(_ctx_docker_actions  2>/dev/null)
  _ctx_symfony_detect 2>/dev/null && while IFS= read -r l; do [[ -n "$l" ]] && all+=("$l"); done < <(_ctx_symfony_actions 2>/dev/null)
  _ctx_git_detect     2>/dev/null && while IFS= read -r l; do [[ -n "$l" ]] && all+=("$l"); done < <(_ctx_git_actions     2>/dev/null)
  _ctx_node_detect    2>/dev/null && while IFS= read -r l; do [[ -n "$l" ]] && all+=("$l"); done < <(_ctx_node_actions    2>/dev/null)
  printf '%s\n' "${all[@]}"
}

# ── Hook cd ───────────────────────────────────────────────────
_ctx_on_cd() {
  local -a actions=()
  while IFS= read -r line; do
    [[ -n "$line" ]] && actions+=("$line")
  done < <(_ctx_collect_actions)

  [[ ${#actions[@]} -eq 0 ]] && return 0

  echo ""
  _ctx_menu "${actions[@]}"
  echo ""
}

add-zsh-hook chpwd _ctx_on_cd

# ── `ctx` — relance manuellement ─────────────────────────────
ctx() { _ctx_on_cd }
