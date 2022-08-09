----------------------------------------
-- GLOBAL SETTINGS --
----------------------------------------
local global_vars = require("grapevim.settings").global_vars
local global_opts = require("grapevim.settings").global_opts

vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")
-- this is so that carets won't be printed in the status line when new windows area created
vim.opt.fillchars = "eob: ,stl: " -- remove end of line tildes, last character is non-breaking space <C-k>NS

for i, v in pairs(global_vars) do
	vim.g[i] = v
end

for i, v in pairs(global_opts) do
	vim.opt[i] = v
end

----------------------------------------
-- IMPROVE STARTUP TIME --
----------------------------------------
pcall(require, "impatient")

----------------------------------------
-- PLUGINS --
----------------------------------------
pcall(require, "grapevim.packer")

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
vim.g.tokyonight_style = "night"
-- vim.g.everforest_background = "hard"
local colorscheme = "tokyonight"
pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.cmd([[
  let s:configuration = edge#get_configuration()
  let s:palette = edge#get_palette(s:configuration.style, s:configuration.dim_foreground, s:configuration.colors_override)
  call edge#highlight('CursorLineNr', s:palette.purple, s:palette.none, "bold")
]])
