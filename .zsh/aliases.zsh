start_work_session() {
  local current_directory_name=$(basename "$PWD")
  tmuxinator start work_session -n "$current_directory_name" .
}

function encrypt(){
  echo "$1" | openssl enc -aes-256-cbc -a
}

function decrypt(){
  echo "$1" | openssl enc -aes-256-cbc -a -d
}

alias lg=lazygit
alias reload="omz reload"
alias mux=tmuxinator
alias sws="start_work_session"

alias rails="./bin/rails"
alias bundle="./bin/bundle"
alias rake="./bin/rake"
