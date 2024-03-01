local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

---@diagnostic disable: different-requires
local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  -- "tsserver",
  "clangd",
  "emmet_language_server",
  "prismals",
  "marksman",
  "intelephense",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["lua_ls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,

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

lspconfig["marksman"].setup {
  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
    on_attach(client)
  end,
  capabilities = capabilities,
}

lspconfig["tailwindcss"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    tailwindCSS = {
      experemental = {
        classRegex = {
          -- "tw`([^`]*)", -- tw`...`
          -- "tw='([^']*)", -- <div tw="..." />
          -- "tw={`([^`}]*)", -- <div tw={"..."} />
          -- "tw\\.\\w+`([^`]*)", -- tw.xxx`...`
          -- "tw\\(.*?\\)`([^`]*)", -- tw(component)`...`
          -- "styled\\(.*?, '([^']*)'\\)",
          { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" },
        },
      },
    },
  },
}

lspconfig["vuels"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vue-language-server", "--stdio" },
  settings = {},
}
