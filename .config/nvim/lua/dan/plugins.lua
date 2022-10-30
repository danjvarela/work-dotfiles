local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			pcall(require, "dan.plugin_configs.catppuccin")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			pcall(require, "dan.plugin_configs.treesitter")
		end,
		event = "BufRead",
	})

	use({
		"windwp/nvim-ts-autotag",
	})

	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
	})

	use({
		"windwp/nvim-autopairs",
		event = "BufRead",
		config = function()
			pcall(require, "dan.plugin_configs.autopairs")
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		tag = "nightly",
		config = function()
			pcall(require, "dan.plugin_configs.nvimtree")
		end,
	})

	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup({
				enable = true,
			})
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			pcall(require, "dan.plugin_configs.lspzero")
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				auto_close = true,
			})
		end,
		after = { "lsp-zero.nvim" },
	})

	use({
		"folke/which-key.nvim",
		config = function()
			pcall(require, "dan.plugin_configs.whichkey")
		end,
		event = "BufWinEnter",
	})

	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		after = { "nvim-tree.lua" },
		config = function()
			pcall(require, "dan.plugin_configs.barbar")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		after = { "nvim-tree.lua" },
		config = function()
			pcall(require, "dan.plugin_configs.lualine")
		end,
	})

	use({
		"tpope/vim-surround",
		event = "BufRead",
	})
	use({
		"tpope/vim-repeat",
		event = "BufRead",
	})
	use({
		"ggandor/lightspeed.nvim",
		event = "BufRead",
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			pcall(require, "dan.plugin_configs.colorizer")
		end,
		event = "BufRead",
	})

	use({
		"mattn/emmet-vim",
		ft = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	})

	use({
		"numtostr/comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
		after = { "nvim-treesitter" },
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"lukas-reineke/indent-blankline.nvim",
		after = { "nvim-treesitter" },
		config = function()
			pcall(require, "dan.plugin_configs.indentblankline")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			pcall(require, "dan.plugin_configs.gitsigns")
		end,
	})
	use({ "kdheepak/lazygit.nvim" })

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			pcall(require, "dan.plugin_configs.nullls")
		end,
	})

	use({ "lewis6991/impatient.nvim" })

	use({
		"RRethy/vim-illuminate",
		after = { "nvim-treesitter" },
		config = function()
			pcall(require, "dan.plugin_configs.illuminate")
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
