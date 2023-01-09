return {
	'VonHeikemen/lsp-zero.nvim',
	requires = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },

		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-nvim-lua' },

		-- Snippets
		{ 'L3MON4D3/LuaSnip' },
		{ 'rafamadriz/friendly-snippets' },
	},
	config = function()
		local lsp = require 'lsp-zero'

		lsp.preset 'recommended'

		lsp.set_preferences {
			sign_icons = {
				hint = '',
				info = '',
				warn = '',
				error = '',
			},
		}

		lsp.nvim_workspace {
			library = vim.api.nvim_get_runtime_file('', true),
		}

		lsp.extend_lspconfig {
			set_lsp_keymaps = {
				omit = {
					'<F2>',
					'<F4>',
				},
			},
			on_attach = function(_, bufnr)
				local map = require('dan.utils').map
				local opts = { buffer = bufnr, noremap = true, silent = true }

				map('n', 'gR', vim.lsp.buf.rename, opts)
				map('n', 'ga', vim.lsp.buf.code_action, opts)
			end,
		}

		lsp.setup()
	end,
}
