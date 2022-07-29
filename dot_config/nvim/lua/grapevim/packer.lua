local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing Packer. Restart neovim after the installation")
	vim.cmd([[packadd packer.nvim]])
end

-- Make Packer use a floating window
require("packer").init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Load all the plugins
require("packer").startup(function(use)
	for _, v in ipairs(require("grapevim.plugins")) do
		use(v)
	end

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
