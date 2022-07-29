----------------------------------------
-- LSP DEFAULT CONFIG --
----------------------------------------
local lspconfig_exists, lspconfig = pcall(require, "lspconfig")
if not lspconfig_exists then
	return
end

local lsp_defaults = {
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client, bufnr)
		vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
		-- remove all formatting capabilities. null-ls will do the formatting
		client.resolved_capabilities.document_formatting = false
	end,
}

lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)

----------------------------------------
-- LUA --
----------------------------------------
local luadev_exists, luadev = pcall(require, "lua-dev")
if luadev_exists then
	lspconfig.sumneko_lua.setup(luadev.setup({}))
end

----------------------------------------
-- OTHER SERVERS --
----------------------------------------
local servers = { "html", "cssls", "jsonls", "tsserver", "pyright", "yamlls" }

for _, server in pairs(servers) do
	lspconfig[server].setup({})
end
