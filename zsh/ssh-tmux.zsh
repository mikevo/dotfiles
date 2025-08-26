if [[ -n $SSH_CONNECTION ]]; then
    if which tmux >/dev/null 2>&1; then
        if [[ -z "$TMUX" ]]; then
            tmux new-session -A -s "ssh-session"
        fi
    fi
fi
