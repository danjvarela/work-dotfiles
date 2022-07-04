local M = {}

function M.setup()
  local nullls_exists, null_ls = pcall(require, "null-ls")
  if not nullls_exists then
    return
  end

  null_ls.setup {
    sources = {
      -- I don't need one yet. to be filled out
    },
  }
end

return M
