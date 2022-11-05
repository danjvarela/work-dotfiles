#!/bin/sh

echo "\nSetting up iterm2"
if [ -f $HOME/.iterm2/com.googlecode.iterm2.plist ]; then
  # specify which folder to load preferences
  defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.iterm2"

  # load iterm2 preferences
  defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
else
  echo "$HOME/.iterm2/com.googlecode.iterm2.plist does not exist"
fi
