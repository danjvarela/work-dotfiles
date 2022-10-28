local ok, lualine = pcall(require, "lualine")

if not ok then
	return
end

local get_attached_servers = function()
	local buf_clients = vim.lsp.buf_get_clients()

	if next(buf_clients) == nil then
		return "LS Inactive"
	end

	local buf_client_names = {}

	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end

	local unique_client_names = vim.fn.uniq(buf_client_names)
	local server_names = "[" .. table.concat(unique_client_names, ", ") .. "]"
	return server_names
end

lualine.setup({
	options = {
		theme = "catppuccin",
		globalstatus = true,
		section_separators = "",
		component_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { get_attached_servers, "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
