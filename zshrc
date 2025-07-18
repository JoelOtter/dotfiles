source ~/.dotfiles/antigen/antigen.zsh

export PATH="/opt/homebrew/bin:$PATH"

eval "$(direnv hook zsh)"

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ssh-agent
antigen bundle lukechilds/zsh-nvm
antigen bundle chriskempson/base16-shell
#antigen bundle kubectl

antigen apply

base16_materia

setopt inc_append_history
setopt share_history

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[magenta]%}%m%{$reset_color%}[%~] %{$fg[magenta]%}%

[%(?.%{$fg[green]%}.%{$fg[red]%})%D{%H:%M}%{$fg[magenta]%}] -> "

autoload -U compinit
compinit

autoload zmv

setopt completeinword

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

alias wow='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gb='git branch'
alias gpom='git pull origin master'
alias gl='git log --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ad%C(reset) %C(blue)[%an]%C(auto)%d%C(reset)%n%<(8)%<(10)%s%n" --date=short'
alias gbi='git branch-i'
alias tf='terraform'
alias tfw='terraform-workspace-i'
alias k='kubectl'
alias kx='k8s-context-i'
alias ls='eza'
alias lst='ls --tree'
alias tree='tree -C'
alias tmux='TERM=xterm-256color tmux'
alias vim='nvim'
alias vi='nvim'
alias nj='ninja'
alias did="vim +'r!date' +'normal o' +'normal o' +'normal O-' ~/.did.txt"

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

function gupd {
  git fetch origin "$1:$1"
}

alias ta="tmux attach-session -t"

alias tl='tmux ls'

# Keybinds
bindkey -e
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

export HISTSIZE=1024
export HISTFILESIZE=1024
export HISTFILE=~/.zhistory # Don't forget to to set this also
export EDITOR=nvim

source ~/.zshrc-local

if [ "$TMUX" = "" ]; then tmux; fi
