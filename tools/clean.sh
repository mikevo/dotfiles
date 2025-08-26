#!/bin/sh

if [ -h "$HOME/tmp" ]; then
    unlink "$HOME/tmp"
fi

if [ -h "$HOME/.zshrc.old" ]; then
    unlink "$HOME/.zshrc.old"
fi

if [ -d "$HOME/.bash_it" ]; then
    rm -rf "$HOME/.bash_it"
fi

if [ -d "$HOME/.zprezto" ]; then
    rm -rf "$HOME/.zprezto"
fi