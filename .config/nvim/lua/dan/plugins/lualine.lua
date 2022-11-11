return {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons' },
	config = function()
		require('lualine').setup {
			options = {
				theme = 'catppuccin',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				globalstatus = true,
			},
		}
	end,
}
