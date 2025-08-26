# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# load user specific environment
if [ -f ~/.env ]; then
    source ~/.env
fi