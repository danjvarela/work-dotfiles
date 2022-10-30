local ok, lspzero = pcall(require, "lsp-zero")
local icons_ok, icons = pcall(require, "dan.icons")

if not ok or not icons_ok then
	return
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lspzero.preset("recommended")

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
