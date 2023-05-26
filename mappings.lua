---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<Esc>"] = { ":noh <CR>", "Clear highlights", opts = { silent = true } },
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal terminal",
    },
    ["<leader>v"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical terminal",
    },
  },
}

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<Left>"] = "",
    ["<Right>"] = "",
    ["<leader>gb"] = "",
  },

  i = {
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<Left>"] = "",
    ["<Right>"] = "",
  },

  v = {
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<Left>"] = "",
    ["<Right>"] = "",
  },
}

M.ship = {
  n = {
    ["<leader>sr"] = {
      "<cmd> Ship <CR>",
      "Run Http request",
    },
    ["<leader>sq"] = {
      "<cmd> ShipCloseResponse <CR>",
      "Close Ship response",
    },
  },
}

M.peek = {
  n = {
    ["<leader>mo"] = {
      "<cmd> PeekOpen <CR>",
      "Open markdown preview",
    },
    ["<leader>mq"] = {
      "<cmd> PeekClose <CR>",
      "Close markdown preview",
    },
  },
}

M.tabufline = {
  n = {
    ["<leader>to"] = {
      "<cmd> tabnew <CR>",
      "Open new Tab",
    },
    ["<leader>tq"] = {
      "<cmd> tabclose <CR>",
      "Close tab",
    },
    ["<leader>tn"] = {
      "<cmd> tabnext <CR>",
      "Next Tab",
    },
    ["<leader>tp"] = {
      "<cmd> tabprevious <CR>",
      "Previous Tab",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>to"] = {
      "<cmd> TroubleToggle <CR>",
      "Toggle Trouble",
    },
  },
}

M.custom = {
  n = {
    ["<leader>tc"] = {
      "<cmd> CCToggle <CR>",
      "Toggle Color column",
    },
  },
}

M.git = {
  n = {
    ["<leader>gb"] = {
      "<cmd> Gitsigns toggle_current_line_blame <CR>",
      "Toggle Current line blame",
    },
  },
}

return M
