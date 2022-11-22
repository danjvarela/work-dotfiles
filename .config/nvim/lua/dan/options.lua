local set = vim.opt
local g = vim.g

-- leader key
g.mapleader = ' '

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- wrap text by default
set.wrap = true
-- show line numbers
set.number = true
-- show relativenumbers
set.relativenumber = true
-- set tabs to 2 spaces
set.tabstop = 2
-- insert the `tabstop` number of spaces when hitting tab
set.expandtab = true
-- use the value of tabstop for autoindent, >>, and <<
set.shiftwidth = 0
-- set the cursor to block no matter what the mode is
set.guicursor = ''
-- use system clipboard
set.clipboard = 'unnamedplus'
-- disable swap files
set.swapfile = false
-- disable backup files
set.backup = false
-- for completions
set.completeopt = { 'menu', 'menuone', 'noselect' }
-- hide a buffer when abandoned
set.hidden = true
-- highlight searches
set.hlsearch = true
-- ignore cases when searching
set.ignorecase = true
-- enable mouse
set.mouse = 'a'
-- pop-up height
set.pumheight = 10
-- always show the tabline
set.showtabline = 1
-- smart casing
set.smartcase = true
-- autoindent
set.smartindent = true
-- force horizontal splits to split below
set.splitbelow = true
-- force vertical splits to split to the right
set.splitright = true
-- true color
set.termguicolors = true
-- undo
set.undodir = vim.fn.stdpath 'cache' .. '/undo'
set.undofile = true
-- disable cursorline
set.cursorline = false
-- show signcolumn
set.signcolumn = 'yes'
-- scroll when cursor is n lines away from the top/bottom
set.scrolloff = 9999
-- scroll when cursor is n lines away from the sides
set.sidescrolloff = 8
-- don't show current mode
set.showmode = false
-- don't wait long before mapping to complete
set.timeoutlen = 500
-- set nocompatible
set.compatible = false
