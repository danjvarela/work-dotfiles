#!/bin/sh

if ! command -v tree-sitter >/dev/null 2>&1; then
  echo "\nInstalling tree-sitter-cli for automatic installation of neovim language parsers."
  npm install --global tree-sitter-cli
else
  echo "tree-sitter-cli already installed."
fi


echo "\nSetting up neovim"
[ ! -d $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim/ ] && git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
rm -rfv $HOME/.config/nvim/plugin
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'MasonInstall prettierd stylua' -c 'quitall'
