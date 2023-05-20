<h1 align="center">Nv[im/Chad] custom config</h1>

<h3 align="center">
    
![prv-min](./img/prv-min.png)
![prv1-min](./img/prv1-min.png)

</h3>
<hr>

### plugins.lua
```lua
{
   1 "alexghergh/nvim-tmux-navigation",     -- Navigation between tmux and neovim
   2 "rest-nvim/rest.nvim",                 -- Run HTTP Requests inside neovim
   3 "folke/noice.nvim",                    -- Noice.
   4 "toppair/peek.nvim",                   -- Live markdown preview
   5 "andreadev-it/shade.nvim",             -- Darken unfocused buffers
   6 "folke/trouble.nvim",                  -- Make debugging more comfortable
   7 "folke/zen-mode.nvim",                 -- Zen mode
   8 "karb94/neoscroll.nvim",               -- Smooooooth
   9 "andweeb/presence.nvim",               -- Avarage discord user
  10 "elkowar/yuck.vim",                    -- Eww configuration yuck language support
  11 "lukas-reineke/virt-column.nvim",      -- Better colorcolumn (wont make eyes bleed)
  12 "f-person/git-blame.nvim",             -- Git Blame
  13 "Aasim-A/scrollEOF.nvim",              -- Better scrolloff what goes past EOF
}
```

### mappings.lua
```lua
  "C-h"     -- NvimTmuxNavigateLeft
  "C-j"     -- NvimTmuxNavigateDown
  "C-k"     -- NvimTmuxNavigateUp
  "C-l"     -- NvimTmuxNavigateRight

  "SPC c c" -- Toggle colorcolumn display
  "SPC g b" -- Toggle gitblame display

  "C-r"     -- RestRun
  "C-t"     -- PeekOpen
  "C-y"     -- PeekClose

  "Left"    -- Disabled
  "Down"    -- Disabled
  "Up"      -- Disabled
  "Right"   -- Disabled
```

### commands.lua
<small>Only autocmds<small>
```lua
-- Auto Command for removing scrolloff for certain filetypes
create_autocmd({ "BufEnter" }, {
  callback = function ()
    vim.o.scrolloff = (
      vim.bo.filetype == "NvimTree" or
      vim.bo.filetype == "nvdash"   or
      vim.bo.filetype == "terminal")
      and 0 or 10
  end
})
```
