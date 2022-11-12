return {
	'folke/which-key.nvim',
	config = function()
		require('which-key').setup {
			layout = {
				spacing = 5,
			},
		}
	end,
}
