return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "prettierd")
    table.insert(opts.ensure_installed, "standardrb")
    table.insert(opts.ensure_installed, "stylua")
  end,
}
