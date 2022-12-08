alias lg=lazygit
alias reload="omz reload"
alias dev="cd $PROJECTS"
alias mux=tmuxinator

ff(){
  find . -iname '*.erb' -exec htmlbeautifier {} \;
  standard --fix
  standardrb --fix
}
