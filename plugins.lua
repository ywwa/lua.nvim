local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },

  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      config = function()
        require("plenary")
      end,
    },
    config = function()
      require("rest-nvim").setup({
      result_split_horizontal = false,
      result_split_in_place   = false,
      skip_ssl_verification   = false,
      encode_url              =  true,
      highlight = {
        enabled = true,
        timeout = 150
      },
      result = {
        show_url = true,
        show_http_info = true,
        show_headers = true,

        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end,
        }
      },

      jump_to_request = false,
      env_file = ".rest.env",
      custom_dynamic_variables = {},
      yank_dry_run = true
    })
    end,
    lazy = false
  },

  {
    "andweeb/presence.nvim",
    lazy = false,
    config = function()
      require "custom.configs.presence"
    end,
  },

  -- {
  --   "vimpostor/vim-tpipeline",
  --   lazy = false,
  -- },

  {
    "toppair/peek.nvim",
    lazy = false,
    build = "deno task --quiet build:fast",
    config = function()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = true,
        syntax = true,
        theme = 'dark',
        update_on_change = true,
        app = 'webview',
        filetype={ 'markdown' },
        throttle_at = 200000,
        throttle_time = 'auto'
      })
    end,
  }

}

return plugins
