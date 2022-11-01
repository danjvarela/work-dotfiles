#!/bin/sh

wallpaper=$HOME/Pictures/Wallpapers/waves.png

if [-f $wallpaper] then
  osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'"$wallpaper"\"
else
  echo "$wallpaper does not exist"
fi
