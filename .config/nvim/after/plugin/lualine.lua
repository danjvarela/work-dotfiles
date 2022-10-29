local ok, lualine = pcall(require, "lualine")
local nls_ok, nls = pcall(require, "null-ls")

if not ok or not nls_ok then
	return
end

local function list_registered_providers_names(filetype)
	local s = require("null-ls.sources")
	local available_sources = s.get_available(filetype)
	local registered = {}
	for _, source in ipairs(available_sources) do
		for method in pairs(source.methods) do
			registered[method] = registered[method] or {}
			table.insert(registered[method], source.name)
		end
	end
	return registered
end

local get_attached_servers = function()
	local buf_clients = vim.lsp.buf_get_clients()
	local ft = vim.bo.filetype

	if next(buf_clients) == nil then
		return "LS Inactive"
	end

	local buf_client_names = {}
	local methods = {
		nls.methods.HOVER,
		nls.methods.FORMATTING,
		nls.methods.DIAGNOSTICS,
	}

	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end

	for _, method in pairs(methods) do
		local providers = list_registered_providers_names(ft)
		local provider_names = providers[method] or {}
		vim.list_extend(buf_client_names, provider_names)
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
