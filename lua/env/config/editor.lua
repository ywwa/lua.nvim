local M = {}

M.lastPlace = {
  lastplace_ignore_buftype = {
    "NvimTree",
    "terminal",
    "help",
    "Trouble",
    "mason",
    "lazy",
  },
  lastplace_ignore_filetype = {
    "NvimTree",
    "terminal",
    "help",
    "Trouble",
    "mason",
    "lazy",
  },
  lastplace_open_folds = true,
}

M.cloak = {
  enabled = true,
  cloak_character = "*",
  highlight_group = "Comment",
  cloak_length = nil,
  try_all_patterns = true,
  cloak_telescope = true,
  patterns = {
    {
      file_pattern = ".env*",
      cloak_pattern = "=.+",
      replace = nil,
    },
  },
}

M.hlargs = {
  color = "#ef9062",
  highlight = {},
  excluded_filetypes = {},
  paint_arg_declarations = true,
  paint_arg_usages = true,
  paint_catch_blocks = {
    declarations = false,
    usages = false,
  },
  extras = {
    named_parameters = false,
  },
  hl_priority = 10000,
  excluded_argnames = {
    declarations = {},
    usages = {
      python = { "self", "cls" },
      lua = { "self" },
    },
  },
  performance = {
    parse_delay = 1,
    slow_parse_delay = 50,
    max_iterations = 400,
    max_concurrent_partial_parses = 30,
    debounce = {
      partial_parse = 3,
      partial_insert_mode = 100,
      total_parse = 700,
      slow_parse = 5000,
    },
  },
}

return M
