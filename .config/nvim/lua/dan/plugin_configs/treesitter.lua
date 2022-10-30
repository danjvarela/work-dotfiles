local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
	return
end

treesitter.setup({
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
