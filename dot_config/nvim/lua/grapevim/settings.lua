local M = {}

M.global_vars = {
	mapleader = " ",
}

M.global_opts = {
	clipboard = "unnamedplus", -- allow neovim to access system clipboard
	backup = false, -- don't create a backup file
	cmdheight = 1, -- command line height
	completeopt = { "menu", "menuone", "noselect" }, -- for completions
	conceallevel = 0, -- show backticks in markdown files
	foldmethod = "expr", -- treesitter based folding
	foldexpr = "nvim_treesitter#foldexpr()", -- treesitter based folding
	hidden = true, -- hide abandoned buffer
	hlsearch = false, -- don't highlight matches on previous search
	ignorecase = true, -- case insensitive searching
	mouse = "a", -- utilize mouse
	pumheight = 10, -- pop up menu height
	showtabline = 2, -- always show tab line
	smartcase = true, -- override ignorecase when searching with uppercase characters
	smartindent = true, -- smart indent when starting a new line
	splitbelow = true, -- horizontal splits go below current buffer
	splitright = true, -- vertical splits go to the right of current buffer
	swapfile = false, -- don't create swap files
	termguicolors = true, -- use true color
	timeoutlen = 300, -- time to wait for mapped sequence to complete
	undofile = false, -- don't persist undo
	updatetime = 300, -- faster completion
	writebackup = false, -- allow file to be edited even when opened in another program
	expandtab = true, -- convert tab to spaces
	shiftwidth = 2, -- number of spaces for each step of autoindent
	tabstop = 2, -- 1 tab = 2 spaces
	cursorline = true, -- highlight current line
	cursorlineopt = { "number" }, -- only highlight the number of the current line
	number = true, -- show line numbers
	relativenumber = true, -- show line numbers relative to current line
	numberwidth = 4, -- width of numbercolumn
	signcolumn = "yes", -- always show sign column
	wrap = false, -- don't wrap long lines
	scrolloff = 10, -- distance between cursor and the top and bottom of the screen
	sidescrolloff = 10, -- distance between cursor and the side of the screen
	foldlevelstart = 99, -- open all folds when opening buffer
	guicursor = "n-v-c-i:block", -- block cursor in all modes
	showmode = false, -- don't show current mode. lualine plugin will take care of it.
}

return M
