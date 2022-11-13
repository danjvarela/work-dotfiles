return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	requires = {
		'nvim-lua/plenary.nvim',
		'kyazdani42/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	after = { 'barbar.nvim' },
	config = function()
		require('neo-tree').setup {
			filesystem = {
				window = {
					mappings = {
						['o'] = 'system_open',
					},
				},
				commands = {
					system_open = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.api.nvim_command('silent !open -g ' .. path)
					end,
				},
			},
			event_handlers = {
				{
					event = 'neo_tree_window_before_open',
					handler = function()
						require('bufferline.api').set_offset(require('neo-tree').config.window.width)
					end,
				},
				{
					event = 'neo_tree_window_after_close',
					handler = function()
						require('bufferline.api').set_offset(0)
					end,
				},
			},
			default_component_configs = {
				diagnostics = {
					symbols = {
						hint = '',
						info = '',
						warn = '',
						error = '',
					},
					highlights = {
						hint = 'DiagnosticSignHint',
						info = 'DiagnosticSignInfo',
						warn = 'DiagnosticSignWarn',
						error = 'DiagnosticSignError',
					},
				},
			},
		}
	end,
}
