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

---Sets the colorscheme
---@param colorscheme string The name of the colorscheme
M.set_colorscheme = function(colorscheme)
  if colorscheme == "everforest" then
    vim.g.everforest_background = "hard"
    vim.g.everforest_transparent_background = 2
    vim.g.everforest_ui_contrast = "high"
  end
  vim.cmd("colorscheme "..colorscheme)
end

return M
