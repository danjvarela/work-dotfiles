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

return M
