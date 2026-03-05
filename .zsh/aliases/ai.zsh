# ------------------------------------------------------------
# AI / Ollama aliases
# ------------------------------------------------------------

AI_DIR="$HOME/ai-cli"

alias ai="$AI_DIR/ai.sh"
alias aie='${EDITOR:-nano} $AI_DIR/ai.sh'          # édite le script principal

# Ollama — modèles
alias ai-models='ollama list'
alias ai-pull='ollama pull'
alias ai-rm='ollama rm'                            # supprime un modèle local
alias ai-show='ollama show'                        # infos sur un modèle
alias ai-copy='ollama cp'                          # copie un modèle

# Ollama — runtime
alias ai-ps='ollama ps'                            # modèles en cours d'exécution
alias ai-run='ollama run'                          # usage: ai-run llama3
alias ai-serve='ollama serve'                      # démarre le serveur Ollama
alias ai-stop='pkill -f "ollama serve"'            # arrête le serveur

# Navigation projet
alias ai-cd='cd $AI_DIR'
alias ai-logs='cd $AI_DIR/logs'
alias ai-agents='cd $AI_DIR/agents'
alias ai-prompts='cd $AI_DIR/prompts'

# Logs
alias ai-log-last='ls -t $AI_DIR/logs | head -1 | xargs -I{} cat $AI_DIR/logs/{}'  # dernier log
alias ai-log-list='ls -lht $AI_DIR/logs'           # liste des logs triée par date

# Utilitaires
alias ai-update='ollama pull $(ollama list | tail -n +2 | awk "{print \$1}")'  # màj tous les modèles

# ------------------------------------------------------------
# AI helper
# ------------------------------------------------------------

aihelp() {
  echo ""
  echo "  🤖  AI Aliases Cheatsheet"
  echo "  ──────────────────────────────────────────────────────"
  echo ""
  echo "  CLI"
  echo "    ai          → lance ai.sh"
  echo "    aie         → édite ai.sh"
  echo ""
  echo "  MODÈLES"
  echo "    ai-models       → ollama list"
  echo "    ai-pull  <m>    → ollama pull"
  echo "    ai-rm    <m>    → ollama rm"
  echo "    ai-show  <m>    → infos modèle"
  echo "    ai-copy  <s> <d>→ copie un modèle"
  echo "    ai-update       → màj tous les modèles"
  echo ""
  echo "  RUNTIME"
  echo "    ai-ps           → modèles en cours"
  echo "    ai-run   <m>    → ollama run"
  echo "    ai-serve        → démarre le serveur"
  echo "    ai-stop         → arrête le serveur"
  echo ""
  echo "  NAVIGATION"
  echo "    ai-cd           → $AI_DIR"
  echo "    ai-logs         → dossier logs"
  echo "    ai-agents       → dossier agents"
  echo "    ai-prompts      → dossier prompts"
  echo ""
  echo "  LOGS"
  echo "    ai-log-last     → affiche le dernier log"
  echo "    ai-log-list     → liste des logs"
  echo ""
}
