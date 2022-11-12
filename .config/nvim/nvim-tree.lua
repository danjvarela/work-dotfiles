return {
	'nvim-tree/nvim-tree.lua',
	requires = {
		'nvim-tree/nvim-web-devicons',
	},
	tag = 'nightly',
	config = function()
		require('nvim-tree').setup {
			disable_netrw = true,
			hijack_cursor = true,
			diagnostics = {
				enable = true,
			},
			view = {
				centralize_selection = true,
			},
			renderer = {
				group_empty = true,
				indent_markers = {
					enable = true,
				},
			},
			trash = {
				cmd = 'trash -v',
			},
		}
	end,
}
