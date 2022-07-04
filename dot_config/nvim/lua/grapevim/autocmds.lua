local M = {}

function M.load()
  -- Call PackerSync whenever the plugins table is saved
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    callback = function()
      local file = vim.fn.expand("<afile>")
      vim.cmd("source " .. file)
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

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "html", "eruby" },
    command = "EmmetInstall",
    group = vim.api.nvim_create_augroup("InstallEmmet", {})
  })

  vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    pattern = {"*"},
    callback = function()
      local colorscheme = vim.fn.expand("<amatch>")
      local colors = {
        ["everforest"] = "base16-everforest",
        ["edge"] = "base16-edge",
      }

      if colors[colorscheme] ~= nil then
        os.execute("wal --theme " .. colors[colorscheme] .. " > /dev/null")
        require("grapevim.core.lualine").setup()
      end
    end,
    group = vim.api.nvim_create_augroup("ChangeWalScheme", {})
  })

  vim.api.nvim_create_autocmd({ "ColorschemePre" }, {
    pattern = { "*" },
    callback = function()
      local colorscheme = vim.fn.expand("<amatch>")

      if colorscheme == "everforest" then
        vim.g.everforest_background = "hard"
        vim.g.everforest_transparent_background = 2
        vim.g.everforest_ui_contrast = "high"
      end

      if colorscheme == "edge" then
        vim.g.edge_transparent_background = 2
      end
    end
  })
end

return M
