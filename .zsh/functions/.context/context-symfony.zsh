# ------------------------------------------------------------
# context-symfony.zsh — Détection et actions Symfony
# ------------------------------------------------------------

_ctx_symfony_detect() {
  [[ -f symfony.lock || -f bin/console ]]
}

_ctx_symfony_env() {
  if [[ -f .env ]]; then
    sed -n 's/^APP_ENV=["'\'']\?\([^"'\'']*\)["'\'']\?$/\1/p' .env 2>/dev/null
  fi
}

_ctx_symfony_actions() {
  local env=$(_ctx_symfony_env)
  local actions=()

  actions+=("🎵  cache:clear|php bin/console cache:clear")
  actions+=("🎵  cache:clear + warmup|php bin/console cache:clear && php bin/console cache:warmup")
  actions+=("🗄   migrations:migrate|php bin/console doctrine:migrations:migrate --no-interaction")
  actions+=("🔍  migrations:status|php bin/console doctrine:migrations:status")
  actions+=("🐛  debug:router|php bin/console debug:router")

  printf '%s\n' "${actions[@]}"
}

_ctx_symfony_badge() {
  local env=$(_ctx_symfony_env)
  if [[ -n "$env" ]]; then
    echo "symfony [$env]"
  else
    echo "symfony"
  fi
}
