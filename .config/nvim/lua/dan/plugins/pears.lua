return {
	'steelsojka/pears.nvim',
	after = { 'nvim-treesitter' },
	config = function()
		require('pears').setup(function(conf)
			conf.preset 'tag_matching'
		end)
	end,
}
