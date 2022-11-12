return {
	'catppuccin/nvim',
	as = 'catppuccin',
	config = function()
		require('catppuccin').setup {
			flavour = 'mocha',
			dim_inactive = {
				enabled = true,
			},
			integrations = {
				neotree = true,
				which_key = true,
				treesitter = true,
				notify = true,
				barbar = true,
				lightspeed = true,
				mason = true,
				cmp = true,
				telescope = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { 'italic' },
						hints = { 'italic' },
						warnings = { 'italic' },
						information = { 'italic' },
					},
					underlines = {
						errors = { 'underline' },
						hints = { 'underline' },
						warnings = { 'underline' },
						information = { 'underline' },
					},
				},
			},
		}
	end,
}
