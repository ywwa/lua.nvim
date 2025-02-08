return {
  on_attach = "default",
  hijack_cursor = true,
  auto_reload_on_write = false,
  hijack_netrw = false,
  hijack_unnamed_buffer_when_opening = false,
  select_prompts = true,
  sort = { sorter = "case_sensitive", folders_first = true, files_first = false },
  view = {
    centralize_selection = false,
    cursorline = true,
    debounce_delay = 15,
    side = "left",
    preserve_window_proportions = true,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    float = {
      enable = false,
      open_win_config = function()
        local totalRows = vim.api.nvim_get_option_value("lines", {})
        local totalCols = vim.api.nvim_get_option_value("columns", {})
        local winHeight = 30
        local winWidth = 80
        return {
          relative = "editor",
          border = "rounded",
          width = winWidth,
          height = winHeight,
          row = (totalRows - winHeight) / 2,
          col = (totalCols - winWidth) / 2,
        }
      end,
    },
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    full_name = true,
    root_folder_label = false,
    hidden_display = "simple",
    symlink_destination = true,
    highlight_git = "icon",
    highlight_diagnostics = "name",
    highlight_opened_files = "none",
    highlight_modified = "icon",
    highlight_hidden = "none",
    highlight_bookmarks = "none",
    highlight_clipboard = "all",
    indent_markers = { enable = true, inline_arrows = true },
    icons = {
      web_devicons = { folder = { enable = true } },
      git_placement = "signcolumn",
      diagnostics_placement = "right_align",
      modified_placement = "after",
      hidden_placement = "after",
      bookmarks_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
        modified = true,
        hidden = true,
        diagnostics = true,
        bookmarks = true,
      },
    },
  },
  update_focused_file = { enable = true },
}
