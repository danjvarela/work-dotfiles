return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "biome", "prettierd", "prettier" } },
      javascriptreact = { { "biome", "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      json = { { "biome", "prettierd", "prettier" } },
      jsonc = { { "biome", "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      typescript = { { "biome", "prettierd", "prettier" } },
      typescriptreact = { { "biome", "prettierd", "prettier" } },
      ["typescript.tsx"] = { { "biome", "prettierd", "prettier" } },
    },
  },
}
