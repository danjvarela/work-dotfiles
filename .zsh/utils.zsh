encrypt(){
  echo "$1" | openssl enc -aes-256-cbc -a
}

decrypt(){
  echo "$1" | openssl enc -aes-256-cbc -a -d
}

alias lg=lazygit
alias reload="omz reload"
alias mux=tmuxinator

alias rails="./bin/rails"
alias bundle="./bin/bundle"
alias rake="./bin/rake"
