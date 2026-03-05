# ============================================================
# ZSH + Oh My Zsh + Starship (Backend Pro Setup)
# ============================================================

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)

[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# Plugins supplémentaires
[[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------
# Symfony .env auto-loader → export APP_ENV
# ------------------------------------------------------------
autoload -U add-zsh-hook

load_symfony_env() {
  if [[ -f ".env" ]]; then
    local env
    env=$(grep -E '^APP_ENV=' .env | cut -d= -f2 | tr -d '"' | tr -d "'")
    if [[ -n "$env" ]]; then
      export APP_ENV="$env"
      return
    fi
  fi
  unset APP_ENV
}

add-zsh-hook chpwd load_symfony_env
load_symfony_env

# ------------------------------------------------------------
# Docker project context auto-detection
# ------------------------------------------------------------
load_project_docker_context() {
  if [[ -f "docker-compose.yml" || -f "docker-compose.yaml" || -f "compose.yml" || -f "compose.yaml" ]]; then
    export STARSHIP_DOCKER_CONTEXT="$(basename "$PWD")"
  else
    unset STARSHIP_DOCKER_CONTEXT
  fi
}

add-zsh-hook chpwd load_project_docker_context
load_project_docker_context

# ------------------------------------------------------------
# Starship prompt
# ------------------------------------------------------------
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

# ------------------------------------------------------------
# Couleurs
# ------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
if command -v gdircolors >/dev/null 2>&1; then
  eval "$(gdircolors -b)"
fi

# ------------------------------------------------------------
# Custom aliases
# ------------------------------------------------------------
alias reload='source ~/.zshrc'

# Autoload
# for file in ~/.zsh/aliases/*.zsh ~/.zsh/functions/*.zsh ~/.zsh/hooks/*.zsh; do
for file in ~/.zsh/aliases/*.zsh; do
  [[ -f "$file" ]] && source "$file"
done


# ------------------------------------------------------------
# Path
# ------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"


# ------------------------------------------------------------
# GRC — colorisation automatique des commandes
# ------------------------------------------------------------
[[ -f /opt/homebrew/etc/grc.zsh ]] && source /opt/homebrew/etc/grc.zsh

# Bannière hacker au démarrage
clear
figlet "$(whoami)" | lolcat
neofetch

