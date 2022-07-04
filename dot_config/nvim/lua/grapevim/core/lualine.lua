local M = {}

function M.setup()
  local lualine_exists, lualine = pcall(require, "lualine")
  if not lualine_exists then
    return
  end

  lualine.setup({
    options = {
      globalstatus = true,
    },
    extensions = { "nvim-tree" }
  })
end

return M
