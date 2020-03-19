source ~/.dotfiles/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ssh-agent
antigen bundle lukechilds/zsh-nvm
#antigen bundle kubectl

antigen apply

setopt inc_append_history
setopt share_history

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[magenta]%}%m%{$reset_color%}[%~] %{$fg[magenta]%}%

[%(?.%{$fg[green]%}.%{$fg[red]%})%D{%H:%M}%{$fg[magenta]%}] -> "

autoload -U compinit
compinit

setopt completeinword

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

alias wow='git status'
alias gd='git diff'
alias gb='git branch'
alias gpom='git pull origin master'
alias gl='git log'
alias ls='ls -G'
alias tree='tree -C'
alias tmux='TERM=xterm-256color tmux'
alias vim='nvim'
alias vi='nvim'
alias did="vim +'normal Go' +'r!date' ~/.did.txt"

function grepr {
  grep -R "$1" .
}

function @ {
  cd $(git rev-parse --show-toplevel)/${1}
}

function gpush {
  git push origin `git rev-parse --abbrev-ref HEAD`
}

function gpull {
  git pull origin `git rev-parse --abbrev-ref HEAD`
}

alias ta="tmux attach-session -t"

alias tl='tmux ls'

source ~/.zshrc-local

if [ "$TMUX" = "" ]; then tmux; fi
