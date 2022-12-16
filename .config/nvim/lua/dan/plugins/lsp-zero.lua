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

		-- local lsp_formatting = function(bufnr)
		-- 	vim.lsp.buf.format {
		-- 		filter = function(client)
		-- 			local will_format = {
		-- 				['null-ls'] = true,
		-- 				['solargraph'] = true,
		-- 			}
		-- 			return will_format[client.name]
		-- 		end,
		-- 		bufnr = bufnr,
		-- 	}
		-- end
		-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

		lsp.preset 'recommended'

		lsp.set_preferences {
			sign_icons = {
				hint = '',
				info = '',
				warn = '',
				error = '',
			},
		}

		-- lsp.on_attach(function(client, bufnr)
		-- 	if client.supports_method 'textDocument/formatting' then
		-- 		vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
		-- 		vim.api.nvim_create_autocmd('BufWritePre', {
		-- 			group = augroup,
		-- 			buffer = bufnr,
		-- 			callback = function()
		-- 				lsp_formatting(bufnr)
		-- 			end,
		-- 		})
		-- 	end
		-- end)

		lsp.nvim_workspace {
			library = vim.api.nvim_get_runtime_file('', true),
		}

		lsp.setup()
	end,
}
