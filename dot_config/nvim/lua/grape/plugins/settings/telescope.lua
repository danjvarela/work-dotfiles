local M = {}

function M.setup()
  local telescope_exists, telescope = pcall(require, "telescope")
  if not telescope_exists then
    return
  end

  local config = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      layout_config = {
        width = 0.75,
        preview_cutoff = 120,
        horizontal = {
          preview_width = function(_, cols, _)
            if cols < 120 then
              return math.floor(cols * 0.5)
            end
            return math.floor(cols * 0.6)
          end,
          mirror = false,
        },
        vertical = { mirror = false },
      },
      set_env = { COLORTERM = "truecolor" },
    },
  }

  telescope.setup(config)
end

return M
