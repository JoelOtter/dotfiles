# This is dependent on base16-shell being installed. Fixes terminal colours.
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

alias wow='git status'
alias gd='git diff'
alias ls='ls -G'
alias tmux="TERM=xterm-256color tmux"
alias gpom="git pull origin master"
alias gl="git log"

function grepr {
  grep -R "$1" .
}

RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
RESET="\[\033[00m\]"
PS1="$RED\u$YELLOW@$PURPLE\h[$RESET\w$PURPLE]\n-> $RESET"
