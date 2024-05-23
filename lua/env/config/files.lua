local M = {}

function M.telescope()
  return {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg" },
        find_cmd = "rg",
      },
      lazy = {
        show_icon = true,
        mappings = {
          open_in_browser = "<C-o>",
          open_in_file_browser = "<M-b>",
          open_in_find_files = "<C-f>",
          open_in_live_grep = "<C-g>",
          open_in_terminal = "<C-t>",
          open_plugins_picker = "<C-b>", -- Works only after having called first another action
          open_lazy_root_find_files = "<C-r>f",
          open_lazy_root_live_grep = "<C-r>g",
          change_cwd_to_plugin = "<C-c>d",
        },
        terminal_opts = {
          relative = "editor",
          style = "minimal",
          border = "rounded",
          title = "Telescope lazy",
          title_pos = "center",
          width = 0.5,
          height = 0.5,
        },
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {},
      },
    },
  }
end

function M.telescopeKeys()
  local builtin = require "telescope.builtin"
  return {
    {
      "<leader>ff",
      function()
        builtin.find_files()
      end,
      desc = "Telescope Find Files",
    },
    {
      "<leader>fF",
      function()
        builtin.find_files { hidden = true }
      end,
      desc = "Telescope Find Files (Hidden)",
    },
    {
      "<leader>lg",
      function()
        builtin.live_grep()
      end,
      desc = "Telescope Live Grep",
    },
    {
      "<leader>lG",
      function()
        builtin.live_grep { hidden = true }
      end,
      desc = "Telescope Live Grep (Hidden)",
    },
  }
end

M.nvimTree = {
  filters = { dotfiles = false },
  sort = {
    sorter = "case_sensitive"
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = { enable = true, update_root = false },
  view = {
    side = "right",
    adaptive_size = true,
    width = 35,
    preserve_window_proportions = true,
  },
  git = { enable = true, ignore = true },
  filesystem_watchers = { enable = true },
  actions = {
    open_file = { resize_window = true },
  },
  renderer = {
    root_folder_label = false,
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "icon",
    indent_markers = { enable = false },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

function M.nvimTreeKeys()
  local api = require "nvim-tree.api"

  return {
    {
      "<C-n>",
      function()
        api.tree.toggle()
      end,
      desc = "Toggle NvimTree",
    },
  }
end

return M
