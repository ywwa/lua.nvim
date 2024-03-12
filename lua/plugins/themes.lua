return {
  {
    "themercorp/themer.lua",
    event = "UIEnter",
    opts = {
      colorscheme = "astron",
      styles = {
        -- ["function"] = { style = "italic" },
        -- functionbuiltin = { style = "italic" },
        -- variable = { style = "italic" },
        -- variableBuiltIn = { style = "italic" },
        -- parameter = { style = "italic" },
      },
      enable_installer = true,
    },
    config = function(_, opts)
      require("themer").setup(opts)
      vim.cmd.hi "FoldColumn guibg=NONE"
      vim.cmd.hi "NvimTreeWinSeparator guibg=NONE guifg=#2D3130"
      vim.cmd.hi "ColorColumn guibg=#282e33"
      vim.cmd.hi "IblIndent guifg=#2D3130"
      vim.cmd.hi "StatusLine guifg=NONE"

      vim.cmd.hi "TbFill guibg=#181c1f"

      vim.cmd.hi "TbCloseAllBufsBtn guibg=#bd4757"

      vim.cmd.hi "TbBufOn guibg=#1f2328"
      vim.cmd.hi "TbBufOnClose guibg=#1f2328"
      vim.cmd.hi "TbBufOnModified guibg=#1f2328"

      vim.cmd.hi "TbBufOff guibg=#181c1f"
      vim.cmd.hi "TbBufOffModified guibg=#181c1f"
      vim.cmd.hi "TbBufOffClose guibg=#181c1f"
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
