# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# Cow-spoken fortunes every time the terminal is opened
function cowsayfortune {
    NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
    WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
    THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

    #echo "Selected cow: ${THISCOW}, from ${WHICHCOW}"
    fortune | cowsay -f $THISCOW -W 100
}

cowsayfortune

fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.zsh
export EDITOR="nvim"

# For eslint_d
export ESLINT_D_LOCAL_ESLINT_ONLY=1

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

plugins=(git rails bundler asdf fzf tmux autojump sudo zsh-vi-mode zsh-interactive-cd zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
