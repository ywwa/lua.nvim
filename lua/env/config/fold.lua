local M = {}

function M.statuscol()
  local builtin = require "statuscol.builtin"
  return {
    relculright = true,
    bt_ignore = { "nofile", "prompt", "terminal", "lazy" },
    ft_ignore = { "help", "vim", "lazy" },
    segments = {
      { text = { " " } },
      { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
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
    },
  }
end

function M.ufo()
  return {
    close_fold_kinds_for_ft = {
      default = { "imports" },
    },

    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  }
end

M.prettyFold = {
  keep_indentation = false,
  fill_char = " ",
  sections = {
    left = {
      function()
        return string.rep("*", vim.v.foldlevel)
      end,
    },
    right = {},
  },
  ft_ignore = {
    "help",
    "vim",
    "Trouble",
    "lazy",
  },
}

return M
