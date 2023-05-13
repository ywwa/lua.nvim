---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    ["<C-r>"] = { "<cmd> lua require('rest-nvim').run()<CR>", "RestNvim run" },
    ["<C-T>"] = { "<cmd> PeekOpen<CR>", "Open markdown preview window"},
    ["<C-Y>"] = { "<cmd> PeekClose<CR>", "Close markdown preview window"}
  },
}

-- more keybinds!

return M
