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

if [ -d "$HOME/.linuxbrew" ]; then
    rm -rf "$HOME/.linuxbrew"
fi

if [ -d "$HOME/.zprezto" ]; then
    rm -rf "$HOME/.zprezto"
fi

if [ -n "$SSH_CONNECTION" ]; then
    for dir in "Desktop" "Documents" "Downloads" "Music" "Pictures" "Projects" "Public" "Templates" "Videos"; do
        if [ -d "$HOME/$dir" ] && [ -z "$(ls -A "$HOME/$dir")" ]; then
            rm -rf "$HOME/$dir"
        fi
    done

    find "$HOME/.config" -type d -empty -delete

    if [ -d "$HOME/.nvm" ]; then
        rm -rf "$HOME/.nvm"
    fi

    if [ -d "$HOME/.pyenv" ]; then
        rm -rf "$HOME/.pyenv"
    fi
fi

rm -f $HOME/.zcompdump*
