# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# load user specific environment
if [ -f ~/.env ]; then
    source ~/.env
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

if [ -f ~/.linuxbrew/bin/brew ]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
fi

export PATH="$HOME/.poetry/bin:$PATH"
