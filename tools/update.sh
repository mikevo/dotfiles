#!/bin/bash

DOTFILES="$HOME/.dotfiles"

cd "$DOTFILES" || exit 1
git pull