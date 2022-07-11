local M = {}

function M.diagnostic_setup()
  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  sign({ name = 'DiagnosticSignError', text = '✘' })
  sign({ name = 'DiagnosticSignWarn', text = '▲' })
  sign({ name = 'DiagnosticSignHint', text = '⚑' })
  sign({ name = 'DiagnosticSignInfo', text = '' })

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })
end

M.mappings = {
  D = { function() vim.lsp.buf.declaration() end, "Lsp: Declaration" },
  d = { function() vim.lsp.buf.definition() end, "Lsp: Definition" },
  h = { function() vim.lsp.buf.hover() end, "Lsp: Hover" },
  i = { function() vim.lsp.buf.implementation() end, "Lsp: Implementation" },
  s = { function() vim.lsp.buf.signature_help() end, "Lsp: Signature help" },
  t = { function() vim.lsp.buf.type_definition() end, "Lsp: Type definition" },
  R = { function() vim.lsp.buf.rename() end, "Lsp: Rename" },
  a = { function() vim.lsp.buf.code_action() end, "Lsp: Code action" },
  r = { function() vim.lsp.buf.references() end, "Lsp: References" },
  F = {
    function()
      vim.lsp.buf.formatting_sync()
      vim.cmd("write!")
      vim.cmd("edit")
    end,
    "Lsp: Formatting"
  },
}

function M.setup()
  local lspconfig_exists, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_exists then
    return
  end

  local lsp_installer = require "nvim-lsp-installer"

  -- setup lsp installer before setting up the servers
  lsp_installer.setup({
    ensure_installed = { "sumneko_lua", "solargraph", "tsserver", "html", "jsonls" }
  })

  -- configure how diagnostics are displayed
  M.diagnostic_setup()

  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local wk = require("which-key")

    wk.register(M.mappings, { prefix = "g", buffer = bufnr })

    -- Delegate all formatting functions to null ls
    client.resolved_capabilities.document_formatting = false
  end

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- Configure the servers here

  -- sumneko lua config to work with neovim init.lua and plugins
  local luadev = require("lua-dev").setup({
    lspconfig = {
      on_attach = on_attach,
      capabilities = capabilities
    }
  })

  local installed_servers = require("nvim-lsp-installer.servers").get_installed_server_names()

  for _, v in ipairs(installed_servers) do
    if v == "sumneko_lua" then
      lspconfig[v].setup(luadev)
    else
      lspconfig[v].setup({
        on_attach = on_attach,
        capabilities = capabilities
      })
    end
  end

  -- add borders to signature help
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
    border = "rounded"
  }
  )

  -- add borders to hover
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
    border = "rounded"
  }
  )

end

return M
