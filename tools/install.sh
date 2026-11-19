#!/bin/bash -e

DOTFILES="$HOME/.dotfiles"

if [ ! -d "$DOTFILES" ]; then
    git clone --depth=1 https://github.com/mikevo/dotfiles.git "$DOTFILES"
fi

link_file() {
    local source="$1"
    local target="$2"

    if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "$source" ]]; then
        # echo "Exists: $target -> $source"
        return 0
    fi

    mkdir -p "$(dirname "$target")"

    if [[ -L "$target" ]]; then
        unlink "$target"
        echo "Unlink: $target -> $source"
    elif [[ -e "$target" ]]; then
        mv "$target" "$target.bak"
        echo "Backup: $target -> $source"
    fi

    ln -s "$source" "$target"
    echo "Linked: $target -> $source"  
}

link_file "$DOTFILES/bash/bashrc" "$HOME/.bashrc"
link_file "$DOTFILES/bash/bashrc.d" "$HOME/.bashrc.d"
link_file "$DOTFILES/bash/bash_profile" "$HOME/.bash_profile"

link_file "$DOTFILES/core/gitignore_global" "$HOME/.gitignore_global"
link_file "$DOTFILES/core/tmux.conf" "$HOME/.tmux.conf"
