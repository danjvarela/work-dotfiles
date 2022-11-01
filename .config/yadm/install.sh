#!/bin/sh

# installs homebrew if it isn't installed yet
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not installed. Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# install yadm
if ! command -v yadm >/dev/null 2>&1; then
  echo "yadm not installed. Installing yadm."
  brew install yadm
else
  echo "yadm already installed."
fi

# install oh my zsh
if ! command -v omz >/dev/null 2>&1; then
  echo "oh-my-zsh not installed. Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh already installed."
fi
