return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "~/Notes/Personal",
        },
        {
          name = "work",
          path = "~/Notes/Work",
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "dailies",
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      templates = {
        folder = "templates",
      },

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

      ui = {
        -- disable ui options since we already have a plugin to render markdown
        enable = false,
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "RenderMarkdownUnchecked", order = 0 },
          ["x"] = { char = "", hl_group = "RenderMarkdownChecked", order = 1 },
          ["-"] = { char = "󰥔", hl_group = "RenderMarkdownTodo", order = 1 },
        },
      },
    })

    vim.keymap.set("n", "<leader>nn", "<cmd>ObsidianNew<cr>", { desc = "Create new note" })
    vim.keymap.set("n", "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Find a note" })
    vim.keymap.set("n", "<leader>nl", "<cmd>ObsidianBacklinks<cr>", { desc = "Backlinks to this note" })
    vim.keymap.set("n", "<leader>ns", "<cmd>ObsidianSearch<cr>", { desc = "Search notes in current workspace" })
    vim.keymap.set("n", "<leader>nw", "<cmd>ObsidianWorkspaceh<cr>", { desc = "Switch workspace" })
    vim.keymap.set("n", "<leader>nt", "<cmd>ObsidianTags<cr>", { desc = "Search tags" })
    vim.keymap.set("n", "<leader>nc", "<cmd>ObsidianToggleCheckbox<cr>", { desc = "Cycle through checkbox states" })
    vim.keymap.set({ "v" }, "<leader>nx", "<cmd>ObsidianExtractNote<cr>", { desc = "Extract selected to note" })
  end,
}
