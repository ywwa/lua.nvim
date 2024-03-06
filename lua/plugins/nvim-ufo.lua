return {
  "kevinhwang91/nvim-ufo",
  event = "UIEnter",
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      opts = function()
        local builtin = require "statuscol.builtin"
        return {
          relculright = true,
          bt_ignore = { "nofile", "prompt", "terminal", "lazy" },
          ft_ignore = {
            "NvimTree",
            "help",
            "vim",
            "Trouble",
            "noice",
            "lazy",
            "toggleterm",
          },

          segments = {
            { text = { " " } },
            { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
            {
              sign = { name = { ".*" }, maxwidth = 1, colwidth = 1 },
              auto = true,
              click = "v:lua.ScSa",
            },
            {
              text = { " ", " ", builtin.lnumfunc, " " },
              click = "v:lua.ScLa",
              condition = { true, builtin.not_empty },
            },
            -- {
            --   sign = {
            --     namespace = { "gitsign.*" },
            --     maxwidth = 1,
            --     colwidth = 1,
            --     auto = false,
            --   },
            --   click = "v:lua.ScSa",
            -- },
          },
        }
      end,
      config = function(_, opts)
        require("statuscol").setup(opts)
      end,
    },
  },
  opts = {
    close_fold_kinds = { "imports" },
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  },
  config = function(_, opts)
    require("ufo").setup(opts)
  end,
}
