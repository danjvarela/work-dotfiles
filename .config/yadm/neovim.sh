#!/bin/sh

if ! command -v tree-sitter >/dev/null 2>&1; then
  echo "\nInstalling tree-sitter-cli for automatic installation of neovim language parsers."
  npm install --global tree-sitter-cli
else
  echo "tree-sitter-cli already installed."
fi

echo "\nSetting up neovim"
rm -rf ~/.local/share/nvim
nvim --headless "+Lazy! sync" +qa
