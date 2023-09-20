local M = {}

M.setup = function()
  require("hlchunk").setup {
    chunk = {
      enable = true,
      support_filetypes = {
        "*.ts",
        "*.tsx",
        "*.js",
        "*.jsx",
        "*.lua",
      },
      chars = {
        horizontal_line = "─",
        vertical_line = "│",
        left_top = "╭",
        left_bottom = "╰",
        right_arrow = ">",
      },
      style = "#806d9c",
    },

    indent = {
      enable = false,
      use_treesitter = true,
      chars = { "│" },
      style = {
        vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui"),
      },
      exclude_filetype = {
        nvdash = true,
        nvcheatsheet = true,
        terminal = true,
        dashboard = true,
        help = true,
        trouble = true,
        lspinfo = true,
        checkhealth = true,
        man = true,
        mason = true,
        NvimTree = true,
        plugin = true,
      },
    },

    line_num = {
      enable = true,
      support_filetypes = { "..." },
      style = "#806d9c",
    },

    blank = {
      enable = true,
      chars = { "" },
      style = {
        vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui"),
      },
    },
  }
end

return M
