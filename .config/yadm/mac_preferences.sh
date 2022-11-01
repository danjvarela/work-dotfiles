#!/bin/sh

# Adjust the keyboard repeat rate
defaults write InitialKeyRepeat -int 10
defaults write KeyRepeat -int 1

# Dock
# size
defaults write tilesize -int 40
# autohide
defaults write com.apple.dock autohide -bool false
# autohide (animation duration)
defaults write com.apple.dock autohide-time-modifier -float 0.4
# autohide (animation delay)
defaults write com.apple.dock autohide-delay -float 0


# Trackpad
# tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Finder
# view as list
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# show path bar
defaults write com.apple.finder ShowPathbar -bool true

