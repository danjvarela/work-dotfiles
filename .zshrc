if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.zsh
export EDITOR="nvim"

path+=("$HOME/.local/bin/")
export PATH

ZSH_THEME="powerlevel10k/powerlevel10k"
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
PROJECTS="$HOME/Projects"

zstyle ':omz:update' frequency 30

plugins=(git asdf fzf tmux autojump sudo zsh-vi-mode zsh-interactive-cd zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
