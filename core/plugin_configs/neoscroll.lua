
require("neoscroll").setup {
  respect_scrolloff = false,
  cursor_scrolls_alone = true,

  pre_hook = function()
    vim.opt.eventignore:append {
      "WinScrolled",
      "CursorMoved",
    }
  end,

  post_hook = function()
    vim.opt.eventignore:remove {
      "WinScrolled",
      "CursorMoved",
    }
  end,
}
