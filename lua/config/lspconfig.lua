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

local function getTypescriptServer()
  local g = vim.fs.joinpath(vim.fn.getenv "VOLTA_HOME", "typescript-language-server")
  local l = vim.fs.joinpath(vim.fn.getcwd(), "node_modules/typescript/lib/tsserver.js")

  if vim.fn.filereadable(l) == 0 then
    if vim.fn.filereadable(g) == 0 then
      return nil
    end
    return g
  else
    return l
  end
end

require("typescript-tools").setup {
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },

  on_init = lsp.on_init,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,

  settings = {
    tsserver_path = getTypescriptServer(),
  },
}
