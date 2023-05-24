---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<Esc>"] = { ":noh <CR>", "Clear highlights", opts = { silent = true } },

    ["<leader>sr"] = {
      "<cmd> Ship <CR>",
      "Run .ship request",
    },

    ["<leader>ct"] = {
      "<cmd> TroubleToggle <CR>",
      "Toggle Trouble",
    },

    ["<leader>mo"] = {
      "<cmd> PeekOpen <CR>",
      "Open markdown preview window",
    },
    ["<leader>mc"] = {
      "<cmd> PeekClose <CR>",
      "Close markdown preview window",
    },

    ["<leader>cc"] = {
      "<cmd> CCToggle <CR>",
      "Toggle ColorColumn display",
    },

    ["<leader>gb"] = {
      "<cmd> Gitsigns toggle_current_line_blame <CR>",
      "Toggle Current Line Blame",
    },

    ["<leader>cy"] = {
      "<cmd> lua require('nvterm.terminal').send('yarn develop', 'horizontal') <CR>",
      "Yarn Develop",
    },

    -- ["<leader>h"] = {
    --   function()
    --     require("nvterm.terminal").toggle "horizontal"
    --   end,
    --   "Toggle horizontal term",
    -- },

    ["<leader>to"] = {
      "<cmd> tabnew <CR>",
      "Open New Tab",
    },
    ["<leader>tc"] = {
      "<cmd> tabclose <CR>",
      "Close Tab",
    },
    ["<leader>tn"] = {
      "<cmd> tabnext <CR>",
      "Next Tab",
    },
    ["<leader>tp"] = {
      "<cmd> tabprevious <CR>",
      "Previous Tab",
    },

    ["<Up>"] = { "<Nop>" },
    ["<Down>"] = { "<Nop>" },
    ["<Left>"] = { "<Nop>" },
    ["<Right>"] = { "<Nop>" },
  },
  i = {
    ["<Up>"] = { "<Nop>" },
    ["<Down>"] = { "<Nop>" },
    ["<Left>"] = { "<Nop>" },
    ["<Right>"] = { "<Nop>" },
  },
  v = {
    ["<Up>"] = { "<Nop>" },
    ["<Down>"] = { "<Nop>" },
    ["<Left>"] = { "<Nop>" },
    ["<Right>"] = { "<Nop>" },
  },
}

M.disabled = {
  n = {
    ["<C-h>"] = { "<Nop>" },
    ["<C-j>"] = { "<Nop>" },
    ["<C-k>"] = { "<Nop>" },
    ["<C-l>"] = { "<Nop>" },
    ["<leader>h"] = { "<Nop>" },
  },
}

-- more keybinds!
return M
