return {
	'lukas-reineke/indent-blankline.nvim',
	event = 'BufReadPost',
	config = function()
		require('indent_blankline').setup {}
	end,
}
