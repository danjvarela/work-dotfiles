-- set the colorscheme base on the current wal theme
-- this will only work for the default wal base16 colorschemes

local lines = {}
for line in io.lines(vim.env.HOME .. "/.cache/wal/last_used_theme") do
	lines[#lines + 1] = line
end
local colorscheme = string.gsub(lines[1], ".json", "")

if string.find(colorscheme, "gruvbox") then
	local colormap = {
		["base16-gruvbox-hard"] = "base16-gruvbox-dark-hard",
		["base16-gruvbox-pale"] = "base16-gruvbox-dark-pale",
		["base16-gruvbox-soft"] = "base16-gruvbox-dark-soft",
		["base16-gruvbox-medium"] = "base16-gruvbox-dark-medium",
	}
	colorscheme = colormap[colorscheme]
elseif colorscheme == "darktooth" then
	colorscheme = "base16-darktooth"
end

pcall(vim.cmd, "colorscheme " .. colorscheme)
