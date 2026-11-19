# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f "$HOME/.bashrc.local" ]; then
    . "$HOME/.bashrc.local"
fi

# User specific environment
if ! [[ "$PATH" =~ "" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -f "$HOME/.aliases" ]; then
    . "$HOME/.aliases"
fi

if [ -d "$HOME/.bashrc.d" ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
