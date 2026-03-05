# ------------------------------------------------------------
# context-git.zsh — Détection et actions Git
# ------------------------------------------------------------

_ctx_git_detect() {
  git rev-parse --git-dir &>/dev/null
}

_ctx_git_info() {
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  local behind=$(git rev-list HEAD..@{u} --count 2>/dev/null || echo "0")
  local ahead=$(git rev-list @{u}..HEAD --count 2>/dev/null || echo "0")
  local dirty=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  echo "$branch|$behind|$ahead|$dirty"
}

_ctx_git_actions() {
  local info=$(_ctx_git_info)
  local branch=${info%%|*}
  local rest=${info#*|}
  local behind=${rest%%|*}
  local rest2=${rest#*|}
  local ahead=${rest2%%|*}
  local dirty=${rest2#*|}

  local actions=()

  if [[ "$behind" -gt 0 ]]; then
    actions+=("🌿  git pull ($behind commits derrière)|git pull")
    actions+=("🌿  git pull --rebase|git pull --rebase")
  fi

  if [[ "$ahead" -gt 0 ]]; then
    actions+=("🚀  git push ($ahead commits à pousser)|git push")
  fi

  if [[ "$dirty" -gt 0 ]]; then
    actions+=("📝  git status|git status")
    actions+=("📦  git add -A && git commit|git add -A")
  fi

  if [[ ${#actions[@]} -eq 0 ]]; then
    actions+=("🌿  git log --oneline -5|git log --oneline -5")
    actions+=("🌿  git fetch --all --prune|git fetch --all --prune")
  fi

  printf '%s\n' "${actions[@]}"
}

_ctx_git_badge() {
  local info=$(_ctx_git_info)
  local branch=${info%%|*}
  local rest=${info#*|}
  local behind=${rest%%|*}
  local rest2=${rest#*|}
  local ahead=${rest2%%|*}
  local dirty=${rest2#*|}

  local badge="git:$branch"
  [[ "$behind" -gt 0 ]] && badge="$badge ⬇$behind"
  [[ "$ahead" -gt 0 ]]  && badge="$badge ⬆$ahead"
  [[ "$dirty" -gt 0 ]]  && badge="$badge ✏️"
  echo "$badge"
}
