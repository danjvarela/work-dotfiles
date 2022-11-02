#!/bin/sh

fontlist=(
"JetBrains Mono Bold Italic Nerd Font Complete Mono.ttf"
"JetBrains Mono Bold Italic Nerd Font Complete.ttf"
"JetBrains Mono Bold Nerd Font Complete Mono.ttf"
"JetBrains Mono Bold Nerd Font Complete.ttf"
"JetBrains Mono ExtraBold Italic Nerd Font Complete Mono.ttf"
"JetBrains Mono ExtraBold Italic Nerd Font Complete.ttf"
"JetBrains Mono ExtraBold Nerd Font Complete Mono.ttf"
"JetBrains Mono ExtraBold Nerd Font Complete.ttf"
"JetBrains Mono ExtraLight Italic Nerd Font Complete Mono.ttf"
"JetBrains Mono ExtraLight Italic Nerd Font Complete.ttf"
"JetBrains Mono ExtraLight Nerd Font Complete Mono.ttf"
"JetBrains Mono ExtraLight Nerd Font Complete.ttf"
"JetBrains Mono Italic Nerd Font Complete Mono.ttf"
"JetBrains Mono Italic Nerd Font Complete.ttf"
"JetBrains Mono Light Italic Nerd Font Complete Mono.ttf"
"JetBrains Mono Light Italic Nerd Font Complete.ttf"
"JetBrains Mono Light Nerd Font Complete Mono.ttf"
"JetBrains Mono Light Nerd Font Complete.ttf"
"JetBrains Mono Medium Italic Nerd Font Complete Mono.ttf"
"JetBrains Mono Medium Italic Nerd Font Complete.ttf"
"JetBrains Mono Medium Nerd Font Complete Mono.ttf"
"JetBrains Mono Medium Nerd Font Complete.ttf"
"JetBrains Mono Regular Nerd Font Complete Mono.ttf"
"JetBrains Mono Regular Nerd Font Complete.ttf"
"JetBrains Mono SemiBold Italic Nerd Font Complete Mono.ttf"
"JetBrains Mono SemiBold Italic Nerd Font Complete.ttf"
"JetBrains Mono SemiBold Nerd Font Complete Mono.ttf"
"JetBrains Mono SemiBold Nerd Font Complete.ttf"
"JetBrains Mono Thin Italic Nerd Font Complete Mono.ttf"
"JetBrains Mono Thin Italic Nerd Font Complete.ttf"
"JetBrains Mono Thin Nerd Font Complete Mono.ttf"
"JetBrains Mono Thin Nerd Font Complete.ttf"
)

fontMissing=false
# install JetbrainsMono nerd font
for font in "${fontlist[@]}"; do
  if [ ! -f "$HOME/Library/Fonts/$font" ]; then
    fontMissing=true
  fi
done

if $fontMissing; then
  echo "\nInstalling JetBrainsMono Nerd Font"
  cd $HOME/Library/Fonts/
  curl -fLo "JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
  yes A | unzip JetBrainsMono.zip
  rm JetBrains*Windows*
  rm JetBrains*Mono*NL*
  rm JetBrainsMono.zip readme.md
  cd $HOME
  break
else
  echo "\nJetBrainsMono Nerd Font already installed."
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
