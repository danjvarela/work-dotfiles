local M = {}

function M.load()
  local keymaps = {
    ["i"] = {
      -- 'jk' for quitting insert mode
      ["jk"] = "<ESC>",
      -- Move current line / block with Alt-j/k ala vscode.
      ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
      -- Move current line / block with Alt-j/k ala vscode.
      ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    },

    ["n"] = {
      -- Better window movement
      ["<C-h>"] = "<C-w>h",
      ["<C-j>"] = "<C-w>j",
      ["<C-k>"] = "<C-w>k",
      ["<C-l>"] = "<C-w>l",

      -- Cycle between open buyffers
      ["<S-h>"] = ":BufferLineCyclePrev<CR>",
      ["<S-l>"] = ":BufferLineCycleNext<CR>",
      ["m]"] = ":BufferLineMoveNext<CR>",
      ["m["] = ":BufferLineMovePrev<CR>",

      -- Move current line / block with Alt-j/k a la vscode.
      ["<A-j>"] = ":m .+1<CR>==",
      ["<A-k>"] = ":m .-2<CR>==",

      -- Save file
      ["<C-s>"] = ":w<CR>",

      -- Quit neovim
      ["<C-q>"] = ":qall!<CR>"
    },

    ["v"] = {
      -- Better indenting
      ["<"] = "<gv",
      [">"] = ">gv",
    },

    ["x"] = {
      -- Move selected line / block of text in visual mode
      ["K"] = ":move '<-2<CR>gv-gv",
      ["J"] = ":move '>+1<CR>gv-gv",

      -- Move current line / block with Alt-j/k ala vscode.
      ["<A-j>"] = ":m '>+1<CR>gv-gv",
      ["<A-k>"] = ":m '<-2<CR>gv-gv",
    },
  }

  for mode, keybindings in pairs(keymaps) do
    for keys, action in pairs(keybindings) do
      vim.keymap.set(mode, keys, action)
    end
  end
end

return M
