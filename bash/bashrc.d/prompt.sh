# Colors
CYAN='\[\033[0;36m\]'
YELLOW='\[\033[0;33m\]'
GREEN='\[\033[0;32m\]'
RESET='\[\033[0m\]'

# Prompt
PS1="${CYAN}\u${RESET}@${YELLOW}\H${RESET}: ${GREEN}\w${RESET}\$( __git_ps1 ' ${CYAN}git:(%s)${RESET}' ) \$ "
