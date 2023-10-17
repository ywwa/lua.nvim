---@type NvPluginSpec[]
return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("custom.plugins.configs.tools.trouble")
    end,
  },

  {
    "javiorfo/nvim-ship",
    ft = "ship",
    cmd = { "ShipCreate", "ShipCreateEnv" },
    dependencies = {
      "javiorfo/nvim-spinetta",
      "javiorfo/nvim-popcorn",
    },
    config = function()
      require("custom.plugins.configs.tools.ship")
    end,
  },

  {
    "Saimo/peek.nvim",
    ft = "markdown",
    keys = { "<leader>op", "<leader>pq" },
    build = "deno task --quiet build:fast",
    config = function()
      require("custom.plugins.configs.tools.peek")
    end,
  },

  {
    "vuki656/package-info.nvim",
    ft = { "json" },
    config = true,
  },

  {
    "mbbill/undotree",
    keys = { "<leader>tu" },
    cmd = { "UndotreeToggle" },
    config = function()
      require("core.utils").load_mappings("undotree")
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("custom.plugins.configs.tools.conform")
    end,
  },

  -- {
  --   "m4xshen/hardtime.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("hardtime").setup()
  --   end,
  -- },

  {
    "CRAG666/code_runner.nvim",
    config = true,
    event = "LspAttach",
  },
}
