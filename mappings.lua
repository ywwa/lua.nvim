---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<ESC>"] = {
    ":noh <CR>",
      "Clear highlights",
      opts = {
        nowait = true,
        silent = true,
    },
    },
  },
}

M.terminal = {
  n = {
    ["<leader>h"] = {
      function()
        require("nvchad.term").new { pos = "sp", size = 0.3 }
      end,
      "New horizontal terminal",
    },

    ["<leader>v"] = {
      function()
        require("nvchad.term").new { pos = "vsp", size = 0.3 }
      end,
      "New vertical terminal",
    },
    ["<A-h>"] = {
      function()
        require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
      end,
      "Toggle horizontal terminal",
    },

    ["<A-v>"] = {
      function()
        require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
      end,
      "Toggle vertical terminal",
    },
  },
  t = {
    ["<ESC>"] = {
      function()
        local win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_close(win, true)
      end,
      "Close terminal in terminal mode",
    },

    ["<A-h>"] = {
      function()
        require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
      end,
      "Toggle horizontal terminal",
    },

    ["<A-v>"] = {
      function()
        require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
      end,
      "Toggle vertical terminal",
    },
  },
}

M.textManipulation = {
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
      "<cmd> ToggleColorColumn <CR>",
      "Toggle Color Column",
      opts = { silent = true },
    },
    ["<leader>tt"] = {
      "<cmd> TroubleToggle <CR>",
      "Toggle Trouble",
      opts = { silent = true },
    },
    ["<leader>gb"] = {
      "<cmd> Gitsigns toggle_current_line_blame <CR>",
      "Toggle Current line blame",
    },
  },
}

return M
