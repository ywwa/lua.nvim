local builtin = require "statuscol.builtin"
require("statuscol").setup {
  relculright = true,
  bt_ignore = {
    "nofile",
    "prompt",
    "terminal",
    "lazy",
  },
  ft_ignore = {
    "NvimTree",
    "dashboard",
    "nvcheatsheet",
    "help",
    "vim",
    "alpha",
    "dashboard",
    "Trouble",
    "noice",
    "lazy",
    "toggleterm",
  },
  segments = {
    { text = { " " } },
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    -- { text = { " " } },
    {
      sign = {
        name = { ".*" },
        maxwidth = 1,
        colwidth = 1,
      },
      auto = true,
      click = "v:lua.ScSa",
    },
    {
      text = { " ", " ", builtin.lnumfunc, " " },
      click = "v:lua.ScLa",
      condition = { true, builtin.not_empty },
    },
    {
      sign = {
        namespace = { "gitsign.*" },
        maxwidth = 1,
        colwidth = 1,
        auto = false,
      },
      click = "v:lua.ScSa",
    },
    -- -- Segment: Add padding
    -- {
    --   text = { " " },
    --   hl = "Normal",
    --   condition = { true, builtin.not_empty },
    -- },
  },
}
