#!/bin/sh -e

DOTFILES="$HOME/.dotfiles"
BASHRC=".dotfiles/bash/.bashrc"
BASHRC_D=".dotfiles/bash/.bashrc.d"
if [ ! -d "$DOTFILES" ]; then
    git clone https://github.com/mikevo/dotfiles.git $DOTFILES

    if [ -f "$HOME/.bashrc" ] || [ -h "$HOME/.bashrc" ]; then
        mv "$HOME/.bashrc" "$HOME/.bashrc.old"
    fi
    
    cd "$HOME"
    ln -s "$BASHRC"
fi

BASHRC_DEST=$(readlink -f "$HOME/.bashrc")
if [ "$BASHRC_DEST" != "$HOME/$BASHRC" ]; then
    if [ -f "$HOME/.bashrc" ] || [ -h "$HOME/.bashrc" ]; then
        mv "$HOME/.bashrc" "$HOME/.bashrc.old"
    fi

    cd "$HOME"
    ln -s "$BASHRC"
fi

BASHRC_D_DEST=$(readlink -f "$HOME/.bashrc.d")
if [ "$BASHRC_D_DEST" != "$HOME/$BASHRC_D" ]; then
    if [ -e "$HOME/.bashrc.d"]; then
        mv "$HOME/.bashrc.d" "$HOME/.bashrc.d.old"
    fi

    cd "$HOME"
    ln -s "$BASHRC_D"
fi