local M = {}

function M.setup()
  local nullls_exists, null_ls = pcall(require, "null-ls")
  if not nullls_exists then
    return
  end

  null_ls.setup {
    sources = {
      null_ls.builtins.formatting.prettier.with({
        disabled_filetypes = { "html", "javascript" }
      })
    },
  }
end

return M
