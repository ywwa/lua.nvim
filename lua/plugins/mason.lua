return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup { ensure_installed = { "lua_ls" } }
  end,
}
