# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

export GOPATH=~/dev/gocode/
export IBUS_ENABLE_SYNC_MODE=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

if [ -f ~/.linuxbrew/bin/brew ]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
fi
