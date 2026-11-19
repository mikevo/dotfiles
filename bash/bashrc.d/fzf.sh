if command -v tmux >/dev/null 2>&1; then
    if fzf --bash >/dev/null 2>&1; then
        # fzf >= 0.48
        eval "$(fzf --bash)"
    elif fzf --init bash >/dev/null 2>&1; then
        # fzf 0.44 bis 0.47
        eval "$(fzf --init bash)"
    elif [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
        # ältere fzf-Versionen
        . /usr/share/doc/fzf/examples/key-bindings.bash
    fi
fi
