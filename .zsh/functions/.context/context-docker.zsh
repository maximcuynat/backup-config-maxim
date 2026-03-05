# ------------------------------------------------------------
# context-docker.zsh — Détection et actions Docker
# ------------------------------------------------------------

_ctx_docker_detect() {
  [[ -f docker-compose.yml || -f docker-compose.yaml || -f compose.yml || -f compose.yaml ]]
}

_ctx_docker_status() {
  local running=$(docker compose ps --status running -q 2>/dev/null | wc -l | tr -d ' ')
  local total=$(docker compose ps -q 2>/dev/null | wc -l | tr -d ' ')
  echo "$running/$total"
}

_ctx_docker_actions() {
  local status=$(_ctx_docker_status)
  local running=${status%/*}
  local total=${status#*/}

  local actions=()

  if [[ "$running" -eq 0 && "$total" -eq 0 ]]; then
    actions+=("🐳  docker compose up -d|docker compose up -d")
    actions+=("🔨  docker compose up -d --build|docker compose up -d --build")
  elif [[ "$running" -lt "$total" ]]; then
    actions+=("🐳  docker compose up -d|docker compose up -d")
    actions+=("🔁  docker compose restart|docker compose restart")
    actions+=("📋  docker compose logs -f|docker compose logs -f")
  else
    actions+=("📋  docker compose logs -f|docker compose logs -f")
    actions+=("🔁  docker compose restart|docker compose restart")
    actions+=("⏹   docker compose down|docker compose down")
  fi

  printf '%s\n' "${actions[@]}"
}

_ctx_docker_badge() {
  local status=$(_ctx_docker_status)
  local running=${status%/*}
  local total=${status#*/}

  if [[ "$total" -eq 0 ]]; then
    echo "docker"
  elif [[ "$running" -eq "$total" && "$total" -gt 0 ]]; then
    echo "docker ✅ $running running"
  elif [[ "$running" -eq 0 ]]; then
    echo "docker ⏹ stopped"
  else
    echo "docker ⚠️  $running/$total"
  fi
}
