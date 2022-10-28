local ok, nvimtree = pcall(require, "nvim-tree")

if not ok then
	return
end

nvimtree.setup({
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = true,
})
