#!/bin/sh

# installs homebrew packages and apps
if [ -f $HOME/.Brewfile ]; then
  echo "Installing packages from Brewfile"
  brew bundle --file=$HOME/.Brewfile

  # extra step for asdf
  . $(brew --prefix asdf)/libexec/asdf.sh
else
  echo "$HOME/.Brewfile does not exist"
  exit
fi
