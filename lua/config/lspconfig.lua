local lspconfig = require "lspconfig"
local lsp = require "utils.lsp"

local servers = {
  "docker_compose_language_service",
  "dockerls",
  "emmet_language_server",
  "html",
  "marksman",
  "mdx_analyzer",
  "tailwindcss",
}

lsp.diagnostic_config()

for _, server in ipairs(servers) do
  lspconfig[server].setup { on_init = lsp.on_init, capabilities = lsp.capabilities, on_attach = lsp.on_attach }
end

lspconfig.lua_ls.setup {
  on_init = lsp.on_init,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim", "jit" } },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig.eslint.setup {
  on_init = lsp.on_init,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,

  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
  },
}

local function custom_on_attach(client, bufnr)
  local eslint_active = false
  for _, existing_client in ipairs(vim.lsp.get_clients { bufnr = bufnr }) do
    if existing_client.name == "eslint" then
      eslint_active = true
      break
    end
  end

  local filetype = vim.bo[bufnr].filetype
  if eslint_active and (filetype == "javascript" or filetype == "javascriptreact") then
    client.stop()
    return
  end

  if lsp.on_attach then
    lsp.on_attach(client, bufnr)
  end
end

local function get_local_tsserver_path()
  local local_path = vim.fn.getcwd() .. "/node_modules/typescript/lib/tsserver.js"
  if vim.fn.filereadable(local_path) == 1 then
    return local_path
  end

  local volta_tsserver = vim.fn.getenv "VOLTA_HOME" .. "/tools/image/packages/typescript/bin/tsserver"
  if vim.fn.filereadable(volta_tsserver) == 1 then
    return volta_tsserver
  end

  return nil
end

local tsserver_path = get_local_tsserver_path()

require("typescript-tools").setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  on_init = lsp.on_init,
  capabilities = lsp.capabilities,
  on_attach = custom_on_attach,
  settings = {
    tsserver_path = tsserver_path,
  },
}
