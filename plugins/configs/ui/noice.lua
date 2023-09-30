require("noice").setup {
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
  },

  messages = {
    enabled = false,
  },

  cmdline = {
    format = {
      search_down = { view = "cmdline" },
      search_up = { view = "cmdline" },
    },
  },

  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    signature = { enabled = false },
    hover = { enabled = false },
  },

  views = {
    cmdline_popup = {
      position = { row = 5, col = "50%" },
      size = { width = 60, height = "auto" },
    },
    popupmenu = {
      relative = "editor",
      position = { row = 8, col = "50%" },
      size = { width = 60, height = 10 },
      border = { style = "rounded", padding = { 0, 1 } },
      win_options = {
        winhighlight = {
          Normal = "Normal",
          FLoatBorder = "DiagnosticInfo",
        },
      },
    },
  },
}
