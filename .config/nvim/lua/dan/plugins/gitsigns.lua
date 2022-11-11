return {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPost' },
	config = function()
		local gs = require 'gitsigns'
		gs.setup {
			on_attach = function(bufnr)
				local wk = require 'which-key'

				-- Navigation
				wk.register({
					[']c'] = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", 'Next hunk' },
					['[c'] = { "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", 'Previous hunk' },
				}, { expr = true, buffer = bufnr })

				wk.register({
					h = {
						name = 'Git hunk operations',
						s = { gs.stage_hunk, 'Stage hunk' },
						r = { gs.reset_hunk, 'Reset hunk' },
						S = { gs.stage_buffer, 'Stage buffer' },
						R = { gs.reset_buffer, 'Reset buffer' },
						u = { gs.undo_stage_hunk, 'Undo stage hunk' },
						p = { gs.preview_hunk, 'Preview hunk' },
						b = {
							function()
								gs.blame_line { full = true }
							end,
							'Blame line',
						},
						d = { gs.diffthis, 'Diff this' },
						D = { gs.diffthis '~', 'Diff this' },
					},
					t = {
						b = { gs.toggle_current_line_blame, 'Toggle current line blame (Gitsigns)' },
						d = { gs.toggle_deleted, 'Toggle deleted lines (Gitsigns)' },
					},
				}, { prefix = '<LEADER>', buffer = bufnr })

				wk.register({
					h = {
						name = 'Git hunk operations',
						s = { gs.stage_hunk, 'Stage hunk' },
						r = { gs.reset_hunk, 'Reset hunk' },
					},
				}, { mode = 'v', prefix = '<LEADER>', buffer = bufnr })

				wk.register({
					['ih'] = { ':<C-U>Gitsigns select_hunk<CR>', 'Select hunk' },
				}, { mode = 'o', buffer = bufnr })

				wk.register({
					['ih'] = { ':<C-U>Gitsigns select_hunk<CR>', 'Select hunk' },
				}, { mode = 'x', buffer = bufnr })
			end,
			yadm = {
				enable = true,
			},
		}
	end,
}
