require("grape.settings").load()
require("grape.keybindings").load()
require("grape.plugins").load()

-- set colorscheme after loading plugins
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
pcall(vim.cmd, "colorscheme tokyonight")

