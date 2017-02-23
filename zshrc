source ~/dotfiles/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[magenta]%}%m%{$reset_color%}[%~] %{$fg[magenta]%}%

-> "

autoload -U compinit
compinit

setopt completeinword

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

alias wow='git status'
alias gd='git diff'
alias gpom='git pull origin master'
alias gl='git log'
alias ls='ls -G'
alias tmux='TERM=xterm-256color tmux'

function grepr {
  grep -R "$1" .
}

if [ "$TMUX" = "" ]; then tmux; fi
