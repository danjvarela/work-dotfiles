# dotfiles

Garbage (that took me quite some time to create) from my programming setup, managed by [yadm](yadm.io). I'm working on a mac so you have to make some adjustments if you want to clone this setup on linux (I don't advise cloning this though. Just read through and find out if some config suits your workflow). This is always a work in progress.

## Demo
### Neovim
![Screen Shot 2022-10-31 at 8 14 57 AM](https://user-images.githubusercontent.com/55782256/198908965-e9bca836-f00a-45d7-bb9d-ef9bebbdedb2.png)
![Screen Shot 2022-10-31 at 8 15 47 AM](https://user-images.githubusercontent.com/55782256/198908983-295a2ad6-b54f-4682-8882-406df772d72c.png)

### Tmux
![Screen Shot 2022-10-31 at 8 17 06 AM](https://user-images.githubusercontent.com/55782256/198909048-14ec55e8-c7b9-451a-8c13-927e4a07e759.png)
![Screen Shot 2022-10-31 at 8 18 53 AM](https://user-images.githubusercontent.com/55782256/198909133-f760589d-883b-4d3a-9efc-c64d0156ea8f.png)

## Zsh
I use [oh-my-zsh](https://ohmyz.sh/) with [gnzh](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#gnzh) theme. Syntax highlighting is done by [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) while the auto-suggestions are done by (you guessed it) [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions). You can find the list of oh-my-zsh plugins I use under `plugins` on my [.zshrc](https://github.com/danjvarela/dotfiles/blob/master/.zshrc) file.

## Tmux
I use [tmux](https://github.com/tmux/tmux) as my terminal multiplexer. I forked the [catppuccin theme for tmux](https://github.com/catppuccin/tmux) and modified the status bar a bit to display stuff that I need. The catppuccin flavour I use is `mocha`.

### Keybindings
Here are the list of keybindings (`prefix` is `<CTRL-b>`). I aim to use vim keybindings as much as possible just for the muscle memory.

* `prefix + h` - Navigate to the pane to the left of the current one.
* `prefix + l` - Navigate to the pane to the right of the current one.
* `prefix + j` - Navigate to the pane below the current one.
* `prefix + k` - Navigate to the pane above the current one.
* `alt + <ARROW KEY>` - Navigate to the pane in the direction of the arrow key.
* `prefix + v` - Split window vertically
* `prefix + s` - Split window horizontally.
* `prefix + Enter` - Enter `copy-mode`. I set the `copy-mode` to be in `vi-mode`. For the list of keybindings (See the notes below for overridden keybindings), visit https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html#copy-mode.
* `prefix + p` - Paste.

### Plugins
* [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager.
* [tmux-plugins/tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) - Sensible defaults for tmux.
* [laktak/extrakto](https://github.com/laktak/extrakto) - Select text easily by fuzzy-finding (Look ma, no mouse).

### Notes
* In copy mode, you can press `v` to start selecting (much like entering visual mode in vim) instead of the `space` key as indicated in this [tmux documentation](https://tmuxguide.readthedocs.io/).
* Text copied in `copy-mode` is piped to the system clipboard.
* Some of the keybindings is set by the plugins. Visit their documentations for reference.

## Neovim
My main text editor configured based on [Lunarvim](https://www.lunarvim.org/).

### Keybindings
Note that the `leader` key is the `space` key. You can view the keybindings [here](https://github.com/danjvarela/dotfiles/blob/master/.config/nvim/lua/dan/keybindings.lua), these are the ones not indicated on my [which-key](https://github.com/danjvarela/dotfiles/blob/master/.config/nvim/lua/dan/plugin_configs/whichkey.lua) configuration. In general, you can just press a key in normal or visual mode and a menu will pop up to guide of the next keys to press for a specific action.

#### Insert mode
* `jk` - Escape to normal mode.
* `alt + j/k` - Move a line up/down.
* `ctrl + s` - Save.
* `ctrl + q` - Quit neovim.

#### Normal Mode
* `alt + j/k` - Move a line up/down.
* `ctrl + h/j/k/l` - Navigate windows left/down/up/right.
* `ctrl + s` - Save.
* `ctrl + q` - Quit neovim.
* `H` - Go to the previous buffer.
* `L` - Go to the next buffer.
* `alt + >` - Move current buffer to the right.
* `alt + <` - Move current buffer to the left.
* `alt + {1-9}>` - Go to the nth buffer (`n` is the number).
* `alt + 0` - Go to the last buffer

#### Visual Mode
* `alt + j/k` - Move a line up/down.
* `>` - Indent selection.
* `<` - Unindent selection.
* `ctrl + q` - Quit neovim.

### Plugins

#### Plugin management
* [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin manager.

#### UI
* [catppuccin/nvim](https://github.com/catppuccin/nvim) - Colorscheme. I use `mocha` flavour in my config.
* [xiyaowong/nvim-transparent](https://github.com/xiyaowong/nvim-transparent) - Makes neovim transparent!
* [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim) - A tabline plugin to display open tabs/buffers.
* [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A statusline plugin.
* [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Marks indentations on the current buffer.
* [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate) - Highlight and move between references of the word under cursor.
* [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - Visualize colors.

#### Navigation
* [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - A file explorer tree for neovim.
* [ggandor/lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim) - Jump to any position in the window using 2-character search patterns.
* [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extensible fuzzy-finder.

#### Editing
* [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Autocomplete html/xml tags.
* [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopair brackets, braces, quotes, and more.
* [folke/which-key.nvim](https://github.com/folke/which-key.nvim) - Help for keybindings.
* [tpope/vim-surround](https://github.com/tpope/vim-surround) - Surround text with braces, brackets, quotes, and more.
* [tpope/vim-repeat](https://github.com/tpope/vim-repeat) - Repeat actions with `.`.
* [mattn/emmet-vim](https://github.com/mattn/emmet-vim) - Support for [emmet](https://emmet.io/) abbreviations.
* [numtostr/comment.nvim](https://github.com/numToStr/Comment.nvim) - Commenting plugin.

#### LSP, Completions, and Syntax highlighting
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting and language parsers.
* [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - Providdes the `commentstring` option based on the location of the cursor. The location is based on `treesitter` queries.
* [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) - Bundles boilerplate code necessary to setup `lsp` and `completions`.
* [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Acts as a language server to inject LSP diagnostics, code actions, linting, formatting, and more.
* [folke/trouble.nvim](https://github.com/folke/trouble.nvim) - A pretty list of diagnostics, references, telescope results, quickfix, and location lists.

#### Git
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git decorations as well as support for basic git operations.
* [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvi) - Plugin for calling [lazygit](https://github.com/jesseduffield/lazygit) in neovim.

#### Others
* [lewis6991/impatient.nvim](https://github.com/lewis6991/impatient.nvim) - Improve startup time.
* [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - Real time markdown preview while editing.
