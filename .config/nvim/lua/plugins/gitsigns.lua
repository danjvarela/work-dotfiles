return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  dependencies = {
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        spec = {
          { "<leader>h", group = "hunk operations" },
        },
      },
    },
  },
}
