local M = {}

-- gets the file name given the directory of the file
-- @param file - the file directory.
-- returns the filename
M.get_filename = function(file)
  return file:match "^.+/(.+)$"
end

-- reloads neovim
M.reload_nvim = function()
  for name, _ in pairs(package.loaded) do
    if name:match "^grape" and name ~= "grape.plugins.settings.nvimtree" then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  print "Reloaded neovim"
end

return M
