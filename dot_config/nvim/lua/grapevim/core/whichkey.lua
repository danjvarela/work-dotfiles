local M = {}

function M.setup()
  local whichkey_exists, whichkey = pcall(require, "which-key")
  if not whichkey_exists then return end
  
  -- Configure which-key
  local wk_config = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 0, 0, 0, 0 }, -- no margin
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "center", -- align columns to the center
    },
  }
  whichkey.setup(wk_config)

  -- Normal mode mappings
  whichkey.register({
    ["f"] = { "<cmd>Telescope find_files<CR>", "Find Files" },
    ["e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
    ["/"] = { ":Commentary<CR>", "Comment line" },
    ["c"] = { "<cmd>ColorizerToggle<CR>", "Toggle Colorizer" },
    ["r"] = { require("grapevim.utils").reload_nvim, "Reload Neovim" },
    ["z"] = { "<cmd>LazyGit<CR>", "Lazygit" },
    t = {
      name = "Toggles",
      h = {
        function()
          vim.o.hlsearch = not vim.o.hlsearch
        end,
        "Toggle search highlight",
      },
      w = {
        function()
          vim.o.wrap = not vim.o.wrap
        end,
        "Toggle wrap",
      },
    },
    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    b = {
      name = "Buffers",
      ["]"] = { "<cmd>BufferLineMoveNext<CR>", "Move to the right" },
      ["["] = { "<cmd>BufferLineMovePrev<CR>", "Move to the left" },
      p = { "<cmd>BufferLineCyclePrev<CR>", "Select previous" },
      n = { "<cmd>BufferLineCycleNext<CR>", "Select next" },
      h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
      l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
      d = {
        name = "Delete",
        t = { ":BDelete this<CR>", "Close current" },
        n = { ":BDelete nameless<CR>", "Close all nameless" },
        a = { ":BDelete all<CR>", "Close All" },
        o = { ":BDelete other<CR>", "Close all except current" },
      },
      w = {
        name = "Wipeout (delete with force)",
        t = { ":BWipeout this<CR>", "Close current" },
        n = { ":BWipeout nameless<CR>", "Close all nameless" },
        a = { ":BWipeout all<CR>", "Close All" },
        o = { ":BWipeout other<CR>", "Close all except current" },
      },
    },
    g = {
      name = "Git",
      j = { require("gitsigns").next_hunk, "Next Hunk" },
      k = { require("gitsigns").prev_hunk, "Prev Hunk" },
      l = { require("gitsigns").blame_line, "Blame" },
      p = { require("gitsigns").preview_hunk, "Preview Hunk" },
      r = { require("gitsigns").reset_hunk, "Reset Hunk" },
      R = { require("gitsigns").reset_buffer, "Reset Buffer" },
      s = { require("gitsigns").stage_hunk, "Stage Hunk" },
      u = { require("gitsigns").undo_stage_hunk, "Undo Stage Hunk" },
    },
    d = {
      name = "Diagnostics",
      o = { vim.diagnostic.open_float, "Open" },
      n = { vim.diagnostic.goto_next, "Go to next" },
      p = { vim.diagnostic.goto_prev, "Go to prev" },
      s = { vim.diagnostic.setloclist, "Set loc list" },
    },
    s = {
      name = "Search",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      t = { "<cmd>Telescope live_grep<cr>", "Text" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      p = {
        function() require('telescope.builtin.internal').colorscheme({ enable_preview = true }) end,
        "Colorscheme with Preview",
      },
    },
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
      w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      j = { vim.diagnostic.goto_next, "Next Diagnostic" },
      k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
      l = { vim.lsp.codelens.run, "CodeLens Action" },
      q = { vim.diagnostic.setloclist, "Quickfix" },
      r = { vim.lsp.buf.rename, "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
      e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    },
    n = {
      name = "NNN",
      p = { "<cmd>NnnPicker<CR>", "NnnPicker" },
      e = { "<cmd>NnnExplorer<CR>", "NnnExplorer" }
    }
  }, { prefix = "<leader>" })

  -- visual mode mappings
  whichkey.register({
    ["/"] = { ":Commentary<CR>", "Comment selection" },
  }, { prefix = "<leader>", mode = "v" })
end

return M
