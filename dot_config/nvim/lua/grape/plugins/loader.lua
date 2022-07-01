local M = {}

function M.load(plugins)
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    print "Packer installed. Close and reopen neovim"
  end

  local packer_present, packer = pcall(require, "packer")
  if not packer_present then
    print "Packer not installed. Try relaunching neovim"
    return
  end

  packer.init {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  packer.startup(function(use)
    for _, v in ipairs(plugins) do
      use(v)
    end

    if packer_bootstrap then
      require("packer").sync()
    end
  end)
end

return M
