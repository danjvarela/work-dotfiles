local files = vim.api.nvim_get_runtime_file("lua/grapevim/plug_configs/**/*.lua", true)
for _, v in pairs(files) do
	dofile(v)
end
