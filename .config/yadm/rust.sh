#!/bin/sh

echo "\nInstalling Rust"
asdf plugin add rust
asdf install rust latest
asdf global rust latest

echo "\nInstalling mdbook"
cargo install mdbook
