export ZSH=~/.oh-my-zsh

ZSH_THEME=""

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  brew
  cargo
  docker
  docker-compose
  git
  golang
  kubectl
  npm
  rust
  rustup
  sudo
  terraform
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

export LANG=en_US.UTF-8

[ -f ~/.zsh.local ] && source ~/.zsh.local || true
