-- reloads nvim configuration
local reload_nvim = function()
	for name, _ in pairs(package.loaded) do
		if name:match("^grapevim") and name ~= "grapevim.plugins_settings.nvimtree" then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	print("Reloaded neovim")
end

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
		["H"] = ":bprev<CR>",
		["L"] = ":bnext<CR>",

		-- move current line / block with alt-j/k a la vscode.
		["<a-j>"] = ":m .+1<cr>==",
		["<A-k>"] = ":m .-2<CR>==",

		-- save file
		["<C-s>"] = ":w<CR>",

		-- quit neovim
		["<C-q>"] = ":qall!<CR>",
		["<C-x>"] = ":bdelete!<CR>",

		["<leader>e"] = "<cmd>NvimTreeToggle<CR>",
		["<leader>r"] = reload_nvim,
		["<leader>ff"] = "<cmd>Telescope find_files<CR>",
		["<leader>fw"] = "<cmd>Telescope live_grep<CR>",
		["<leader>fb"] = "<cmd>Telescope buffers<CR>",
		["<leader>fk"] = "<cmd>Telescope keymaps<CR>",
		["<leader>tw"] = function()
			vim.o.wrap = not vim.o.wrap
		end,

		["<leader>th"] = function()
			vim.o.hlsearch = not vim.o.hlsearch
		end,
		["<leader>tc"] = "<cmd>HexokinaseToggle<CR>",
		["<leader>z"] = "<cmd>LazyGit<CR>",
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
