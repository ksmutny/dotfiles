#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGES=("oh-my-posh" tmux)

for pkg in "${PACKAGES[@]}"; do
    if [ -d "$DOTFILES_DIR/$pkg" ]; then
        stow -d "$DOTFILES_DIR" -t "$HOME" --restow "$pkg"
    fi
done

mkdir -p "$HOME/.claude"
for file in "$DOTFILES_DIR/claude/.claude"/*; do
    [ -e "$file" ] || continue
    ln -sf "$file" "$HOME/.claude/$(basename "$file")"
done

GIT_INCLUDE_LINE="$DOTFILES_DIR/git/.gitconfig"
if ! grep -qF "$GIT_INCLUDE_LINE" ~/.gitconfig 2>/dev/null; then
    git config --global include.path "$GIT_INCLUDE_LINE"
fi

ZSH_SOURCE_LINE="source $DOTFILES_DIR/zsh/.zshrc"
if ! grep -qF "$ZSH_SOURCE_LINE" $HOME/.zshrc 2>/dev/null; then
    echo "$ZSH_SOURCE_LINE" >> $HOME/.zshrc
fi
