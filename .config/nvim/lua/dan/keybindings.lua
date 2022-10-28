local map = require("dan.utils").map

-- jk for escape
map("i", "jk", "<ESC>")

-- move line up or down
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi")
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<A-j>", ":m '>+1<CR>gv-gv")
map("v", "<A-k>", ":m '<-2<CR>gv-gv")

-- indenting stuff
map("v", ">", ">gv")
map("v", "<", "<gv")

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- save
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", ":w<CR>")

-- quit all
map("n", "<C-q>", ":qall<CR>")
map("i", "<C-q>", ":qall<CR>")
map("v", "<C-q>", ":qall<CR>")

-- buffer management
local bufferline_exists, _ = pcall(require, "bufferline")
if bufferline_exists then
	map("n", "<S-h>", ":BufferPrevious<CR>")
	map("n", "<S-l>", ":BufferNext<CR>")
	map("n", "<A->>", ":BufferMoveNext<CR>")
	map("n", "<A-<>", ":BufferMovePrevious<CR>")
	map("n", "<A-1>", ":BufferGoto 1<CR>")
	map("n", "<A-2>", ":BufferGoto 2<CR>")
	map("n", "<A-3>", ":BufferGoto 3<CR>")
	map("n", "<A-4>", ":BufferGoto 4<CR>")
	map("n", "<A-5>", ":BufferGoto 5<CR>")
	map("n", "<A-6>", ":BufferGoto 6<CR>")
	map("n", "<A-7>", ":BufferGoto 7<CR>")
	map("n", "<A-8>", ":BufferGoto 8<CR>")
	map("n", "<A-9>", ":BufferGoto 9<CR>")
	map("n", "<A-0>", ":BufferLast<CR>")
end

-- Additional keybindings are on whichkey.lua
