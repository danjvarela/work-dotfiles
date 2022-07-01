local M = {}

function M.setup()
  local nvimtree_exists, nvim_tree = pcall(require, "nvim-tree")

  if not nvimtree_exists then
    return
  end

  nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    open_on_setup_file = false,
    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor = true,
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    filesystem_watchers = {
      enable = true,
    },
    renderer = {
      highlight_git = true,
      highlight_opened_files = "all",
      icons = {
        glyphs = {
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
        },
      },
    },
  }
end

return M
