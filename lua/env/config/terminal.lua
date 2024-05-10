local M = {}

M.keys = function()
  local Terminal = require("toggleterm.terminal").Terminal

  local hTerm = Terminal:new {
    direction = "horizontal",
    size = 20,
    on_open = function()
      vim.wo.colorcolumn = "0"
      vim.wo.scrolloff = 0
    end,
  }

  local fTerm = Terminal:new {
    direction = "float",
    on_open = function()
      vim.wo.colorcolumn = "0"
      vim.wo.scrolloff = 0
    end,
  }

  return {
    {
      "<A-h>",
      function()
        hTerm:toggle()
      end,
      desc = "Toggle horizontal terminal",
    },
    {
      "<A-f>",
      function()
        fTerm:toggle()
      end,
      desc = "Toggle floating terminal",
    },
    {
      "<leader>;",
      "<cmd>ToggleTermToggleAll<CR>",
      desc = "Toggle All terminals",
      mode = { "n", "t" },
    },
  }
end

M.opts = {
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "veritcal" then
      return vim.o.columns * 0.4
    end
  end,

  hide_numbers = true,
  shade_terminals = false,
  start_in_insert = true,
  close_on_exit = true,
  shell = vim.o.shell,
  auto_scroll = true,
  direction = "horizontal",
  float_opts = {
    border = "curved",
    -- width = ,
    -- height = ,
    -- row = ,
    -- col = ,
  },
  winbar = { enabled = false },
}

return M
