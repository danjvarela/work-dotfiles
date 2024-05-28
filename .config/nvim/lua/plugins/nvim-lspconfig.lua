return {
  "neovim/nvim-lspconfig",
  opts = {
    -- make sure mason installs the server
    servers = {
      solargraph = {},
      tailwindcss = {
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "cx\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                { "className\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                { "classname\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                { "cn\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              },
            },
          },
        },
      }
    },
  }
}
