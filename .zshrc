export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.zsh
export EDITOR="nvim"

path+=("$HOME/.local/bin/")
export PATH

ZSH_THEME="powerlevel10k/powerlevel10k"
PROJECTS="$HOME/Projects"

# zsh-vi-mode config
function zvm_config(){
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLOCK
}

zstyle ':omz:update' frequency 30

plugins=(git rails bundler asdf fzf tmux autojump sudo copypath zsh-vi-mode zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
