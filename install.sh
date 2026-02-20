#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGES=(claude "oh-my-posh" tmux)

for pkg in "${PACKAGES[@]}"; do
    if [ -d "$DOTFILES_DIR/$pkg" ]; then
        stow -d "$DOTFILES_DIR" -t "$HOME" --restow "$pkg"
    fi
done

ZSH_SOURCE_LINE="source $DOTFILES_DIR/zsh/.zshrc"
if ! grep -qF "$ZSH_SOURCE_LINE" $HOME/.zshrc 2>/dev/null; then
    echo "$ZSH_SOURCE_LINE" >> $HOME/.zshrc
fi
