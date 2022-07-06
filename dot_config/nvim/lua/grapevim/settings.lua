local M = {}

function M.load()
  local settings = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" },
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    foldmethod = "expr", -- treesitter based folding
    foldexpr = "nvim_treesitter#foldexpr()", -- treesitter based folding
    hidden = true, -- required to keep multiple buffers and open multiple buffers
    hlsearch = false, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set terminal gui colors (most terminals support this)
    timeoutlen = 250, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 300, -- faster completion
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    tabstop = 2, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    cursorlineopt = { "number" },
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- number column width
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    scrolloff = 10, -- keep cursor at the center of the screen vertically
    sidescrolloff = 10, -- keep cursor 8 chars away from the side of the screen
    background = "dark", -- always use dark colorscheme
  }

  vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
  vim.opt.shortmess:append "I" -- don't show the default intro message
  vim.opt.whichwrap:append "<,>,[,],h,l"
  vim.opt.fillchars = "eob: ," -- remove end of line tildes
  -- this is so that carets won't be printed in the status line when new windows area created
  vim.opt.fillchars = vim.opt.fillchars + "stl: " -- the last character is a non-breaking space. See https://en.wikipedia.org/wiki/Non-breaking_space. Type this using <C-k>NS

  for k, v in pairs(settings) do
    vim.opt[k] = v
  end

  -- map leader key
  vim.g.mapleader = " " -- Space is the leader key
end

return M
