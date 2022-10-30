-- Ask to install a parser upon opening a new file type
-- See https://github.com/nvim-treesitter/nvim-treesitter/issues/2108#issuecomment-995069984
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/2108
local treesitter_exists, _ = pcall(require, "nvim-treesitter")
if treesitter_exists then
	local ask_install = {}
	local function ensure_treesitter_language_installed()
		local parsers = require("nvim-treesitter.parsers")
		local lang = parsers.get_buf_lang()
		if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) and ask_install[lang] ~= false then
			vim.schedule_wrap(function()
				vim.ui.select(
					{ "yes", "no" },
					{ prompt = "Install tree-sitter parsers for " .. lang .. "?" },
					function(item)
						if item == "yes" then
							vim.cmd("TSInstall " .. lang)
						elseif item == "no" then
							ask_install[lang] = false
						end
					end
				)
			end)()
		end
	end

	local tsInstallGroup = vim.api.nvim_create_augroup("InstallTSParser", {})
	vim.api.nvim_clear_autocmds({ group = tsInstallGroup })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "*" },
		group = tsInstallGroup,
		callback = ensure_treesitter_language_installed,
	})
end

-- Open folds upon opening a buffer
local foldGroup = vim.api.nvim_create_augroup("OpenFolds", {})
vim.api.nvim_clear_autocmds({ group = foldGroup })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	group = foldGroup,
	callback = function()
		vim.api.nvim_command("normal zR")
	end,
})

local yankGroup = vim.api.nvim_create_augroup("HighlightOnYank", {})
vim.api.nvim_clear_autocmds({ group = yankGroup })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	group = yankGroup,
	callback = function()
		vim.highlight.on_yank({
			higroup = (vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"),
			timeout = 100,
		})
	end,
})
