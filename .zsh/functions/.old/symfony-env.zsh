# ------------------------------------------------------------
# Symfony .env auto loader
# ------------------------------------------------------------

autoload -U add-zsh-hook

load_symfony_env() {
  if [[ -f ".env" ]]; then
    local env
    env=$(sed -n 's/^APP_ENV=["'\'']\?\(.*\)["'\'']\?$/\1/p' .env)

    if [[ -n "$env" && "$APP_ENV" != "$env" ]]; then
      export APP_ENV="$env"
      return
    fi
  fi

  unset APP_ENV
}

add-zsh-hook chpwd load_symfony_env
load_symfony_env
