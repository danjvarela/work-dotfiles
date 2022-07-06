local M = {}

---Gets the file name (including the extension) given the directory of the file
---@param file string The file directory string
---@return string
M.get_filename_from_dir = function(file)
  return file:match "^.+/(.+)$"
end

---Reloads neovim configuration
---Note that nvimtree is not reloaded.
M.reload_nvim = function()
  for name, _ in pairs(package.loaded) do
    if name:match "^grapevim" and name ~= "grape.plugins.settings.nvimtree" then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  print "Reloaded neovim"
end

---Checks if a table has a given value
---@param table table The table to check
---@param value string The key
---@return boolean
M.has_value = function(table, value)
  for _, v in pairs(table) do
    if v == value then return true end
  end
  return false
end

---Sets the colorscheme based on the wal colorscheme
---only applies to base16-edge and base16-everforest colorschemes
---@param default string The fallback colorscheme in case the current wal colorscheme is not supported
function M.set_colorscheme_from_wal(default)
  -- Get the current wal colorscheme from the wal cache
  local open = io.open
  local path = os.getenv("HOME") .. "/.cache/wal/last_used_theme"
  local file = open(path, "rb")
  if not file then return end
  local content = file:read("*a")
  file:close()

  -- Map of wal colorscheme and its correpsonding neovim colorscheme
  local colors = {
    ["base16-edge.json"] = "edge",
    ["base16-everforest.json"] = "everforest"
  }

  if colors[content] ~= nil then
    pcall(vim.cmd, "colorscheme " .. colors[content])
  else
    pcall(vim.cmd, "colorscheme " .. default)
  end
end

return M
