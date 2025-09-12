#!/bin/sh

DOTFILES="$HOME/.dotfiles"

STOW_DIRS=".config/nvim .gnupg .local/bin .vim"
for dir in $STOW_DIRS; do
    if [ -h "$HOME/$dir" ]; then
        unlink "$HOME/$dir"
    fi
    mkdir -p "$HOME/$dir"
    touch "$HOME/$dir/.stow-keep"
done

if [ -d "$DOTFILES" ]; then
    cd "$DOTFILES"
    git pull

    stow --restow core
    stow --restow bash
fi

STOW_DIRS=".config/nvim .gnupg .local/bin .vim"
for dir in $STOW_DIRS; do
    rm -f "$HOME/$dir/.stow-keep"
done