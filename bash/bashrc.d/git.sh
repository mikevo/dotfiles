# Git prompt support
if [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
elif [[ -f /usr/lib/git-core/git-sh-prompt ]]; then
	. /usr/lib/git-core/git-sh-prompt
fi

# Git status indicators
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
