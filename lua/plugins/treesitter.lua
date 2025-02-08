return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "folke/ts-comments.nvim", opts = {} },
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "TSInstall",
    "TSBufEnable",
    "TSBufDisable",
    "TSModuleInfo",
  },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "luadoc",
      "vimdoc",
      "bash",
      "yaml",
      "regex",
      "markdown",
      "markdown_inline",
      "json",
      "jsonc",
      "css",
      "sql",
      "javascript",
      "jsdoc",
      "typescript",
      "tsx",
      "html",
    },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true, use_languagetree = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    vim.treesitter.language.register("markdown", "mdx")
  end,
}
