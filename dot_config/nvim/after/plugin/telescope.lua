local telescope_exists, telescope = pcall(require, "telescope")
if not telescope_exists then
	return
end

telescope.setup({
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			previewer = false,
		},
	},
})
