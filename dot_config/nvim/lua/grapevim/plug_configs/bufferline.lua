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
	},
})
