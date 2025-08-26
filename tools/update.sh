#!/bin/sh

DOTFILES="$HOME/.dotfiles"

for dir in .config/nvim .gnupg .local/bin .vim; do
    if [ -h "$HOME/$dir" ]; then
        unlink "$HOME/$dir"
    fi
    mkdir -p "$HOME/$dir"
done

if [ -d "$DOTFILES" ]; then
    cd "$DOTFILES"
    git pull

    stow --restow core
    stow --restow bash
    stow --delete desktop
    stow --delete development
fi
