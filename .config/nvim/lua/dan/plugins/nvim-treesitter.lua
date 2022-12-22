return {
	'nvim-treesitter/nvim-treesitter',
	run = function()
		local ts_update = require('nvim-treesitter.install').update { with_sync = true }
		ts_update()
	end,
	requires = {
		{ 'JoosepAlviste/nvim-ts-context-commentstring' },
		{ 'windwp/nvim-ts-autotag' },
		{ 'nvim-treesitter/nvim-treesitter-textobjects' },
	},
	config = function()
		require('nvim-treesitter.configs').setup {
			auto_install = true,
			highlight = {
				enable = true,
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
			autotag = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						['af'] = { query = '@function.outer', desc = 'Select outer function' },
						['if'] = { query = '@function.inner', desc = 'Select inner function' },
						['ac'] = { query = '@class.outer', desc = 'Select outer class' },
						['ic'] = { query = '@class.inner', desc = 'Select inner class' },
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						[']m'] = '@function.outer',
						[']]'] = { query = '@class.outer' },
					},
					goto_next_end = {
						[']M'] = '@function.outer',
						[']['] = '@class.outer',
					},
					goto_previous_start = {
						['[m'] = '@function.outer',
						['[['] = '@class.outer',
					},
					goto_previous_end = {
						['[M'] = '@function.outer',
						['[]'] = '@class.outer',
					},
				},
			},
		}
	end,
}
