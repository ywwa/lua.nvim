local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Replace core plugins -----------------------------------------------------

  {
    "NvChad/ui",
    enabled = false,
  },

  {
    "yuukilla/nvchad-ui",
    branch = "prettify_str",
    lazy = false,
    config = function()
      require "nvchad_ui"
    end,
  },

  -- Override plugin definition options ---------------------------------------

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- Override plugin configs --------------------------------------------------

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag" },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-vsnip",
      -- "delphinus/cmp-ctags",
      "ray-x/cmp-treesitter",
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    opts = overrides.cmp,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  -- User Interface -----------------------------------------------------------
  -- {
  --   "code-biscuits/nvim-biscuits",
  --   event = "BufRead",
  --   config = function()
  --     require "custom.configs.external.biscuits"
  --   end,
  -- },

  {
    "anuvyklack/pretty-fold.nvim",
    event = "BufWinEnter",
    dependencies = {
      {
        "anuvyklack/fold-preview.nvim",
        dependencies = {
          "anuvyklack/keymap-amend.nvim",
        },
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = function()
      require "custom.configs.external.pretty-fold"
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("custom.configs.external.nvim-ufo").statuscolSetup()
        end,
      },
    },
    event = "BufReadPost",
    keys = require("custom.configs.external.nvim-ufo").ufoKeys,
    config = function()
      require("custom.configs.external.nvim-ufo").ufoSetup()
    end,
  },

  {
    "lukas-reineke/virt-column.nvim",
    event = "VeryLazy",
    config = function()
      require("virt-column").setup {
        char = "┃",
      }
    end,
  },

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup {
        mappings = {
          "<C-u>",
          "<C-d>",
        },
      }
    end,
  },

  {
    "Aasim-A/scrollEOF.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("scrollEOF").setup {
        insert_mode = true,
      }
    end,
  },

  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    branch = "v2",
    config = function()
      require("custom.configs.external.neodim").setup()
    end,
  },

  {
    "andreadev-it/shade.nvim",
    keys = "<Bslash>",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.external.zenmode"
    end,
  },

  {
    "danilamihailov/beacon.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.external.beacon"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "custom.configs.external.lspsaga"
    end,
  },

  {
    "aserowy/tmux.nvim",
    keys = require("custom.configs.external.tmux").keys,
    config = function()
      require("custom.configs.external.tmux").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("custom.configs.external.todo").setup()
    end,
  },

  -----------------------------------------------------------------------------

  -- Development --------------------------------------------------------------
  {
    "javiorfo/nvim-ship",
    ft = "ship",
    dependencies = {
      "javiorfo/nvim-spinetta",
      "javiorfo/nvim-popcorn",
    },
    config = function()
      require "custom.configs.external.ship"
    end,
  },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:debug",
    config = function()
      require "custom.configs.external.peek"
    end,
  },

  {
    "vuki656/package-info.nvim",
    ft = { "json", "lua" },
    config = true,
  },

  -- Debugging ----------------------------------------------------------------
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require "custom.configs.external.trouble"
    end,
  },

  -----------------------------------------------------------------------------

  -- Language Support ---------------------------------------------------------
  {
    "elkowar/yuck.vim",
    config = function()
      vim.opt.ft = "yuck"
    end,
  },

  -----------------------------------------------------------------------------

  -- QOL ----------------------------------------------------------------------
  {
    "abecodes/tabout.nvim",
    event = "BufEnter",
    config = function()
      require("tabout").setup()
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufReadPost",
  --   config = true,
  -- },

  -- {
  --   "kristijanhusak/vim-js-file-import",
  --   ft = {
  --     "javascript",
  --     "javascriptreact",
  --     "typescript",
  --     "typescriptreact",
  --   },
  --   build = "npm install",
  -- },

  -- {
  --   "hrsh7th/cmp-cmdline",
  --   event = "CmdLineEnter",
  -- },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      ft = "javascriptreact",
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    "m-demare/hlargs.nvim",
    event = "BufWinEnter",
    config = function()
      require("hlargs").setup()
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup()
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.external.hlchunk"
    end,
  },

  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  {
    "mrjones2014/nvim-ts-rainbow",
    event = "BufReadPost",
  },

  -- {
  --   "ludovicchabant/vim-gutentags",
  --   lazy = false,
  -- },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufWinEnter",
    config = function()
      require "custom.configs.external.ts-context"
    end,
  },

  -----------------------------------------------------------------------------

  -- Fun ----------------------------------------------------------------------
  {
    "andweeb/presence.nvim",
    config = function()
      require "custom.configs.external.presence"
    end,
  },

  {
    "alanfortlink/blackjack.nvim",
    cmd = { "BlackJackNewGame" },
    config = function()
      require("blackjack").setup {
        card_style = "large",
        suit_style = "white",
      }
    end,
  },

  {
    "alec-gibson/nvim-tetris",
    cmd = { "Tetris" },
  },
}

return plugins
