----------------------------------------
-- GLOBAL SETTINGS --
----------------------------------------
local global_vars = require("grapevim.settings").global_vars
local global_opts = require("grapevim.settings").global_opts

vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")
-- this is so that carets won't be printed in the status line when new windows area created
vim.opt.fillchars = "eob: ,stl: " -- remove end of line tildes

for i, v in pairs(global_vars) do
	vim.g[i] = v
end

for i, v in pairs(global_opts) do
	vim.opt[i] = v
end

----------------------------------------
-- PLUGINS --
----------------------------------------
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing Packer. Restart neovim after the installation")
	vim.cmd([[packadd packer.nvim]])
end

-- Make Packer use a floating window
require("packer").init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Load all the plugins
require("packer").startup(function(use)
	for _, v in ipairs(require("grapevim.plugins")) do
		use(v)
	end

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

----------------------------------------
-- KEYMAPS --
----------------------------------------
local keymaps = require("grapevim.keymaps")
for mode, keybindings in pairs(keymaps) do
	for keys, action in pairs(keybindings) do
		vim.keymap.set(mode, keys, action)
	end
end

----------------------------------------
-- AUTOCOMMANDS --
----------------------------------------
require("grapevim.autocommands")

----------------------------------------
-- COLORSCHEME --
----------------------------------------
local colorscheme = "edge"
pcall(vim.cmd, "colorscheme " .. colorscheme)
