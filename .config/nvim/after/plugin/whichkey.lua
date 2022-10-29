local ok, whichkey = pcall(require, "which-key")

if not ok then
	return
end

local reloadConfig = require("dan.utils").reloadConfig

whichkey.register({
	e = { ":NvimTreeToggle<CR>", "File Explorer" },
	r = { reloadConfig, "Reload Configuration" },
	S = { ":noautocmd w<CR>", "Save without formatting" },
	t = {
		name = "Toggle",
		w = {
			function()
				vim.opt.wrap = not vim.opt.wrap
			end,
			"Wrap",
		},
		t = { ":TransparentToggle<CR>", "Transparency" },
		h = {
			function()
				vim.opt.hlsearch = not vim.opt.hlsearch
			end,
			"Search highlight",
		},
		f = {
			function()
				vim.g.formatOnSave = not vim.g.formatOnSave
			end,
			"Format on Save",
		},
		i = { ":IlluminateToggle<CR>", "Illuminate" },
	},
	x = { ":BufferClose<CR>", "Close current buffer" },
	q = { ":BufferWipeout<CR>", "Close current buffer" },
	f = { ":Telescope find_files<CR>", "Find files" },
	b = {
		name = "Buffer Management",
		p = { ":BufferPin<CR>", "Pin" },
		x = { name = "Close Buffers" },
		["xa"] = { ":BufferCloseAllButCurrent<CR>", "Close all except current" },
		["xr"] = { ":BufferCloseBuffersRight<CR>", "Close all to the right" },
		["xl"] = { ":BufferCloseBuffersRight<CR>", "Close all to the right" },
	},
	s = {
		name = "Search",
		b = { ":Telescope git_branches<CR>", "Checkout branch" },
		c = { ":Telescope colorscheme<CR>", "Colorscheme" },
		f = { ":Telescope find_files<CR>", "Find File" },
		h = { ":Telescope help_tags<CR>", "Find Help" },
		H = { ":Telescope highlights<CR>", "Find highlight groups" },
		M = { ":Telescope man_pages<CR>", "Man Pages" },
		r = { ":Telescope oldfiles<CR>", "Open Recent File" },
		R = { ":Telescope resume<CR>", "Resume" },
		t = { ":Telescope live_grep<CR>", "Text" },
		k = { ":Telescope keymaps<CR>", "Keymaps" },
		C = { ":Telescope commands<CR>", "Commands" },
	},
	g = {
		name = "Git",
		g = { ":LazyGit<CR>", "Lazygit" },
		j = { ":lua require 'gitsigns'.next_hunk({navigation_message = false})<CR>", "Next Hunk" },
		k = { ":lua require 'gitsigns'.prev_hunk({navigation_message = false})<CR>", "Prev Hunk" },
		l = { ":lua require 'gitsigns'.blame_line()<CR>", "Blame" },
		p = { ":lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { ":lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		R = { ":lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		s = { ":lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = {
			":lua require 'gitsigns'.undo_stage_hunk()<CR>",
			"Undo Stage Hunk",
		},
		o = { ":Telescope git_status<CR>", "Open changed file" },
		b = { ":Telescope git_branches<CR>", "Checkout branch" },
		c = { ":Telescope git_commits<CR>", "Checkout commit" },
		C = {
			":Telescope git_bcommits<CR>",
			"Checkout commit(for current file)",
		},
		d = {
			":Gitsigns diffthis HEAD<CR>",
			"Git Diff",
		},
	},
}, { prefix = "<LEADER>" })
