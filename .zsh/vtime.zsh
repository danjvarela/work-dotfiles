# collection of useful shortcuts for work

ppp() {
  declare -A themePorts
  themePorts[sssbet]=3205
  themePorts[hugebet]=3201
  themePorts[spaceman]=3202
  themePorts[amusino]=3203
  themePorts[777bet]=3204
  themePorts[kash777]=3200
  themePorts[smash]=3206
  themePorts[t1bet]=3207
  themePorts[betacai]=3208
  yarn && THEME=$1 yarn dev -- -- -p $themePorts[$1]
}

ptest() {
  THEME=$1 yarn theme && tsc --noEmit --project tsconfig.json
}
