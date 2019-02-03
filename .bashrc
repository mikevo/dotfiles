# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export VAGRANT_DEFAULT_PROVIDER=virtualbox

# User specific aliases and functions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
