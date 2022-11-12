return {
	'romgrk/barbar.nvim',
	requires = { 'kyazdani42/nvim-web-devicons' },
	config = function()
		require('bufferline').setup {
			icon_separator_active = '',
			icon_separator_inactive = '',
			animation = false,
		}
	end,
}
