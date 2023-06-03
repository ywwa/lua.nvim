require("noice").setup {
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },
  override = {
    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    ["vim.lsp.util.stylize_markdown"] = true,
    ["cmp.entry.get_documentation"] = true,
  },

  cmdline = {
    search_down = {
      kind = "search",
      pattern = "^/",
      icon = "",
      lang = "regex",
    },
    search_up = {
      kind = "search",
      pattern = "^&?",
      icon = "",
      lang = "regex",
    },
  },

  views = {
    cmdline_popup = {
      position = {
        row = 15,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      border = {
        style = "rounded",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 18,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
      },
      win_options = {
        winhighlight = {
          Normal = "Normal",
          FloatBorder = "DiagnosticInfo",
        },
      },
    },
  },

  presets = {
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
}
