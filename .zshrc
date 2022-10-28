export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"

zstyle ':omz:update' frequency 30

plugins=(git asdf rust fzf zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# keybindings
bindkey '^ ' autosuggest-accept

# path
path+=("$HOME/Library/Python/3.8/bin")
path+=("$HOME/.local/bin/")
export PATH

# aliases

# other configs

# functions
# lazygit with yadm
function ylg() {
  cd ~
  yadm enter lazygit
  cd -
}
