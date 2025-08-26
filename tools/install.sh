#!/bin/sh -e

ZSH="$HOME/.oh-my-zsh"
if [ ! -d "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

DOTFILES="$HOME/.dotfiles"
ZSHRC=".dotfiles/zsh/.zshrc"
if [ ! -d "$DOTFILES" ]; then
    git clone https://github.com/mikevo/dotfiles.git $DOTFILES

    if [ -f "$HOME/.zshrc" ] || [ -h "$HOME/.zshrc" ]; then
        mv "$HOME/.zshrc" "$HOME/.zshrc.old"
    fi
    
    cd "$HOME"
    ln -s "$ZSHRC"
fi

ZSHRC_DEST=$(readlink -f "$HOME/.zshrc")
if [ "$ZSHRC_DEST" != "$HOME/$ZSHRC" ]; then
    if [ -f "$HOME/.zshrc" ] || [ -h "$HOME/.zshrc" ]; then
        mv "$HOME/.zshrc" "$HOME/.zshrc.old"
    fi

    cd "$HOME"
    ln -s "$ZSHRC"
fi
