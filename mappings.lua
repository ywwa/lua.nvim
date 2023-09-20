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

M.textManipulation = {
  n = {
    ["A-j"] = {
      "<cmd> m+1<CR>==",
      "Move line down",
      opts = { silent = true },
    },
    ["A-k"] = {
      "<cmd> m-2<CR>==",
      "Move line up",
      opts = { silent = true },
    },
  },
  i = {
    ["A-j"] = {
      "<cmd> m+1<CR>==",
      "Move line down",
      opts = { silent = true },
    },
    ["A-k"] = {
      "<cmd> m-2<CR>==",
      "Move line up",
      opts = { silent = true },
    },
  },
  x = {
    ["A-j"] = {
      "<cmd> m+1<CR>==",
      "Move line down",
      opts = { silent = true },
    },
    ["A-k"] = {
      "<cmd> m-2<CR>==",
      "Move line up",
      opts = { silent = true },
    },
  },
  v = {
    ["A-j"] = {
      "<cmd> m+1<CR>==",
      "Move line down",
      opts = { silent = true },
    },
    ["A-k"] = {
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
