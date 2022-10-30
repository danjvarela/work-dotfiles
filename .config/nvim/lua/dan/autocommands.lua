-- Open folds upon opening a buffer
local foldGroup = vim.api.nvim_create_augroup("OpenFolds", {})
vim.api.nvim_clear_autocmds({ group = foldGroup })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	group = foldGroup,
	callback = function()
		vim.api.nvim_command("normal zR")
	end,
})

local yankGroup = vim.api.nvim_create_augroup("HighlightOnYank", {})
vim.api.nvim_clear_autocmds({ group = yankGroup })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	group = yankGroup,
	callback = function()
		vim.highlight.on_yank({
			higroup = (vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"),
			timeout = 100,
		})
	end,
})
