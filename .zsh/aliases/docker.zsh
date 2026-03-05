# ------------------------------------------------------------
# Docker aliases
# ------------------------------------------------------------

alias d='docker'
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcud='docker compose up -d --build'        # up + rebuild
alias dcd='docker compose down'
alias dcdv='docker compose down -v'              # down + supprime volumes
alias dcr='docker compose restart'
alias dcl='docker compose logs -f'
alias dce='docker compose exec'
alias dcb='docker compose build'
alias dcpull='docker compose pull'
alias dcps='docker compose ps'
alias dps='docker ps'
alias dpsa='docker ps -a'                        # tous les containers (stoppés inclus)
alias dim='docker images'
alias dima='docker images -a'
alias drm='docker rm'
alias drmi='docker rmi'
alias drmf='docker rm -f'                        # force remove container
alias dstop='docker stop $(docker ps -q)'        # stoppe tous les containers
alias dkill='docker kill $(docker ps -q)'        # kill tous les containers
alias dockerNuke='docker system prune -af'
alias dockerNukeAll='docker system prune -af --volumes'  # inclut les volumes

# Raccourcis utiles
alias dlogs='docker logs -f --tail=100'          # usage: dlogs <container>
alias dsh='docker exec -it'                      # usage: dsh <container> sh
alias dbash='docker exec -it'                    # usage: dbash <container> bash
alias dip='docker inspect -f "{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'  # usage: dip <container>
alias denv='docker inspect -f "{{range .Config.Env}}{{println .}}{{end}}"'               # usage: denv <container>

# Stats
alias dstats='docker stats --no-trunc'
alias dtop='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}"'

# ------------------------------------------------------------
# Docker helper
# ------------------------------------------------------------

dhelp() {
  echo ""
  echo "  🐳  Docker Aliases Cheatsheet"
  echo "  ──────────────────────────────────────────────────────"
  echo ""
  echo "  COMPOSE"
  echo "    dc          → docker compose"
  echo "    dcu         → compose up -d"
  echo "    dcud        → compose up -d --build"
  echo "    dcd         → compose down"
  echo "    dcdv        → compose down -v         (+ supprime volumes)"
  echo "    dcr         → compose restart"
  echo "    dcl         → compose logs -f"
  echo "    dcb         → compose build"
  echo "    dcpull      → compose pull"
  echo "    dcps        → compose ps"
  echo "    dce         → compose exec"
  echo ""
  echo "  CONTAINERS"
  echo "    dps         → docker ps"
  echo "    dpsa        → docker ps -a            (tous, stoppés inclus)"
  echo "    dstop       → stoppe tous les containers"
  echo "    dkill       → kill tous les containers"
  echo "    drm         → docker rm"
  echo "    drmf        → docker rm -f            (force)"
  echo ""
  echo "  IMAGES"
  echo "    dim         → docker images"
  echo "    dima        → docker images -a"
  echo "    drmi        → docker rmi"
  echo ""
  echo "  EXEC / LOGS"
  echo "    dlogs <c>   → logs -f --tail=100"
  echo "    dsh   <c>   → exec -it <container> sh"
  echo "    dbash <c>   → exec -it <container> bash"
  echo ""
  echo "  INSPECT"
  echo "    dip   <c>   → IP du container"
  echo "    denv  <c>   → variables d'environnement"
  echo ""
  echo "  STATS"
  echo "    dstats      → stats temps réel (détaillé)"
  echo "    dtop        → stats compactes (nom / CPU / RAM / réseau)"
  echo ""
  echo "  NETTOYAGE"
  echo "    dockerNuke        → system prune -af"
  echo "    dockerNukeAll     → system prune -af --volumes"
  echo ""
}
