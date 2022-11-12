local M = {}

-- sets a keymap
function M.map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts or { noremap = true, silent = true })
end

function M.reload()
	require('plenary.async').run(function()
		-- close nvim-tree
		require('plenary.reload').reload_module('dan', true)
		dofile(vim.env.MYVIMRC)
		require('packer').compile()
	end, function()
		vim.notify('Neovim configuration reloaded', vim.log.levels.INFO)
	end)
end

return M
