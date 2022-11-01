#!/bin/sh

# installs the latest version of rust
echo "\nInstalling rust"
asdf plugin add rust
asdf install rust latest 
asdf global rust latest
