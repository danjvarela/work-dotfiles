#!/bin/sh

# installs the latest version of ruby
echo "\nInstalling ruby"
asdf plugin add ruby
asdf install ruby latest 
asdf global ruby latest
