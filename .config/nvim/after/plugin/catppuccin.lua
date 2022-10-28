local ok, catppuccin = pcall(require, "catppuccin")

if not ok then
	return
end

catppuccin.setup({
	flavour = "mocha", -- mocha, macchiato, frappe, latte
	integrations = {
		cmp = true,
		treesitter = true,
		nvimtree = true,
		mason = true,
		gitsigns = true,
		telescope = true,
		which_key = true,
		barbar = true,
		lightspeed = true,
	},
})

vim.api.nvim_command("colorscheme catppuccin")
