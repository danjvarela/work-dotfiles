-- Treesitter based folding
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
	group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
	callback = function()
		vim.opt.foldmethod = 'expr'
		vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
		-- open all folds
		vim.opt.foldenable = false
	end,
})

-- Notify when packer compile done
vim.api.nvim_create_autocmd({ 'User' }, {
	pattern = { 'PackerCompileDone' },
	group = vim.api.nvim_create_augroup('PackerCompileNotif', {}),
	callback = function()
		vim.notify 'Packer plugins compiled'
	end,
})
