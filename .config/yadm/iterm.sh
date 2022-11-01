#!/bin/sh

# install JetbrainsMono nerd font
if [ ! -f $HOME/Library/Fonts/JetBrains Mono Regular Nerd Font Complete.ttf ]; then
  echo "\nInstalling JetBrainsMono Nerd Font"
  cd $HOME/Library/Fonts/
  curl -fLo "JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
  yes A | unzip JetBrainsMono.zip
  rm -v JetBrains*Windows*
  rm -v JetBrainsMono.zip readme.md
  cd $HOME
else
  echo "JetBrains Nerd font already installed."
fi

echo "\nSetting up iterm2"
if [ -f $HOME/.iterm2/com.googlecode.iterm2.plist ]; then
  # specify which folder to load preferences
  defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.iterm2"

  # load iterm2 preferences
  defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
else
  echo "$HOME/.iterm2/com.googlecode.iterm2.plist does not exist"
fi
