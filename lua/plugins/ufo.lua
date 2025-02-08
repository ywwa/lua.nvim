return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      opts = function()
        local builtin = require "statuscol.builtin"
        return {
          relcurright = true,
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
      end,
    },
  },
  event = "UIEnter",
  opts = {
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  },
}
