#!/bin/sh

if [[ ! -d /Applications/FileZilla.app ]]; then
  echo "\nInstalling FileZilla"
  TMPFILE=filezilla.app.tar.bz2
  URL="https://dl1.cdn.filezilla-project.org/client/FileZilla_3.63.2.1_macosx-x86.app.tar.bz2?h=CFtNBJs-ImZWzi7lbaDArg&x=1679812698"
  wget -q --show-progress -O $TMPFILE $URL && \
  tar -xvf $TMPFILE && \
  mv FileZilla.app /Applications/ && \
  rm $TMPFILE
else
  echo "FileZilla is already installed"
fi
