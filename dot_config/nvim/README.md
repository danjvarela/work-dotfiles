# What is this?
This is my personal neovim configuration heavily derived from [Lunarvim](https://github.com/LunarVim/LunarVim). I am learning how to configure neovim and I found it best to make it from scratch. This is **NOT** made to work for everybody so clone it at your own risk and just adopt the configurations you prefer.

# Installation
Backup first your old neovim configuration and then execute:
```
git clone https://github.com/danjvarela/neovim-config ~/.config/nvim
```
Opening for the first time might trigger some errors. Execute `:PackerSync` to download all plugins. Reopen neovim to load plugin configurations.

# Plugins
Below are the plugins used in this configuration. Click on each link to read their documentation.
|Plugin|Description|
|---|---|
|[packer.nvim](https://github.com/wbthomason/packer.nvim)|A plugin manager made to work with lua|
|[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)|All the lua functions you don't want to write twice|
|[nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)|A file explorer written in lua|
|[onedark.vim](https://github.com/joshdick/onedark.vim)|Colorscheme|
|[gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)|Colorscheme|
|[everforest](https://github.com/sainnhe/everforest)|Colorscheme|
|[Colorschemes](https://github.com/LunarVim/Colorschemes)|Colorschemes made to work with LunarVim|
|[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)|Excellent finding tool for anything|
|[which-key.nvim](https://github.com/folke/which-key.nvim)|Opens a popup with suggestions to complete a key binding|
|[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)|A snazzy buffer line (with tabpage integration) for Neovim built using lua|
|[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)|A blazing fast and easy to configure Neovim statusline written in Lua|
|[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)|A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon|
|[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)|Language parsers|
|[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)|Custom textobjects for nvim-treesitter|
|[nvim-treesitter-textsubjects](https://github.com/RRethy/nvim-treesitter-textsubjects)|nvim-treesitter smart incremental selection|
|[vim-commentary](https://github.com/tpope/vim-commentary)|Commenting stuff up|
|[nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)|Provides comment context for filetypes with multiple language|
|[close-buffers.nvim](https://github.com/kazhala/close-buffers.nvim)|Close buffers without messing up the window layout|
|[nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)|Highlight colors (useful for css and creating colorschemes)|
|[winresizer](https://github.com/simeji/winresizer)|Resize split windows with ease|
|[nvim-autopairs](https://github.com/windwp/nvim-autopairs)|Autopair brackets, parentheses, quotes, etc.|
|[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)|Default configs for language servers|
|[nlsp-settings.nvim](https://github.com/tamago324/nlsp-settings.nvim)|Creating custom language server configurations in json|
|[null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)|Inject more LSP functionalities like formatting, linting, code actions, etc.|
|[nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)|Install language servers within vim runtime|
|[lua-dev.nvim](https://github.com/folke/lua-dev.nvim)|Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.|
|[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)|nvim-cmp source for neovim's built-in language server client|
|[cmp-buffer](https://github.com/hrsh7th/cmp-buffer)|nvim-cmp source for buffer words|
|[cmp-path](https://github.com/hrsh7th/cmp-path)|nvim-cmp source for filesystem paths|
|[cmo-cmdline](https://github.com/hrsh7th/cmp-cmdline)|nvim-cmp source for vim's cmdline|
|[cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)|nvim-cmp source for displaying function signatures with the current parameter emphasized|
|[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)|A completion engine plugin for neovim written in Lua|
|[LuaSnip](https://github.com/L3MON4D3/LuaSnip)|Snippet engine|
|[cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)|luasnip completion source for nvim-cmp|
|[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)|Snippets collection for a set of different programming languages for faster development|
|[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)|Git decorations|
|[lazygit](https://github.com/kdheepak/lazygit.nvim)|Plugin for calling [lazygit](https://github.com/jesseduffield/lazygit) from within neovim|
|[emmet-vim](https://github.com/mattn/emmet-vim)|Support for expanding abbreviations similar to emmet|
|[vim-surround](https://github.com/tpope/vim-surround)|Provides mappings to easily delete, change and add parentheses, brackets, quotes, tags, etc. in pairs|
|[vim-repeat](https://github.com/tpope/vim-repeat)|Remap "." to repeat plugin in a way that plugins can tap into it|
|[vim-rails](https://github.com/tpope/vim-rails)|Rails support for neovim|

# Plugin settings
Plugin configurations live under `lua/grape/plugins/settings/`

# Keybindings
Keybindings can be found in these files: `lua/grape/keybindings.lua`, `lua/grape/plugins/settings/whichkey.lua`, and `lua/grape/plugins/settings/lspconfig.lua` (lsp related keybindings).

# Settings
Settings can be found in `lua/grape/settings.lua`. Feel free to modify anything.

# Screenshots
Terminal: iterm2  
Font: FiraCode Nerd Font  
Colorscheme: Everforest  

![Screen Shot 2022-06-27 at 7 39 00 AM](https://user-images.githubusercontent.com/55782256/175838492-d9b59cbd-e1aa-4ba0-b16d-5f77c3aa026b.png)
![Screen Shot 2022-06-27 at 7 39 21 AM](https://user-images.githubusercontent.com/55782256/175838494-2e98f3d7-080f-40f1-87db-08c6300a5963.png)
![Screen Shot 2022-06-27 at 7 40 08 AM](https://user-images.githubusercontent.com/55782256/175838496-38a61d9b-b969-4b80-9444-9382a8d44801.png)
![Screen Shot 2022-06-27 at 7 42 09 AM](https://user-images.githubusercontent.com/55782256/175838498-9d37e566-ad81-4048-a653-35b7ef3cf01e.png)
![Screen Shot 2022-06-27 at 7 42 30 AM](https://user-images.githubusercontent.com/55782256/175838500-5ef11719-9a4f-41e8-833b-3e16a1d6d234.png)
