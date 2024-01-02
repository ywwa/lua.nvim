---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<ESC>"] = {
      ":noh <CR>",
      "Clear highlights",
      opts = { nowait = true, silent = true },
    },
  },
}

M.typing = {
  n = {
    ["<A-j>"] = { "<cmd> m+1<CR>==", "Move line down" },
    ["<A-k>"] = { "<cmd> m-2<CR>==", "Move line up" },
  },

  i = {
    ["<A-j>"] = { "<cmd> m+1<CR>==", "Move line down" },
    ["<A-k>"] = { "<cmd> m-2<CR>==", "Move line up" },
  },

  x = {
    ["<A-j>"] = { "<cmd> m+1<CR>==", "Move line down" },
    ["<A-k>"] = { "<cmd> m-2<CR>==", "Move line up" },
  },

  v = {
    ["<A-j>"] = { ":m'>+1<CR>gv=gv", "Move line down", opts = { silent = true } },
    ["<A-k>"] = { ":m'<-2<CR>gv=gv", "Move line up", opts = { silent = true } },
  },
}

M.conform = {
  plugin = true,
  n = {
    ["<leader>fm"] = {
      function()
        require("conform").format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      "LSP Formatting (Conform.nvim)",
    },
  },
  v = {
    ["<leader>fm"] = {
      function()
        require("conform").format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      "LSP Formatting (Conform.nvim)",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fb"] = {
      "<cmd>Telescope file_browser<CR>",
      "File browser",
    },
  },
}

M.navigation = {
  plugin = true,
  n = {
    ["<C-h>"] = {
      "<cmd>TmuxNavigateLeft<CR>",
      "Navigate Left",
      opts = {
        silent = true,
        nowait = true,
      },
    },
    ["<C-j>"] = {
      "<cmd>TmuxNavigateDown<CR>",
      "Navigate Down",
      opts = {
        silent = true,
        nowait = true,
      },
    },
    ["<C-k>"] = {
      "<cmd>TmuxNavigateUp<CR>",
      "Navigate Up",
      opts = {
        silent = true,
        nowait = true,
      },
    },
    ["<C-l>"] = {
      "<cmd>TmuxNavigateRight<CR>",
      "Navigate Right",
      opts = {
        silent = true,
        nowait = true,
      },
    },
  },
}

M.commands = {
  n = {
    ["<leader>tc"] = {
      "<cmd>ToggleColorColumn<CR>",
      "Toggle color column",
    },
    ["<leader>tt"] = {
      "<cmd>TroubleToggle<CR>",
      "Toggle trouble",
      opts = { silent = true },
    },
    ["<leader>gb"] = {
      "<cmd> Gitsigns toggle_current_line_blame <CR>",
      "Toggle current line blame",
    },
  },
}

M.rest = {
  n = {
    ["<leader>rr"] = {
      function()
        require("rest-nvim").run()
      end,
      "Run REST request",
    },
  },
}

return M
