return {
	'ElPiloto/telescope-vimwiki.nvim',
	requires = {
		{ 'nvim-telescope/telescope.nvim' },
	},
  config = function()
    require('telescope').load_extension("vimwiki")
  end
}
