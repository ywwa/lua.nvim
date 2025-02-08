local M = {}
local map = vim.keymap.set
local lspBuf = vim.lsp.buf

M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  map("n", "gD", lspBuf.declaration, opts "Go to declaration")
  map("n", "gd", lspBuf.definition, opts "Go to definition")
  map("n", "gi", lspBuf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", lspBuf.signature_help, opts "Show signature help")
  map("n", "<leader>D", lspBuf.type_definition, opts "Go to type definition")
  map({ "n", "v" }, "<leader>ca", lspBuf.code_action, opts "Code action")
  map("n", "gr", lspBuf.references, opts "Show references")
end

M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end

  -- if client.server_capabilities.signatureHelpProvider then
  --   require('lsp-overloads').setup(client, {})
  -- end
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
  resolveSupport = { properties = { "documentation", "detail", "additionalTextEdits" } },
}

M.diagnostic_config = function()
  local x = vim.diagnostic.severity
  vim.diagnostic.config {
    virtual_text = { prefix = "" },
    signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
    underline = true,
    float = { border = "single" },
  }
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end
end

return M
