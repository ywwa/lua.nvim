local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Disable and replace base plugins -----------------------------------------

  {
    "NvChad/ui",
    enabled = false
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


  -- override plugin configs --------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
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
    opts = overrides.cmp,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline
  },


  -- Custom plugins -----------------------------------------------------------
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },


  -- Utilities ----------------------------------------------------------------

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


  -- Yoinked from siducks .'s -------------------------------------------------
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.external.zenmode"
    end,
  },


  -- Smoother workflow --------------------------------------------------------
  {
    "aserowy/tmux.nvim",
    keys = require("custom.configs.external.tmux").keys,
    config = function()
      require("custom.configs.external.tmux").setup()
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
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
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
    "lukas-reineke/virt-column.nvim",
    event = "VeryLazy",
    config = function()
      require("virt-column").setup {
        char = "┃",
      }
    end,
  },

  {
    "abecodes/tabout.nvim",
    event = "BufEnter",
    config = function()
      require("tabout").setup()
    end,
  },

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
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    event = "BufReadPost",
    keys = { "zf", "zo", "za", "zc", "zM", "zR" },
    config = function()
      require("ufo").setup {
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      }
    end,
  },

  {
    "code-biscuits/nvim-biscuits",
    event = "BufRead",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require "custom.configs.external.biscuits"
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufReadPost",
    config = true,
  },


  -- Language support ---------------------------------------------------------
  {
    "elkowar/yuck.vim",
    config = function()
      vim.opt.ft = "yuck"
    end,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", ft = "javascriptreact" },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    "kristijanhusak/vim-js-file-import",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    build = "npm install",
  },


  -- UI -----------------------------------------------------------------------
  {
    "folke/noice.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      -- { "rcarriga/nvim-notify" }
    },
    event = "VeryLazy",
    config = function()
      require "custom.configs.external.noice"
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
    "petertriho/nvim-scrollbar",
    event = "VimEnter",
    config = true,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.external.hlchunk"
    end,
  },

  {
    "mrjones2014/nvim-ts-rainbow",
    event = "BufReadPost",
  },

  {
    "mg979/vim-visual-multi",
    cmd = "VisualMulti",
    setup = function()
      require "custom.configs.external.visual-multi"
    end,
  },

  {
    "danilamihailov/beacon.nvim",
    event = "BufReadPost"
  },

  { 'echasnovski/mini.surround', event = "VeryLazy"},

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufWinEnter",
    config = function()
      require "custom.configs.external.ts-context"
    end,
  },

  -- Useless plugins ( better delete them kekw ) ------------------------------
  {
    "andweeb/presence.nvim",
    config = function()
      require "custom.configs.external.presence"
    end,
  },
}

return plugins
