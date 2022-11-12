local fn = vim.fn

local ensure_packer = function()
	local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- get the filenames of all lua files inside lua/dan/plugins except init.lua
local plugin_filenames = fn.readdir(fn.stdpath 'config' .. '/lua/dan/plugins/', function(filename)
	return filename:match '.lua$' and filename ~= 'init.lua'
end)
-- transform the filenames into dan.plugins.<filename without the .lua extension>
local plugin_modules = fn.map(plugin_filenames, function(_, val)
	return 'dan.plugins.' .. fn.trim(val, '.lua', 2)
end)

return require('packer').startup {
	function(use)
		use 'wbthomason/packer.nvim'

		for _, module in pairs(plugin_modules) do
			-- use(require("dan.plugins.<module>"))
			use(require(module))
		end

		if packer_bootstrap then
			require('packer').sync()
		end
	end,
	config = {
		display = {
			open_fn = require('packer.util').float,
		},
	},
}
