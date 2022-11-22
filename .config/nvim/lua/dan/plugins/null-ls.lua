return {
	'jose-elias-alvarez/null-ls.nvim',
	config = function()
		local null_ls = require 'null-ls'

		null_ls.setup {
			debug = true,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.erb_lint,
			},
		}
	end,
}
