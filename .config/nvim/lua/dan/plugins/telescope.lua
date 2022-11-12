return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.0',
	requires = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		{ 'kdheepak/lazygit.nvim' },
	},
	config = function()
		local telescope = require 'telescope'
		telescope.setup {}
		telescope.load_extension 'fzf'
		telescope.load_extension 'lazygit'
	end,
}
