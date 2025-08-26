#!/bin/sh

DOTFILES="$HOME/.dotfiles"

if [ -d "$DOTFILES" ]; then
    cd "$DOTFILES"
    git pull

    stow --restow core
    stow --restow bash
    stow --delete desktop
    stow --delete development
fi
