export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"

zstyle ':omz:update' frequency 30

plugins=(git asdf rust fzf tmux zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# variables
PROJECTS="$HOME/Projects"

# keybindings
bindkey '^ ' autosuggest-accept

# path
path+=("$HOME/Library/Python/3.8/bin")
path+=("$HOME/.local/bin/")
export PATH

export EDITOR="nvim"

# aliases
alias lg=lazygit
alias sz="source $HOME/.zshrc"
alias dev="cd $PROJECTS"

# other configs

# functions
#
# lazygit with yadm
function ylg() {
  cd ~
  yadm enter lazygit
  cd -
}

# fkill - kill process
function fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# cd to directory excluding hidden ones
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# cd to a directory including hidden ones
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# zsh; needs setopt re_match_pcre. You can, of course, adapt it to your own shell easily.
tmuxkillf () {
    local sessions
    sessions="$(tmux ls|fzf --exit-0 --multi)"  || return $?
    local i
    for i in "${(f@)sessions}"
    do
        [[ $i =~ '([^:]*):.*' ]] && {
            echo "Killing $match[1]"
            tmux kill-session -t "$match[1]"
        }
    done
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}
