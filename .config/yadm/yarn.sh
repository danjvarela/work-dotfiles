#!/bin/sh

echo "\nInstalling yarn"
asdf plugin add yarn
asdf install yarn latest
asdf global yarn latest
