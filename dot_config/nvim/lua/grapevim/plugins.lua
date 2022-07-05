local plugins = {
  -- Plugin Manager
  { "wbthomason/packer.nvim" },

  -- File explorer
  {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
  },

  -- Never forget keybindings
  { "folke/which-key.nvim" },

  -- Commenting stuff out
  {
    "tpope/vim-commentary",
    event = "BufReadPost"
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost"
  },

  -- Colorschemes
  { "sainnhe/everforest" },
  { "sainnhe/edge" },

  -- Transparent nvim
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = { "all" }
      })
    end
  },

  -- Finding stuff
  {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } }
  },

  -- Fancy bufferlines
  {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
  },

  -- Fancy statusline
  {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  },

  -- Git integration
  { "kdheepak/lazygit.nvim" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },

  -- Show colors
  {
    "norcalli/nvim-colorizer.lua",
    ft = { "yaml", "css", "json", "fish", "xml", "kitty", "sh", "toml", "xdefaults", "vim", "lua" }
  },

  -- Autocomplete delimiters
  {
    "windwp/nvim-autopairs",
    event = "BufReadPost",
    config = function()
      package.loaded["grapevim.core.autopairs"] = nil
      require("grapevim.core.autopairs").setup()
    end
  },

  -- Close buffers without changing window layout
  {
    "kazhala/close-buffers.nvim",
    config = function()
      require("close_buffers").setup({})
    end,
    event = "BufWinEnter"
  },

  -- Syntax highlighting and custom text objects
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "RRethy/nvim-treesitter-textsubjects" },
    },
  },

  -- Resizing splits
  {
    "simeji/winresizer",
    event = "BufWinEnter"
  },

  -- Emmet completions
  { "mattn/emmet-vim" },

  -- Surround stuff with delimiters
  {
    "tpope/vim-surround",
    event = "BufReadPost"
  },

  -- Repeat actions
  {
    "tpope/vim-repeat",
    event = "BufReadPost"
  },

  -- Support for rails
  {
    "tpope/vim-rails",
    ft = { "ruby" }
  },

  -- File explorer (for files not on project)
  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup()
    end
  },

  -- Editing markdown files
  {
    "preservim/vim-markdown",
    ft = "markdown"
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = "markdown",
  },

  -- Personal wiki
  { "vimwiki/vimwiki" },
  { "michal-h21/vim-zettel" },

  { "neovim/nvim-lspconfig" }, -- lsp configurations
  { "jose-elias-alvarez/null-ls.nvim" }, -- formatter
  { "williamboman/nvim-lsp-installer" }, -- lsp installer
  { "folke/lua-dev.nvim" }, -- sumneko_lua config to work with neovim

  -- autocompletions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/nvim-cmp" }, -- completion engine

  -- snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
}

return plugins
