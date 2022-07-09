require("grapevim.settings").load()
require("grapevim.keybindings").load()

-- Load autocommands
require("grapevim.autocmds").load()

-- Set up plugins and their configs
require("grapevim.packer").initialize_packer()
require("grapevim.packer").load_plugins()

-- Set the colorscheme
local colorscheme = "edge"
pcall(vim.cmd, "colorscheme " .. colorscheme)
