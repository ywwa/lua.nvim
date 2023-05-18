<h1 align="center">Nv[im/Chad] custom config</h1>

<h3 align="center">
   <img src="https://github.com/yuukilla/nvchad-config/blob/master/.github/img/prv.png" />
   <img src="https://github.com/yuukilla/nvchad-config/blob/master/.github/img/prv1.png" />
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
  12 "f-person/git-blame.nvim"              -- Git Blame
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
