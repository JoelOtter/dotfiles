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

