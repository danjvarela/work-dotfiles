-- improve startup time
pcall(require, 'impatient')

-- use nvim-notify for notifications
pcall(function()
	vim.notify = require 'notify'
end)

require 'dan.options'
require 'dan.plugins'
require 'dan.keymaps'
require 'dan.autocommands'

pcall(vim.cmd, 'silent colorscheme catppuccin')
