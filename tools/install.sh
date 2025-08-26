#!/bin/sh

ZSH="$HOME/.oh-my-zsh"
if [ ! -d "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

DOTFILES="$HOME/.dotfiles"
if [ ! -d "$DOTFILES" ]; then
    git clone https://github.com/mikevo/dotfiles.git $DOTFILES
fi
