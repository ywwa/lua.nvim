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
      "delphinus/cmp-ctags",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    opts = overrides.cmp,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  -- User Interface -----------------------------------------------------------
  {
    "code-biscuits/nvim-biscuits",
    event = "BufRead",
    config = function()
      require "custom.configs.external.biscuits"
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
      require("neodim").setup {
        refresh_delay = 75,
        alpha = 0.75,
        blend_color = "#000000",
        hide = { underline = true, virtual_text = true, signs = true },
        priority = 100,
        disable = {},
      }
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
    keys = {
      {
        "<C-h>",
        "<cmd> lua require('tmux').move_left() <CR>",
        desc = "Move Left",
      },
      {
        "<C-j>",
        "<cmd> lua require('tmux').move_bottom() <CR>",
        desc = "Move Down",
      },
      {
        "<C-k>",
        "<cmd> lua require('tmux').move_top() <CR>",
        desc = "Move Up",
      },
      {
        "<C-l>",
        "<cmd> lua require('tmux').move_right() <CR>",
        desc = "Move Right",
      },
      -- resize keymaps
      {
        "<A-h>",
        "<cmd> lua require('tmux').resize_left() <CR>",
        desc = "Resize Left",
      },
      {
        "<A-j>",
        "<cmd> lua require('tmux').resize_bottom() <CR>",
        desc = "Resize Down",
      },
      {
        "<A-k>",
        "<cmd> lua require('tmux').resize_top() <CR>",
        desc = "Resize Up",
      },
      {
        "<A-l>",
        "<cmd> lua require('tmux').resize_right() <CR>",
        desc = "Resize Right",
      },
    },
    config = function()
      require "custom.configs.external.tmux"
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
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

  {
    "ray-x/lsp_signature.nvim",
    event = "BufReadPost",
    config = true,
  },

  {
    "kristijanhusak/vim-js-file-import",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    build = "npm install",
  },

  {
    "hrsh7th/cmp-cmdline",
    event = "CmdLineEnter",
  },

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

  {
    "ludovicchabant/vim-gutentags",
    lazy = false,
  },

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
}

return plugins
