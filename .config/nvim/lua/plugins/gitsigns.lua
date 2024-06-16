return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  dependencies = {
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        defaults = {
          ["<leader>h"] = { name = "+hunk operations" },
        },
      },
    },
  },
}
