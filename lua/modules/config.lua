local M = {
  colorify = {
    --- @type boolean
    enabled = true,
    --- @type "fg"|"bg"|"virtual"
    mode = "virtual", -- fg, bg, virtual
    --- @type string
    virt_text = "󱓻 ",
    --- @type { hex: boolean, lspvars: boolean }
    highlight = {
      hex = true,
      lspvars = true,
    },
  },
}
return M
