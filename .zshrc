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
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib
# disable auto update in homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
# custom tmux config file
export ZSH_TMUX_CONFIG="$HOME/.config/tmux/tmux.conf"
# do not disable fzf keybindings (CTRL-T, CTRL-R, ALT-C)
export DISABLE_FZF_KEY_BINDINGS="false"
# disable auto-adding of title to tmux windows
export DISABLE_AUTO_TITLE=true
# change config path
export XDG_CONFIG_HOME="$HOME/.config"

path+=("$HOME/.local/bin/")
path+=("/usr/local/opt/gnu-tar/libexec/gnubin")
path+=("/opt/homebrew/bin")
export PATH

ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="gruvbox-material-dark"
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

plugins=(git asdf zsh-vi-mode tmux sudo copypath zsh-autosuggestions ohmyzsh-full-autoupdate zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

function init_after_zsh_vi_mode() {
  source <(fzf --zsh)
  eval "$(zoxide init --cmd cd zsh)"
}

zvm_after_init_commands+=(init_after_zsh_vi_mode)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# use nerdfont characters in the prompt
export PURE_POWER_MODE="modern"

# prompt theme
# source $ZSH_CUSTOM/themes/gruvbox-material-dark.zsh-theme

PATH=~/.console-ninja/.bin:$PATH
