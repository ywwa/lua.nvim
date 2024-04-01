return {
  {
    "themercorp/themer.lua",
    event = "UIEnter",
    opts = {
      colorscheme = "radium",
      -- colorscheme = "nightlamp",
      styles = {
        ["function"] = { style = "italic" },
        comment = { style = "italic" },
        -- functionbuiltin = { style = "italic" },
        -- variable = { style = "italic" },
        -- variableBuiltIn = { style = "italic" },
        -- parameter = { style = "italic" },
      },
      enable_installer = true,
    },
    config = function(_, opts)
      require("themer").setup(opts)
      -- astron
      vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
      -- vim.api.nvim_set_hl(
      --   0,
      --   "NvimTreeWinSeparator",
      --   { bg = "NONE", fg = "#2D3130" }
      -- )
      vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", fg = "#2D3130" })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#282E33" })
      vim.api.nvim_set_hl(0, "ThemerSelected", { bg = "#232930" })
      -- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2D3130" })
      -- vim.api.nvim_set_hl(0, "StatusLine", { fg = "NONE" })
      --
      vim.api.nvim_set_hl(0, "TbFill", { bg = "#181C1F" })

      vim.api.nvim_set_hl(0, "TbCloseAllBufsBtn", { bg = "#BD4757" })
      vim.api.nvim_set_hl(0, "TbBufOn", { bg = "#1F2328" })
      vim.api.nvim_set_hl(0, "TbBufOnClose", { bg = "#1F2328" })
      vim.api.nvim_set_hl(0, "TbBufOnModified", { bg = "#1F2328" })

      vim.api.nvim_set_hl(0, "TbBufOff", { bg = "#181c1f" })
      vim.api.nvim_set_hl(0, "TbBufOffClose", { bg = "#181c1f" })
      vim.api.nvim_set_hl(0, "TbBufOffModified", { bg = "#181c1f" })

      -- nightlamp
      -- vim.api.nvim_set_hl(0, "FoldColumn", {})
      -- vim.api.nvim_set_hl(
      --   0,
      --   "NvimTreeWinSeparator",
      --   { bg = "none", fg = "#15161c" }
      -- )
      -- vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", fg = "#15161c" })
      -- vim.api.nvim_set_hl(0, "TbFill", { bg = "#15161c" })
      -- vim.api.nvim_set_hl(0, "TbBufOn", { bg = "#1a1c24" })
      -- vim.api.nvim_set_hl(0, "TbBufOnClose", { bg = "#1a1c24" })
      -- vim.api.nvim_set_hl(0, "TbBufOnModified", { bg = "#1a1c24" })
    end,
  },
  -- { "folke/tokyonight.nvim", lazy = false, priority = 1000, config = true },
  -- {
  --   "decaycs/decay.nvim",
  --   name = "decay",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "dark",
  --     nvim_tree = { contrast = true },
  --   },
  --   config = function(_, opts)
  --     require("decay").setup(opts)
  --     vim.cmd.hi "NvimTreeWinSeparator guibg=NONE"
  --     vim.cmd.hi "ColorColumn guibg=#282e33"
  --     vim.cmd.hi "IblIndent guifg=#2D3130"
  --     vim.cmd.hi "StatusLine guifg=NONE"
  --
  --     vim.cmd.hi "TbFill guibg=#181c1f"
  --
  --     vim.cmd.hi "TbCloseAllBufsBtn guibg=#bd4757"
  --
  --     vim.cmd.hi "TbBufOn guibg=#1f2328"
  --     vim.cmd.hi "TbBufOnClose guibg=#1f2328"
  --     vim.cmd.hi "TbBufOnModified guibg=#1f2328"
  --
  --     vim.cmd.hi "TbBufOff guibg=#181c1f"
  --     vim.cmd.hi "TbBufOffModified guibg=#181c1f"
  --     vim.cmd.hi "TbBufOffClose guibg=#181c1f"
  --   end,
  -- },
}
