local bufferline_exists, bufferline = pcall(require, "bufferline")
if not bufferline_exists then
	return
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		color_icons = true,
		show_buffer_icons = false,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		persist_buffer_sort = true,
	},
})
