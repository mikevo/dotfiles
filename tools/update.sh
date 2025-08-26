#!/bin/sh

DOTFILES="$HOME/.dotfiles"

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.gnupg"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.vim"

if [ -d "$DOTFILES" ]; then
    cd "$DOTFILES"
    git pull

    stow --restow core
    stow --restow bash
    stow --delete desktop
    stow --delete development
fi
