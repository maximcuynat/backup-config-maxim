# ------------------------------------------------------------
# Navigation aliases
# ------------------------------------------------------------

# Listing
alias ls='ls --color=auto'
alias ll='ls -lhF'
alias la='ls -lhAF'
alias lsd='ls -lhF | grep "^d"'                   # dossiers seulement
alias lsf='ls -lhF | grep -v "^d"'                # fichiers seulement
alias lss='ls -lhSF'                               # trié par taille
alias lsr='ls -lhtF'                               # trié par date (récent en premier)

# Navigation rapide
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'                                  # retour au dossier précédent
alias home='cd ~'
alias dl='cd ~/Downloads'
alias desk='cd ~/Desktop'
alias dev='cd ~/dev'

# Tree standard
alias t1='tree -L 1 --dirsfirst -C'
alias t2='tree -L 2 --dirsfirst -C'
alias t3='tree -L 3 --dirsfirst -C'

# Tree extended
alias ta='tree -a --dirsfirst -C'
alias tf='tree -f --dirsfirst -C'
alias td='tree -d --dirsfirst -C'

# Tree dev (exclude heavy dirs)
TREE_IGNORES="node_modules|.git|vendor|.next|dist|coverage|.cache"

alias td1="tree -L 1 -I '$TREE_IGNORES'"
alias td2="tree -L 2 -I '$TREE_IGNORES'"
alias td3="tree -L 3 -I '$TREE_IGNORES'"

# Recherche
alias rgf='rg --line-number --smart-case'
alias rgi='rg --line-number --ignore-case'         # insensible à la casse
alias rgp='rg --line-number --smart-case -l'       # affiche seulement les fichiers matchés
alias ff='find . -type f -name'                    # usage: ff "*.php"
alias fd='find . -type d -name'                    # usage: fd "cache"

# Filesystem utilitaires
alias mkdir='mkdir -pv'                            # crée les parents + verbose
alias df='df -h'                                   # taille disque lisible
alias du='du -h'
alias du1='du -h --max-depth=1 | sort -hr'         # taille dossiers du niveau courant
alias fsize='du -sh'                               # taille d'un fichier/dossier

# Clipboard (macOS)
alias copy='pbcopy'
alias paste='pbpaste'
alias cpwd='pwd | pbcopy && echo "📋 Chemin copié"'  # copie le pwd dans le clipboard

# Project shortcuts
alias bff="cd $HOME/dev/gtb-eos-back-stack/bff"
alias ded="cd $HOME/dev/docker-environment-development/"
alias gebs="cd $HOME/dev/gtb-eos-back-stack"
alias eosa="cd $HOME/dev/eos_ansible"
alias edge="cd $HOME/dev/edge-gateway"

# Workspace launcher
alias wsup="$HOME/.workspace-launcher/wsup"

# ------------------------------------------------------------
# Navigation helper
# ------------------------------------------------------------

navhelp() {
  echo ""
  echo "  🧭  Navigation Aliases Cheatsheet"
  echo "  ──────────────────────────────────────────────────────"
  echo ""
  echo "  LISTING"
  echo "    ll          → ls -lhF"
  echo "    la          → ls -lhAF               (fichiers cachés)"
  echo "    lsd         → dossiers seulement"
  echo "    lsf         → fichiers seulement"
  echo "    lss         → trié par taille"
  echo "    lsr         → trié par date"
  echo ""
  echo "  NAVIGATION"
  echo "    ..  / ... / ....  → remonte 1/2/3 niveaux"
  echo "    -           → dossier précédent"
  echo "    home        → ~"
  echo "    dev         → ~/dev"
  echo "    dl          → ~/Downloads"
  echo ""
  echo "  TREE (standard)"
  echo "    t1/t2/t3    → tree L1/L2/L3"
  echo "    ta          → tree -a   (fichiers cachés)"
  echo "    tf          → tree -f   (chemins complets)"
  echo "    td          → tree -d   (dossiers seulement)"
  echo ""
  echo "  TREE (dev, sans node_modules/.git/vendor)"
  echo "    td1/td2/td3 → tree L1/L2/L3"
  echo ""
  echo "  RECHERCHE"
  echo "    rgf  <q>    → rg smart-case"
  echo "    rgi  <q>    → rg ignore-case"
  echo "    rgp  <q>    → rg (fichiers matchés uniquement)"
  echo "    ff   <p>    → find fichiers  ex: ff '*.php'"
  echo "    fd   <p>    → find dossiers  ex: fd 'cache'"
  echo ""
  echo "  UTILITAIRES"
  echo "    du1         → taille dossiers niveau courant"
  echo "    fsize <p>   → taille d'un fichier/dossier"
  echo "    cpwd        → copie le pwd dans le clipboard"
  echo ""
  echo "  PROJETS"
  echo "    bff         → gtb-eos-back-stack/bff"
  echo "    ded         → docker-environment-development"
  echo "    wsup        → workspace launcher"
  echo ""
}
