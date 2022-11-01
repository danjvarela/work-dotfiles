#!/bin/sh

# installs the latest version of ruby and rails
echo "\nInstalling ruby"
asdf plugin add ruby
asdf install ruby latest 
asdf global ruby latest

asdf reshim ruby

echo "\nInstalling rails"
gem install rails
