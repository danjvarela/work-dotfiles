return {
	'windwp/nvim-ts-autotag',
	after = { 'nvim-treesitter' },
	config = function()
		require('nvim-ts-autotag').setup {
			filetypes = { 'html', 'javascriptreact', 'typescriptreact', 'eruby' },
		}
	end,
}
