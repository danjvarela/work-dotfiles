-- Disable autoformat
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Discard previous snippet when changing mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  once = true,
  callback = function()
    local work_directory = vim.env.WORK_DIRECTORY
    if work_directory and vim.fn.getcwd():find(work_directory, 1, true) then
      print("Setting obsidian workspace to work")
      vim.cmd("ObsidianWorkspace work")
    else
      print("Setting obsidian workspace to personal")
      vim.cmd("ObsidianWorkspace personal")
    end
  end,
})
