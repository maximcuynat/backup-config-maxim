# ------------------------------------------------------------
# System / QoL aliases
# ------------------------------------------------------------

# Shell
alias reload='source ~/.zshrc'
alias zshrc='${EDITOR:-nano} ~/.zshrc'             # édite le .zshrc directement
alias zshreload='exec zsh'                         # recharge le shell entier

# Sécurité sur ops destructives
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Terminal
alias cls='clear'
alias c='clear'
alias q='exit'

# Infos système
alias path='echo -e ${PATH//:/\\n}'
alias ports='lsof -i -P -n | grep LISTEN'         # ports en écoute
alias myip='curl -s https://api.ipify.org && echo' # IP publique
alias localip='ipconfig getifaddr en0'             # IP locale (macOS)
alias cpu='top -l 1 | grep "CPU usage"'
alias mem='top -l 1 | grep "PhysMem"'
alias diskspace='df -h | grep -v tmpfs'

# Processus
alias psg='ps aux | grep -v grep | grep'           # usage: psg nginx
alias killn='kill -9'                              # usage: killn <pid>
alias killp='pkill -f'                             # usage: killp nginx

# Réseau
alias ping='ping -c 5'                             # ping limité à 5
alias pingg='ping google.com'
alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder && echo "✅ DNS flushed"'
alias headers='curl -sI'                           # usage: headers https://example.com
alias wget='wget -c'                               # resume automatique

# Fichiers
alias cat='cat -A'                                 # affiche les caractères spéciaux
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias untar='tar -xvf'                             # usage: untar archive.tar.gz
alias targz='tar -czf'                             # usage: targz archive.tar.gz dossier/

# Editeur (adapte selon ta config)
alias e='${EDITOR:-nano}'
alias v='vim'

# macOS spécifiques
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
alias cleanup='find . -name "*.DS_Store" -type f -delete && echo "✅ .DS_Store supprimés"'
alias update='softwareupdate -ia && brew update && brew upgrade && brew cleanup'

# Utilitaires divers
alias week='date +%V'                              # numéro de semaine
alias timestamp='date +%s'                         # unix timestamp
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias timer='echo "Timer start: $(date +%T)" && read -r -p "Press Enter to stop..." && echo "Timer stop: $(date +%T)"'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3'

# ------------------------------------------------------------
# System helper
# ------------------------------------------------------------

syshelp() {
  echo ""
  echo "  ⚙️   System Aliases Cheatsheet"
  echo "  ──────────────────────────────────────────────────────"
  echo ""
  echo "  SHELL"
  echo "    reload      → source ~/.zshrc"
  echo "    zshrc       → édite le .zshrc"
  echo "    zshreload   → exec zsh (recharge complet)"
  echo "    q           → exit"
  echo ""
  echo "  INFOS SYSTÈME"
  echo "    ports       → ports en écoute"
  echo "    myip        → IP publique"
  echo "    localip     → IP locale (en0)"
  echo "    cpu         → usage CPU"
  echo "    mem         → usage RAM"
  echo "    diskspace   → espace disque"
  echo ""
  echo "  PROCESSUS"
  echo "    psg  <n>    → cherche un processus"
  echo "    killn <p>   → kill -9 <pid>"
  echo "    killp <n>   → pkill -f <nom>"
  echo ""
  echo "  RÉSEAU"
  echo "    ping        → ping -c 5"
  echo "    pingg       → ping google.com"
  echo "    flushdns    → vide le cache DNS (macOS)"
  echo "    headers <u> → curl -sI <url>"
  echo ""
  echo "  FICHIERS / ARCHIVES"
  echo "    untar <f>   → tar -xvf"
  echo "    targz <f>   → tar -czf"
  echo "    cleanup     → supprime les .DS_Store"
  echo ""
  echo "  macOS"
  echo "    showfiles   → affiche les fichiers cachés (Finder)"
  echo "    hidefiles   → cache les fichiers cachés (Finder)"
  echo "    update      → softwareupdate + brew update/upgrade"
  echo ""
  echo "  UTILITAIRES"
  echo "    now         → date formatée"
  echo "    timestamp   → unix timestamp"
  echo "    week        → numéro de semaine"
  echo ""
}
