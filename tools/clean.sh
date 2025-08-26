#!/bin/sh

if [ -h "$HOME/tmp" ]; then
    unlink "$HOME/tmp"
fi

if [ -h "$HOME/.zshrc.old" ]; then
    unlink "$HOME/.zshrc.old"
fi