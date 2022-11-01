#!/bin/sh

echo "\nSetting up Tmux"
# install tpm
[ ! -d $HOME/.tmux/plugins/tpm/ ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# start a server but don't attach to it
tmux start-server
# create a new session but don't attach to it either
tmux new-session -d
# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
# kill the server
tmux kill-server
