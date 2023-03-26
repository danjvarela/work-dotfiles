return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    require("nvim-treesitter.install").prefer_git = true
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
    end
  end,
}
