local M = {}

function M.statuscol()
  local builtin = require "statuscol.builtin"
  return {
    relculright = true,
    bt_ignore = { "nofile", "prompt", "terminal", "lazy" },
    ft_ignore = { "help", "vim", "lazy" },
    segments = {
      { text = { " " } },
      {
        text = { builtin.foldfunc },
        click = "v:lua.ScFa",
        maxwidth = 1,
        colwidth = 1,
        auto = false,
      },
      { text = { " " } },
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
      {
        text = { " " },
        hl = "Normal",
        condition = { true, builtin.not_empty },
      },
    },
  }
end

M.ufo = {
  provider_selector = function()
    return { "treesitter", "indent" }
  end,
}

return M
