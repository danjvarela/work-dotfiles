local M = {}

function M.setup()
	vim.g.Hexokinase_highlighters = { "virtual" }
	vim.g.Hexokinase_optInPatterns = {
		"full_hex",
		"triple_hex",
		"rgb",
		"rgba",
		"hsl",
		"hsla",
	}
end

return M
