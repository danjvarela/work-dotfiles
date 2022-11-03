export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.zsh
export EDITOR="nvim"

path+=("$HOME/.local/bin/")
export PATH

ZSH_THEME="gnzh"
PROJECTS="$HOME/Projects"

zstyle ':omz:update' frequency 30

plugins=(git asdf fzf tmux zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# jump
eval "$(jump shell)"
