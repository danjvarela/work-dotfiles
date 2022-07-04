local M = {}

function M.setup()
  local lualine_exists, lualine = pcall(require, "lualine")
  if not lualine_exists then
    return
  end

  local theme = "auto"
  local available_themes = { "everforest", "edge" }
  if require("grapevim.utils").has_value(available_themes, vim.g.colors_name) then
    theme = vim.g.colors_name
  end

  lualine.setup({
    options = {
      globalstatus = true,
      theme = theme
    },
    extensions = { "nvim-tree" }
  })
end

return M
