local map = vim.keymap.set
local M = {}

M.on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "goto declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "goto definition")
  map("n", "K", vim.lsp.buf.hover, opts "hover information")
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts "code action")
  map(
    "n",
    "<leader>T",
    vim.lsp.buf.type_definition,
    opts "goto type definition"
  )

  -- setup signature popup
  if client.server_capabilities.signatureHelpProvider then
    require("plugins.configs.lsp.signature").setup(client, bufnr)
  end
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.setup = function()
  local lspconfig = require "lspconfig"
  local servers = {
    "html",
    "cssls",
    "emmet_language_server",
    "prismals",
    "marksman",
    "intelephense",
  }
  require "plugins.config.lsp"

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      on_init = M.on_init,
    }
  end

  lspconfig.lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    on_init = M.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
end

return M
