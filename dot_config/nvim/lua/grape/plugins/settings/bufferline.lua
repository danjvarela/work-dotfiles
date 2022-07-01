local M = {}

function M.setup()
  local bufferline_exists, bufferline = pcall(require, "bufferline")
  if not bufferline_exists then
    return
  end

  local config = {
    options = {
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "foreground",
          padding = 1,
        },
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "DiffviewFiles",
          text = "Diff View",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
          highlight = "PanelHeading",
        },
        {
          filetype = "packer",
          text = "Packer",
          highlight = "PanelHeading",
          padding = 1,
        },
      },
    },
  }

  bufferline.setup(config)
end

return M
