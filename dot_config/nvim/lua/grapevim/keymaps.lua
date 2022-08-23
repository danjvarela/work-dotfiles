local keymaps = {
	["i"] = {
		-- 'jk' for quitting insert mode
		["jk"] = "<ESC>",
		-- move current line / block with Alt-j/k ala vscode.
		["<A-j>"] = "<Esc>:m .+1<CR>==gi",
		-- move current line / block with Alt-j/k ala vscode.
		["<A-k>"] = "<Esc>:m .-2<CR>==gi",
	},

	["n"] = {
		-- better window movement
		["<C-h>"] = "<C-w>h",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",

		-- navigate between buffers
		["L"] = ":BufferLineCycleNext<CR>",
		["H"] = ":BufferLineCyclePrev<CR>",
		["]b"] = ":BufferLineMoveNext<CR>",
		["[b"] = ":BufferLineMovePrev<CR>",

		-- move current line / block with alt-j/k a la vscode.
		["<a-j>"] = ":m .+1<cr>==",
		["<A-k>"] = ":m .-2<CR>==",

		-- save file
		["<C-s>"] = ":w<CR>",

		-- quit neovim
		["<C-q>"] = ":qall!<CR>",
		["<C-x>"] = ":bdelete!<CR>",
	},

	["v"] = {
		-- better indenting
		["<"] = "<gv",
		[">"] = ">gv",
	},

	["x"] = {
		-- move selected line / block of text in visual mode
		["K"] = ":move '<-2<CR>gv-gv",
		["J"] = ":move '>+1<CR>gv-gv",

		-- move current line / block with alt-j/k ala vscode.
		["<A-j>"] = ":m '>+1<CR>gv-gv",
		["<A-k>"] = ":m '<-2<CR>gv-gv",
	},
}

return keymaps
