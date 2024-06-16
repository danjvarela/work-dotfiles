return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies = {
    "mfussenegger/nvim-dap",
    {
      "microsoft/vscode-js-debug",
      -- After install, build it and rename the dist directory to out
      build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      version = "1.*",
    },
  },
  config = function()
    require("dap-vscode-js").setup({
      -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"), -- Path to vscode-js-debug installation.
      -- debugger_cmd = { vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug-adapter") }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
      log_file_path = vim.fn.resolve(vim.fn.stdpath("cache") .. "/dap_vscode_js.log"), -- Path for file logging
      log_file_level = 1, -- Logging level for output to file. Set to false to disable file logging.
      log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
    })

    for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
      require("dap").configurations[language] = {
        -- defaults
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },

        {
          name = "Next.js: debug client-side",
          type = "pwa-chrome",
          request = "launch",
          url = "http://localhost:3000",
          port = 9230,
        },
        {
          name = "Next.js: debug server-side",
          type = "node-terminal",
          request = "launch",
          command = "npm run dev",
        },
        {
          name = "Next.js: debug full stack",
          type = "node-terminal",
          request = "launch",
          command = "npm run dev",
          serverReadyAction = {
            pattern = "- Local:.+(https?://.+)",
            uriFormat = "%s",
            action = "debugWithChrome",
          },
        },
        {
          name = "Next.js: debug server-side",
          type = "pwa-node",
          request = "launch",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "pnpm",
          runtimeArgs = { "dev" },
          sourceMaps = true,
        },
      }
    end
  end,
}
