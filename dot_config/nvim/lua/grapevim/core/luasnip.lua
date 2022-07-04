local M = {}

function M.setup()
  local luasnip_exists, luasnip_loader = pcall(require, "luasnip.loaders.from_vscode")
  if not luasnip_exists then
    return
  end
  luasnip_loader.lazy_load()
  -- snippets for rails
  require "luasnip".filetype_extend("ruby", { "rails" })
end

return M
