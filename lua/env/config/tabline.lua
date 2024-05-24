local M = {}

M.tablineConfig = {
  animation = false,
  auto_hide = false,
  tabpages = true,
  clickable = true,
  exclude_ft = {},
  exclude_name = {},
  focus_on_close = "left",
  hide = {
    extensions = true,
    inactive = false,
  },
  highlight_alternate = false,
  highlight_inactive_file_icons = false,
  highlight_visible = true,
  icons = {
    buffer_index = false,
    buffer_number = false,
    button = "",
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "󰅙 " },
      [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
      [vim.diagnostic.severity.HINT] = { enabled = false, icon = "󰌵 " },
      [vim.diagnostic.severity.INFO] = { enabled = false, icon = "󰋼 " },
    },
    gitsigns = {
      added = { enabled = true, icon = "+" },
      changed = { enabled = true, icon = "~" },
      deleted = { enabled = true, icon = "-" },
    },
    filetype = {
      custom_colors = false,
      enabled = true,
    },
    separator = { left = "▎", right = "" },
    separator_at_end = true,
    modified = { button = "●" },
    pinned = { button = "", filename = true },
    preset = "default",
    alternate = { filetype = { enabled = false } },
    current = { buffer_index = true },
    inactive = { button = "×" },
    visible = { modified = { buffer_number = false } },
  },
  sidebar_filetypes = {
    NvimTree = true,
  },
  no_name_title = "New File",
}

function M.tablineKeys()
  return {
    {
      "<Tab>",
      "<cmd>BufferNext<CR>",
      desc = "Switch to next buffer",
    },
    {
      "<S-Tab>",
      "<cmd>BufferPrevious<CR>",
      desc = "Switch to previous buffer",
    },
    {
      "<C-q>",
      "<cmd>BufferClose<CR>",
      desc = "Close focused buffer",
    },
    {
      "<C-p>",
      "<cmd>BufferPin<CR>",
      desc = "Pin/Unpin focused buffer",
    },
  }
end

return M
