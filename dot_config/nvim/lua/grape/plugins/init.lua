local M = {}

M.plugins = {
  -- plugin manager
  { "wbthomason/packer.nvim" },

  -- utility functions
  { "nvim-lua/plenary.nvim" },

  -- file explorer
  {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
  },

  -- colorschemes
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
    end,
  },
  { "LunarVim/Colorschemes" },
  { "folke/tokyonight.nvim" },
  {
    "marko-cerovac/material.nvim",
    config = function()
      vim.g.material_style = "darker"
      require('material').setup()
    end
  },

  -- finding stuff
  {
    "nvim-telescope/telescope.nvim",
    event = "BufEnter",
    config = function()
      require("grape.plugins.settings.telescope").setup()
    end
  },

  -- keybinding guide
  {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = function()
      require("grape.plugins.settings.whichkey").setup()
    end
  },

  -- interface
  {
    "akinsho/bufferline.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    event = "BufEnter",
    config = function()
      require("grape.plugins.settings.bufferline").setup()
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    event = "BufEnter",
    config = function()
      require("grape.plugins.settings.lualine").setup()
    end
  },

  -- syntax highlighting and custom textobjects
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "RRethy/nvim-treesitter-textsubjects" },
    },
  },

  -- commenting stuff
  {
    "tpope/vim-commentary",
    event = "BufRead"
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost"
  },

  -- delete buffers and don"t mess up the window
  {
    "kazhala/close-buffers.nvim",
    event = "BufReadPost"
  },

  -- highlight colors
  {
    "norcalli/nvim-colorizer.lua",
    ft = { "yaml", "css", "json", "fish", "xml", "kitty", "sh", "toml", "xdefaults", "vim", "lua" }
  },

  -- resizing splits
  {
    "simeji/winresizer",
    event = "BufWinEnter"
  },

  -- language server
  {
    "windwp/nvim-autopairs",
    event = "BufReadPost",
    config = function()
      require("grape.plugins.settings.autopairs").setup()
    end
  }, -- auto pair delimiters
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    config = function()
      require("grape.plugins.settings.lspconfig").setup()
    end
  }, -- lsp configurations
  { "tamago324/nlsp-settings.nvim" }, -- lsp settings in json
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

  -- git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },
  { "kdheepak/lazygit.nvim" },

  -- emmet completions
  {
    "mattn/emmet-vim",
    ft = { "eruby", "html", "jsx" },
    config = function()
      vim.g.user_emmet_leader_key = "<C-a>"
    end
  },

  -- miscellaneous
  {
    "tpope/vim-surround",
    event = "BufReadPost"
  },
  {
    "tpope/vim-repeat",
    event = "BufReadPost"
  },
  {
    "tpope/vim-rails",
    ft = { "ruby" }
  },

  -- file explorer (for files not on project)
  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup()
    end
  },

  -- editing markdown files
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

  -- vim wiki
  { "vimwiki/vimwiki" },
  { "michal-h21/vim-zettel" }
}

function M.load()
  require("grape.plugins.loader").load(M.plugins)

  local settings = vim.api.nvim_get_runtime_file("lua/grape/plugins/settings/*.lua", true)

  for _, v in pairs(settings) do
    local filename = require("grape.utils").get_filename(v)
    require("grape.plugins.settings." .. string.gsub(filename, ".lua", "")).setup()
  end
end

return M
