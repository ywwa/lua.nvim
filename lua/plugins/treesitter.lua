return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    {
      "numToStr/Comment.nvim",
      keys = {
        { "gcc", mode = "n", desc = "Comment toggle current line" },
        { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
        { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
        { "gbc", mode = "n", desc = "Comment toggle current block" },
        { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
        { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
      },
      opts = function()
        return {
          pre_hook = require(
            "ts_context_commentstring.integrations.comment_nvim"
          ).create_pre_hook(),
        }
      end,
      config = function(_, opts)
        require("Comment").setup(opts)
      end,
    },
  },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  opts = function()
    return require "plugins.config.treesitter"
  end,
  config = function(_, opts)
    local configs = require "nvim-treesitter.configs"
    configs.setup(opts)

    -- register mdx ft
    vim.filetype.add {
      extension = { mdx = "mdx" },
    }

    vim.treesitter.language.register("markdown", "mdx")

  end,
}
