#!/bin/sh

# install JetbrainsMono nerd font
echo "\nInstalling JetBrainsMono Nerd Font"
cd $HOME/Library/Fonts/
curl -fLo "JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrains*Windows*
rm JetBrainsMono.zip readme.md
cd $HOME

echo "\nSetting up iterm2"

if [ -f $HOME/.iterm2/com.googlecode.iterm2.plist ] then
  # specify which folder to load preferences
  defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.iterm2"

  # load iterm2 preferences
  defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
else
  echo "$HOME/.iterm2/com.googlecode.iterm2.plist does not exist"
fi
