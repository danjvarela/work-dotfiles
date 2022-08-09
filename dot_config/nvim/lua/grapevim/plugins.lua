local plugins = {
	-- plugin manager
	{ "wbthomason/packer.nvim" },

	-- colorscheme
	{ "sainnhe/edge" },
	{ "sainnhe/everforest" },
	{ "folke/tokyonight.nvim" },

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					globalstatus = true,
				},
			})
		end,
	},

	-- comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- surrounding stuff with delimiters
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },

	-- finding stuff
	{
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	},

	-- git integration
	{ "kdheepak/lazygit.nvim" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- file explorer
	{
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
	},

	-- language server and completions
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "sumneko_lua", "tsserver", "html", "cssls", "yamlls", "jsonls", "pyright" },
			})
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{ "folke/lua-dev.nvim" },

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{ "rafamadriz/friendly-snippets" },

	-- show colors
	{
		"rrethy/vim-hexokinase",
		run = "make hexokinase",
		config = function()
			vim.g.Hexokinase_highlighters = { "backgroundfull" }
			vim.g.Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla,triple_hex"
		end,
	},

	-- emmet completions
	{
		"mattn/emmet-vim",
		config = function()
			vim.g.user_emmet_mode = "a"
			vim.g.user_emmet_leader_key = "<C-z>"
		end,
	},

	-- show indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},

	-- Syntax highlighting and custom text objects
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "RRethy/nvim-treesitter-textsubjects" },
			{ "p00f/nvim-ts-rainbow" },
		},
	},

	-- autopair delimiters
	{ "windwp/nvim-autopairs" },

	-- formatting and other lsp features
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- improve startup time
	{ "lewis6991/impatient.nvim" },

	-- keybindings
	{ "folke/which-key.nvim" },
}
return plugins
