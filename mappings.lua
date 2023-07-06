---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<ESC>"] = { ":noh <CR>", "Clear highlights", opts = { nowait = true, silent = true } },
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

M.custom = {
  n = {
    ["<leader>tc"] = {
      "<cmd> ColorcolumnToggle <CR>",
      "Toggle Color column",
    },

    ["<leader>td"] = {
      function()
        vim.api.nvim_input ":tcd "
      end,
      "Run tcd command",
    },
    ["<leader>tt"] = {
      "<cmd> TroubleToggle <CR>",
      "Toggle Trouble",
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

-- more keybinds!

return M
