require("virt-column").setup {
  char = "│",
  virtcolumn = "+1,80",
  exclude = {
    filetypes = {
      "plain",
      "plain text",
      "plain_text",
      "plain\\ text",
      "Empty",
      "empty",
      "lua"
    },
    buftypes = {
      "plain",
      "plain text",
      "plain_text",
      "plain\\ text",
      "lua"
    }
  }
}
