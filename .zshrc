if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.zsh
export EDITOR="nvim"

path+=("$HOME/.local/bin/")
path+=("/usr/local/opt/libpq/bin")
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

plugins=(git rails asdf fzf tmux autojump sudo zsh-vi-mode zsh-interactive-cd zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
