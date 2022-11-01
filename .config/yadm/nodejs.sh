#!/bin/sh

# installs the latest version of nodejs
echo "\nInstalling nodejs"
asdf plugin add nodejs
asdf install nodejs latest 
asdf global nodejs latest
