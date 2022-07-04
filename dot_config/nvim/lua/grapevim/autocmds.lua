local M = {}

function M.load()
  -- Call PackerSync whenever the plugins table is saved
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    callback = function()
      package.loaded["grapevim.plugins"] = nil
      require("packer").startup(function(use)
        for _, v in pairs(require("grapevim.plugins")) do
          use(v)
        end
        require("packer").sync()
      end)
    end,
    group = vim.api.nvim_create_augroup("PluginSync", {})
  })

  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.html", "*.erb" },
    command = "EmmetInstall",
    group = vim.api.nvim_create_augroup("InstallEmmet", {})
  })
end

return M
