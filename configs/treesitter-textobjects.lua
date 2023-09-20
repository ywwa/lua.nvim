local M = {}

M.setup = function()
  require("nvim-treesitter.configs").setup {
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = {
            query = "@class.outer",
            desc = "Next class start",
          },
          ["]o"] = "@loop.*",
          ["]s"] = {
            query = "@scope",
            query_group = "locals",
            desc = "Next scope",
          },
          ["]z"] = {
            query = "@fold",
            query_group = "folds",
            desc = "Next fold",
          },
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
        goto_next = { ["]d"] = "@conditional.outer" },
        goto_previous = { ["[d"] = "@conditional.outer" },
      },
      swap = {
        enable = true,
        swap_next = { ["<leader>a"] = "@parameter.inner" },
        swap_previous = { ["<leader>A"] = "@parameter.inner" },
      },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.innter",
          ["ac"] = "@class.outer",
          ["ic"] = {
            query = "@class.inner",
            desc = "Select inner part of a class region",
          },
        },
        selection_modes = {
          ["@parameter.outer"] = "v",
          ["@function.outer"] = "V",
          ["@class.outer"] = "<c-v>",
        },
        include_surrounding_whitespace = true,
      },
    },
  }
end

return M
