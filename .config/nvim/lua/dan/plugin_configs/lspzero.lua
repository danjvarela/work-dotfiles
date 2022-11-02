local ok, lspzero = pcall(require, "lsp-zero")
local icons_ok, icons = pcall(require, "dan.icons")

if not ok or not icons_ok then
	return
end

lspzero.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = "local",
	sign_icons = {
		error = icons.diagnostics.Error,
		warn = icons.diagnostics.Warning,
		hint = icons.diagnostics.Hint,
		info = icons.diagnostics.Information,
	},
})

lspzero.setup_nvim_cmp({
	formatting = {
		fields = { "kind", "abbr" },
		format = function(_, vim_item)
			vim_item.kind = icons.kind[vim_item.kind] or ""
			return vim_item
		end,
	},
})

lspzero.nvim_workspace({
	library = vim.api.nvim_get_runtime_file("", true),
})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			local clients = { ["null-ls"] = true, ["solargraph"] = true }
			return clients[client.name] ~= nil
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lspzero.on_attach(function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end)

lspzero.setup()
