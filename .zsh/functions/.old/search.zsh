# ------------------------------------------------------------
# Interactive ripgrep + fzf
# ------------------------------------------------------------

rgfz() {
  rg --line-number --no-heading . \
  | fzf --delimiter : \
        --preview 'bat --style=numbers --color=always {1} --line-range {2}:'
}
