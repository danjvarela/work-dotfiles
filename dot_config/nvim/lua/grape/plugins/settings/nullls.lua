local M = {}

function M.setup()
  local nullls_exists, null_ls = pcall(require, "null-ls")
  if not nullls_exists then
    return
  end

  null_ls.setup {
    sources = {
      null_ls.builtins.diagnostics.eslint,

      null_ls.builtins.completion.spell,

      null_ls.builtins.diagnostics.erb_lint,
      null_ls.builtins.formatting.erb_lint,

      null_ls.builtins.diagnostics.zsh
    },
  }
end

return M
