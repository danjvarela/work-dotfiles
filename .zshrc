# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# match dot files
setopt dotglob

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.zsh
export EDITOR="nvim"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

path+=("$HOME/.local/bin/")
path+=("/usr/local/opt/gnu-tar/libexec/gnubin")
path+=("/opt/homebrew/bin")
export PATH

ZSH_THEME="powerlevel10k/powerlevel10k"
PROJECTS="$HOME/Projects"

# don't run the p10k configuration wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# zsh-vi-mode config
function zvm_config(){
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLOCK
}

zstyle ':omz:update' frequency 30

plugins=(git rails bundler asdf fzf tmux autojump sudo copypath zsh-vi-mode zsh-interactive-cd zsh-autosuggestions)
# plugins=(git asdf fzf tmux autojump sudo copypath zsh-vi-mode zsh-interactive-cd zsh-autosuggestions)
# plugins=(git asdf fzf tmux autojump sudo copypath)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
