local whichkey_exists, whichkey = pcall(require, "which-key")
if not whichkey_exists then
	return
end

whichkey.setup({
	window = {
		border = "double", -- none, single, double, shadow
	},
	layout = {
		align = "center", -- align columns left, center or right
		spacing = 5,
	},
})

-- reloads nvim configuration
local reload_nvim = function()
	-- unload all modules inside grapevim except nvimtree
	for name, _ in pairs(package.loaded) do
		if name:match("^grapevim") and name ~= "grapevim.plugins_settings.nvimtree" then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)

	-- reload plugin configurations
	local plug_configs = vim.api.nvim_get_runtime_file("lua/grapevim/plug_configs/**/*.lua", true)
	for _, v in pairs(plug_configs) do
		dofile(v)
	end

	print("Reloaded neovim")
end

whichkey.register({
	["e"] = { "<cmd>NvimTreeToggle<CR>", "File explorer" },
	["r"] = { reload_nvim, "Reload Nvim" },
	["f"] = { name = "find" },
	["ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
	["fw"] = { "<cmd>Telescope live_grep<CR>", "Find word" },
	["fb"] = { "<cmd>Telescope buffers<CR>", "Find buffer" },
	["fk"] = { "<cmd>Telescope keymaps<CR>", "Find keymap" },
	["t"] = { name = "Toggles" },
	["tw"] = {
		function()
			vim.o.wrap = not vim.o.wrap
		end,
		"Toggle wrap",
	},
	["th"] = {
		function()
			vim.o.hlsearch = not vim.o.hlsearch
		end,
		"Toggle hlsearch",
	},
	["tc"] = { "<cmd>HexokinaseToggle<CR>", "Toggle Hexokinase" },
	["z"] = { "<cmd>LazyGit<CR>", "Lazygit" },
}, { prefix = "<leader>" })
