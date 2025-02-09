local M = {
  colorify = {
    ---@type boolean
    enabled = true,
    ---@type "fg"|"bg"|"virtual"
    mode = "virtual", -- fg, bg, virtual
    --- @type string
    virt_text = "󱓻 ",
    ---@type { hex: boolean, lspvars: boolean }
    highlight = {
      hex = true,
      lspvars = true,
    },
  },

  tabufline = {
    ---@type boolean
    enabled = true,
    ---@type boolean
    lazyload = false,
    ---@type string[]
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
    ---@type integer
    bufWidth = 21,
  },

  terminal = {
    winopts = { number = false, relativenumber = false, colorcolumn = "0", scrolloff = 0 },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
    ---@type string
    shell = "/usr/bin/zsh",
  },
}
return M
