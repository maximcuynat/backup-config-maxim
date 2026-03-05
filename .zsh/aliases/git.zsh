# ------------------------------------------------------------
# Git aliases
# ------------------------------------------------------------

alias g='git'
alias gs='git status'
alias gss='git status -s'                          # format court
alias ga='git add'
alias gaa='git add -A'
alias gap='git add -p'                             # add interactif (hunk par hunk)
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit'         # amend sans changer le message
alias gwip='git commit -m "wip"'                   # commit rapide WIP
alias gp='git push'
alias gpu='git push -u origin HEAD'                # push + set upstream auto
alias gpf='git push --force-with-lease'
alias gl='git pull'
alias glr='git pull --rebase'                      # pull avec rebase
alias gf='git fetch --all --prune'                 # fetch + nettoie branches mortes
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --stat'                        # diff résumé
alias gb='git branch'
alias gba='git branch -a'                          # toutes les branches (locales + remote)
alias gbD='git branch -D'                          # supprime branche locale (force)
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcom='git checkout main 2>/dev/null || git checkout master'  # checkout main/master auto
alias glog='git log --oneline --graph --decorate --all'
alias glast='git log -1 --stat'                    # dernier commit détaillé
alias gwho='git shortlog -sn --no-merges'          # contributions par auteur
alias gstash='git stash'
alias gstashp='git stash pop'
alias gstashl='git stash list'
alias grb='git rebase'
alias grbi='git rebase -i'                         # rebase interactif
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grs='git restore'
alias grss='git restore --staged'                  # unstage un fichier
alias gclean='git clean -fd'                       # supprime fichiers non trackés
alias gtag='git tag'
alias gtagl='git tag -l'

# ------------------------------------------------------------
# Git helper
# ------------------------------------------------------------

ghelp() {
  echo ""
  echo "  🌿  Git Aliases Cheatsheet"
  echo "  ──────────────────────────────────────────────────────"
  echo ""
  echo "  STATUS / DIFF"
  echo "    gs          → git status"
  echo "    gss         → status -s              (format court)"
  echo "    gd          → git diff"
  echo "    gdc         → diff --cached"
  echo "    gds         → diff --stat"
  echo ""
  echo "  ADD / COMMIT"
  echo "    ga          → git add"
  echo "    gaa         → add -A"
  echo "    gap         → add -p                 (interactif hunk)"
  echo "    gc          → git commit"
  echo "    gcm  <msg>  → commit -m"
  echo "    gca         → commit --amend"
  echo "    gcane       → amend --no-edit"
  echo "    gwip        → commit -m 'wip'"
  echo ""
  echo "  PUSH / PULL"
  echo "    gp          → git push"
  echo "    gpu         → push -u origin HEAD    (set upstream)"
  echo "    gpf         → push --force-with-lease"
  echo "    gl          → git pull"
  echo "    glr         → pull --rebase"
  echo "    gf          → fetch --all --prune"
  echo ""
  echo "  BRANCHES"
  echo "    gb          → git branch"
  echo "    gba         → branch -a              (toutes)"
  echo "    gbD  <b>    → branch -D              (force delete)"
  echo "    gco  <b>    → git checkout"
  echo "    gcb  <b>    → checkout -b            (nouvelle branche)"
  echo "    gcom        → checkout main/master   (auto)"
  echo ""
  echo "  LOG"
  echo "    glog        → log graph complet"
  echo "    glast       → dernier commit détaillé"
  echo "    gwho        → contributions par auteur"
  echo ""
  echo "  STASH"
  echo "    gstash      → git stash"
  echo "    gstashp     → stash pop"
  echo "    gstashl     → stash list"
  echo ""
  echo "  REBASE"
  echo "    grb         → git rebase"
  echo "    grbi        → rebase -i              (interactif)"
  echo "    grba        → rebase --abort"
  echo "    grbc        → rebase --continue"
  echo ""
  echo "  RESTORE / CLEAN"
  echo "    grs  <f>    → git restore"
  echo "    grss <f>    → restore --staged       (unstage)"
  echo "    gclean      → clean -fd              (supprime non trackés)"
  echo ""
}
