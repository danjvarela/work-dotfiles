local ok, nvimtree = pcall(require, "nvim-tree")
local bufferline_ok, _ = pcall(require, "bufferline")
local icons_ok, icons = pcall(require, "dan.icons")

if not ok or not bufferline_ok or not icons_ok then
	return
end

nvimtree.setup({
	disable_netrw = true,
	hijack_cursor = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	ignore_ft_on_setup = {
		"packer",
		"mason",
	},
	auto_reload_on_write = true,
	hijack_directories = {
		enable = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = icons.diagnostics.BoldHint,
			info = icons.diagnostics.BoldInformation,
			warning = icons.diagnostics.BoldWarning,
			error = icons.diagnostics.BoldError,
		},
	},
	update_focused_file = {
		enable = true,
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 200,
	},
	renderer = {
		icons = {
			glyphs = {
				git = {
					deleted = icons.git.FileDeleted,
					ignored = icons.git.FileIgnored,
					renamed = icons.git.FileRenamed,
					staged = icons.git.FileStaged,
					unmerged = icons.git.FileUnmerged,
					unstaged = icons.git.FileUnstaged,
					untracked = icons.git.FileUntracked,
				},
			},
		},
		highlight_git = true,
		group_empty = true,
	},
	filters = {
		exclude = { "node_modules", "\\.cache" },
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		open_file = {
			resize_window = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "mason" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
})

local nvim_tree_events = require("nvim-tree.events")
local bufferline_api = require("bufferline.api")

local function get_tree_size()
	return require("nvim-tree.view").View.width
end

nvim_tree_events.subscribe("TreeOpen", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("Resize", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("TreeClose", function()
	bufferline_api.set_offset(0)
end)
