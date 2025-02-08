return {
  "romgrk/barbar.nvim",
  dependencies = {
    "tiagovla/scope.nvim",
    opts = {
      hooks = {
        pre_tab_leave = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
        end,
        post_tab_enter = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
        end,
      },
    },
  },
  event = "UIEnter",
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  keys = {
    { "<C-q>", "<cmd>BufferClose<CR>", desc = "Close buffer (barbar)" },
    { "<Tab>", "<cmd>BufferNext<CR>", desc = "Next Buffer (barbar)" },
    { "<S-Tab>", "<cmd>BufferPrev<CR>", desc = "Previous Buffer (barbar)" },
  },
  opts = require "config.barbar",
}
