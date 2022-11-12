return {
	'windwp/nvim-autopairs',
	event = { 'BufReadPost' },
	config = function()
		local autopairs = require 'nvim-autopairs'
		local Rule = require 'nvim-autopairs.rule'

		autopairs.setup {
			check_ts = true,
		}

		autopairs.add_rule(Rule('<%', '', 'eruby'):replace_endpair(function()
			return ' %>'
		end))
	end,
}
