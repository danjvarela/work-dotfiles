#!/bin/sh

# Adjust the keyboard repeat rate
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Dock
# size
defaults write tilesize -int 40
# autohide
defaults write com.apple.dock autohide -bool true
# autohide (animation duration)
defaults write com.apple.dock autohide-time-modifier -float 0.4
# autohide (animation delay)
defaults write com.apple.dock autohide-delay -float 0
killAll Dock


# Trackpad
# tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad -bool true

# Finder
# view as list
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# show path bar
defaults write com.apple.finder ShowPathbar -bool true
killAll Finder

