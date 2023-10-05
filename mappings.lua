---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<ESC>"] = {
      ":noh <CR>",
      "Clear highligts",
      opts = {
        nowait = true,
        silent = true,
      },
    },
  },
}

M.text = {
  n = {
    ["<A-j>"] = {
      "<cmd> m+1<CR>==",
      "Move line down",
      opts = { silent = true },
    },
    ["<A-k>"] = {
      "<cmd> m-2<CR>==",
      "Move line up",
      opts = { silent = true },
    },
  },
  i = {
    ["<A-j>"] = {
      "<cmd> m+1<CR>",
      "Move line down",
      opts = { silent = true },
    },
    ["<A-k>"] = {
      "<cmd> m-2<CR>",
      "Move line up",
      opts = { silent = true },
    },
  },
  x = {
    ["<A-j>"] = {
      "<cmd> m+1<CR>==",
      "Move line down",
      opts = { silent = true },
    },
    ["<A-k>"] = {
      "<cmd> m-2<CR>==",
      "Move line up",
      opts = { silent = true },
    },
  },
  v = {
    ["<A-j>"] = {
      "<cmd> m+1<CR>==",
      "Move line down",
      opts = { silent = true },
    },
    ["<A-k>"] = {
      "<cmd> m-2<CR>==",
      "Move line up",
      opts = { silent = true },
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

M.peek = {
  plugin = true,
  n = {
    ["<leader>op"] = {
      function()
        require("peek").open()
      end,
      "Open Markdown Preview",
    },
    ["<leader>pq"] = {
      function()
        require("peek").close()
      end,
      "Close Markdown Preview",
    },
  },
}

M.undotree = {
  plugin = true,
  n = {
    ["<leader>tu"] = {
      "<cmd>UndotreeToggle<CR>",
    },
  },
}

M.conform = {
  plugin = true,
  n = {
    ["<leader>fm"] = {
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end,
      "LSP Formatting (Conform.nvim)",
    },
  },
  v = {
    ["<leader>fm"] = {
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
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

return M
