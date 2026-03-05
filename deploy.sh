#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_SUFFIX=".bak.$(date +%Y%m%d-%H%M%S)"

DRY_RUN=false
FORCE=false

# Format: "source_relative_au_repo:destination_absolue_ou_$HOME"
MAPPINGS=(
    "git/.gitconfig:$HOME/.gitconfig"
    "zsh/.zshrc:$HOME/.zshrc"
    "nvim/:$HOME/.config/nvim/"

    # macOS app prefs (exemples depuis ton arborescence)
    "macos/preferences/com.googlecode.iterm2.plist:$HOME/Library/Preferences/com.googlecode.iterm2.plist"
    "macos/preferences/com.knollsoft.Rectangle.plist:$HOME/Library/Preferences/com.knollsoft.Rectangle.plist"
    "macos/preferences/com.microsoft.VSCode.plist:$HOME/Library/Preferences/com.microsoft.VSCode.plist"

    # VS Code user config
    "vscode/settings.json:$HOME/Library/Application Support/Code/User/settings.json"
    "vscode/keybindings.json:$HOME/Library/Application Support/Code/User/keybindings.json"
)

expand_path() {
    local p="$1"
    p="${p/#\~/$HOME}"
    p="${p//\$HOME/$HOME}"
    echo "$p"
}

run_cmd() {
    if $DRY_RUN; then
        echo "[dry-run] $*"
    else
        "$@"
    fi
}

copy_item() {
    local src_rel="$1"
    local dest_raw="$2"

    local src="$ROOT_DIR/$src_rel"
    local dest
    dest="$(expand_path "$dest_raw")"

    if [[ ! -e "$src" ]]; then
        echo "⚠️  Source introuvable: $src"
        return 0
    fi

    run_cmd mkdir -p "$(dirname "$dest")"

    if [[ -e "$dest" ]]; then
        if ! $FORCE; then
            local backup="${dest}${BACKUP_SUFFIX}"
            echo "🗂  Backup: $dest -> $backup"
            run_cmd mv "$dest" "$backup"
        fi
    fi

    if [[ -d "$src" ]]; then
        run_cmd mkdir -p "$dest"
        run_cmd rsync -a --delete "$src" "$dest"
    else
        run_cmd cp -a "$src" "$dest"
    fi

    echo "✅ Copié: $src_rel -> $dest"
}

usage() {
    cat <<EOF
Usage: $(basename "$0") [--dry-run] [--force]
  --dry-run  Affiche les actions sans écrire
  --force    Écrase sans backup
EOF
}

main() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --dry-run) DRY_RUN=true; shift ;;
            --force) FORCE=true; shift ;;
            -h|--help) usage; exit 0 ;;
            *) echo "Option inconnue: $1"; usage; exit 1 ;;
        esac
    done

    echo "🚀 Déploiement des fichiers de config..."
    for map in "${MAPPINGS[@]}"; do
        IFS=":" read -r src dest <<< "$map"
        copy_item "$src" "$dest"
    done
    echo "🎉 Terminé."
}

main "$@"
