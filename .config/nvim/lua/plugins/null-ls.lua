return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.rubocop.with({
          args = { "--server", "--autocorrect", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
        }),
      },
    }
  end,
}
