return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    local nvim_tmux_nav = require("nvim-tmux-navigation")

    nvim_tmux_nav.setup({})
  end,
  keys = {
    { "<C-\\>", "<cmd>NvimTmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },

    { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", desc = "Got to the left pane" },

    { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", desc = "Got to the down pane" },

    { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", desc = "Got to the up pane" },

    { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Got to the right pane" },

    { "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>", desc = "Got to the next pane" },
  },
}
