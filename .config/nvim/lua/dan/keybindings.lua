local map = require("dan.utils").map

-- jk for escape
map("i" ,"jk", "<ESC>")

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


-- to be transferred to whichkey
map("n", "<LEADER>e", ":NvimTreeToggle<CR>")
