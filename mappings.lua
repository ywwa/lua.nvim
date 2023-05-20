---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"]       = { ":", "enter command mode", opts = { nowait = true } },
    ["<Esc>"]   = { ":noh <CR>", "Clear highlights", opts = { silent = true } },

    ["<C-r>"]      = { "<cmd> RestRun <CR>", "RestNvim Run" },
    ["<C-T>"]      = { "<cmd> PeekOpen <CR>", "Open markdown preview window" },
    ["<C-Y>"]      = { "<cmd> PeekClose <CR>", "Close markdown preview window" },

    ["<leader>cc"] = { "<cmd> CCToggle <CR>", "Toggle ColorColumn display"},

    ["<leader>gb"] = { "<cmd> GitBlameToggle <CR>", "Toggle GitBlame display"},

    ["<Up>"]       = { "<Nop>" },
    ["<Down>"]     = { "<Nop>" },
    ["<Left>"]     = { "<Nop>" },
    ["<Right>"]    = { "<Nop>" },
  },
  i = {
    ["<Up>"]    = { "<Nop>" },
    ["<Down>"]  = { "<Nop>" },
    ["<Left>"]  = { "<Nop>" },
    ["<Right>"] = { "<Nop>" }
  },
  v = {
    ["<Up>"]    = { "<Nop>" },
    ["<Down>"]  = { "<Nop>" },
    ["<Left>"]  = { "<Nop>" },
    ["<Right>"] = { "<Nop>" }
  }
}

M.disabled = {
  n = {
    ["<C-h>"]      = { "<Nop>" },
    ["<C-j>"]      = { "<Nop>" },
    ["<C-k>"]      = { "<Nop>" },
    ["<C-l>"]      = { "<Nop>" },
  },
}

-- more keybinds!
return M
