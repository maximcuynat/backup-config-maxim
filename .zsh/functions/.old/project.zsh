# ------------------------------------------------------------
# Project context detector
# ------------------------------------------------------------

proj() {
  if [[ -f docker-compose.yml || -f compose.yml ]]; then
    echo docker
  elif [[ -f symfony.lock ]]; then
    echo symfony
  else
    echo generic
  fi
}
