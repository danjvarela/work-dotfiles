#!/bin/sh

echo "\nInstalling tree-sitter-cli"
npm install --global tree-sitter-cli

echo "\nSetting up neovim"
rm -rf $HOME/.local/share/nvim
rm -rf $HOME/.config/nvim/plugin
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'MasonInstall prettierd stylua' -c 'quitall'
