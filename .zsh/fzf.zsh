# lazygit with yadm
function ylg() {
  cd ~
  yadm enter lazygit
  cd -
}

function ynvim() {
  file=$(yadm list -a | fzf) && nvim $HOME/$file
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

function fkillp() {
  local pid
  pid=$(lsof -i -P -n | sed 1d | fzf --multi --exact --header="Select processes to kill (use TAB to select multiple)" | awk '{print $2}')
  
  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# kills a tmux session
tkill () {
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

# select a branch to checkout
gcfzf() {
  branch="$(git branch --all | fzf --exit-0 | sed 's/^ *//g')" && git switch "$branch" 
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

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]ackage
bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}

# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]ackage (e.g. uninstall)
bcp() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do; brew uninstall $prog; done;
  fi
}

# Uninstall or open the webpage for the selected application 
# using brew list as input source (all brew cask installed applications) 
# and display a info quickview window for the currently marked application
uninstall() {
    local token
    token=$(brew list --casks | fzf-tmux --query="$1" +m --preview 'brew info {}')

    if [ "x$token" != "x" ]
    then
        echo "(U)ninstall or open the (h)omepae of $token"
        read input
        if [ $input = "u" ] || [ $input = "U" ]; then
            brew uninstall --cask $token
        fi
        if [ $input = "h" ] || [ $token = "h" ]; then
            brew home $token
        fi
    fi
}
