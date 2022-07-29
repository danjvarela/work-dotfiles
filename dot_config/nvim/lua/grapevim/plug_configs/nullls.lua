local nullls_exists, nullls = pcall(require, "null-ls")
if not nullls_exists then
	return
end

local util = require("vim.lsp.util")
local formatting_callback = function(client, bufnr)
	vim.keymap.set("n", "<leader>bf", function()
		local params = util.make_formatting_params({})
		client.request("textDocument/formatting", params, nil, bufnr)
	end, { buffer = bufnr })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

nullls.setup({
	sources = {
		nullls.builtins.formatting.stylua,
		nullls.builtins.formatting.prettierd,
	},
	on_attach = function(client, bufnr)
		-- format on save
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
		-- format using a keymap
		formatting_callback(client, bufnr)
	end,
})
