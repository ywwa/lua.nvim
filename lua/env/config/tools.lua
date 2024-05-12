local M = {}

M.todoComments = {
  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
    },
    TODO = { icon = "󰔟 ", color = "todo" },
    HACK = { icon = "󱗗 ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = "󱢍 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "󱞁 ", color = "info", alt = { "INFO" } },
    TEST = {
      icon = "󰙨 ",
      color = "test",
      alt = { "TESTING", "PASSED", "FAILED" },
    },
  },
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#ff6c6b" },
    warning = { "DiagnosticWarn", "WarningMsg", "#ECBE7B" },
    todo = { "DiagnosticOk", "#66c4ff" },
    info = { "DiagnosticInfo", "#98be65" },
    default = { "Identifier", "#dc8ef3" },
    test = { "Identifier", "#ff75a0" },
  },
}

M.trouble = {
  position = "bottom",
  height = 10,
  width = 50,
  icons = true,
  mode = "workspace_diagnostics",
  fold_open = "",
  fold_closed = "",
  group = true,
  padding = true,
  action_keys = {
    close = "q",
    cancel = "<esc>",
    refresh = "r",
    jump = { "<cr>", "<tab>" },
    open_vsplit = { "<C-x>" },
    open_split = { "<C-v>" },
    open_tab = { "<C-t>" },
    jump_close = { "o" },
    toggle_mode = "m",
    toggle_preview = "P",
    hover = "K",
    preview = "p",
    close_folds = { "zM", "zm" },
    open_folds = { "zR", "zr" },
    toggle_fold = { "zA", "za" },
    previous = "k",
    next = "j",
  },
  indent_lines = true,
  auto_open = false,
  auto_close = false,
  auto_preview = false,
  auto_fold = true,
  auto_jump = { "lsp_definitions" },
  signs = {
    error = " ",
    warning = " ",
    hint = " ",
    information = " ",
    other = " ",
  },
  use_diagnostic_signs = true,
}
function M.troubleKeys()
  local trouble = require "trouble"

  return {
    {
      "<leader>tt",
      function()
        trouble.toggle()
      end,
      desc = "Toggle Trouble",
    },
  }
end

M.peek = {
  auto_load = true,
  close_on_bdelete = true,
  syntax = true,
  theme = "dark",
  update_on_change = true,
  app = "floorp",
  filetype = { "markdown", "mdx" },
  throttle_at = 20000,
  throttle_time = "auto",
}
function M.peekKeys()
  local peek = require "peek"
  return {
    {
      "<leader>po",
      function()
        peek.open()
      end,
      desc = "Open Markdown preview",
    },
    {
      "<leader>pq",
      function()
        peek.close()
      end,
      desc = "Close Markdown preview",
    },
  }
end

M.zenMode = {
  window = {
    backdrop = 0.9,
    width = 90,
    height = 1,
    plugins = {
      tmux = { enabled = false },
      wezterm = { enabled = false },
    },
  },
}

return M
