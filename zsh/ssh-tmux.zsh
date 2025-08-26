if [[ -n "$SSH_CONNECTION" ]] && [[ -n "$SSH_TTY" ]]; then
    if which tmux >/dev/null 2>&1; then
        if [[ -z "$TMUX" ]]; then
            tmux new-session -A -s "ssh-session"
            exit
        fi
    fi
fi
