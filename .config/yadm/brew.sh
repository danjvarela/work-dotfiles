#!/bin/sh

# installs homebrew packages and apps
if [ -f $HOME/.Brewfile ]; then
  echo "Installing packages from Brewfile"
  brew bundle --file=$HOME/.Brewfile
else
  echo "$HOME/.Brewfile does not exist"
  exit
fi
