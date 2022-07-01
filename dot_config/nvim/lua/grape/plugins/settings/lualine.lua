local M = {}

function M.setup()
  local lualine_exists, lualine = pcall(require, "lualine")
  if not lualine_exists then
    return
  end

  local config = {
    options = {
      disabled_filetypes = { "NvimTree" },
    },
  }

  lualine.setup(config)
end

return M
