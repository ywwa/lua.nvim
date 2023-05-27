<h1 align="center">Nvim(Chad) configuration</h1>
<p align="center">Laziest <a href="https://github.com/NvChad/NvChad">git@github.com:NvChad/NvChad</a> config in the west<p>
<h3 align="center">
    
![prv-min](./img/prv-min.png)
![prv1-min](./img/prv1-min.png)

</h3>
<hr>

#### Currently main and work-in-progress branches are broken
fixing this later

### plugins.lua
```lua
{
   1 "aserowy/tmux.nvim",               -- Navigation between tmux and neovim
   2 "javiorfo/nvim-ship",              -- Test your api inside nvim
   3 "folke/noice.nvim",                -- Noice.
   4 "toppair/peek.nvim",               -- Live markdown preview
   5 "andreadev-it/shade.nvim",         -- Darken unfocused buffers
   6 "folke/trouble.nvim",              -- Make debugging more comfortable
   7 "folke/zen-mode.nvim",             -- Zen mode
   8 "karb94/neoscroll.nvim",           -- Smooooooth
   9 "andweeb/presence.nvim",           -- Avarage discord user
  10 "elkowar/yuck.vim",                -- Eww configuration yuck language support
  11 "lukas-reineke/virt-column.nvim",  -- Better colorcolumn (wont make eyes bleed)
  12 "Aasim-A/scrollEOF.nvim",          -- Better scrolloff what goes past EOF
  13 "yuukilla/nvchad-ui"               -- Fork of Nvchad/ui with customized cheatsheet
  14 "anuvyklack/pretty-fold.nvim"      -- Better fold than defauklt
}
```


### mappings.lua
```lua
M.general = {
  "SPC h"       -- Toggle Horizontal Terminal
  "SPC v"       -- Toggle Vertical Terminal
}

-- "javiorfo/nvim-ship"
M.ship = {
  "SPC s r"     -- Send Http Request
  "SPC s q"     -- Close Ship Response
}

-- "toppair/peek.nvim"
M.peek = {
  "SPC m o"     -- Open Markdown Preview
  "SPC m q"     -- Close Markdown Preview
}

-- "tabufline"
M.tabufline = {
  "SPC t o"     -- Open New Tab
  "SPC t q"     -- Close Tab
  "SPC t n"     -- Next Tab
  "SPC t p"     -- Previous Tab
}

-- "folke/trouble.nvim"
M.trouble = {
  "SPC t t"     -- Toggle Trouble
}

M.custom = {
  "SPC t c"     -- Toggle Color column
  "SPC t d"     -- Open cmd line with ":tcd" in it
}

M.git = {
  "SPC g b"     -- Toggle Current line blame
}
```
**Default behaviour of `<C-hjkl>` is DISABLED and handled by `tmux.nvim` plugin**<br>
if you're not going to use **`tmux.nvim`** plugin, please **re-enable** default mappings.


### commands.lua
```lua
-- this auto command disabled scrolloff if certain "files"
create_autocmd({ "BufEnter" }, {
  callback = function ()
    vim.o.scrolloff = (
      vim.bo.filetype == "NvimTree" or
      vim.bo.filetype == "nvdash"   or
      vim.bo.filetype == "terminal")
      and 0 or 10
  end
})

-- As soon as client enters UI, checks if its first instance of nvim
-- If true then starts discord rpc, else does nothing (Neovide unsupported)
create_autocmd({ "UIEnter" }, {
  callback = function ()
    if tonumber(getcmd_output("pgrep nvim | wc -l")) == 2 then
      vim.defer_fn(function ()
        require("lazy").load { plugins = { "presence.nvim" } }
      end, 0)
    end
  end
})
```


#### Important Note
`tmux.nvim` requires additional configuration of `tmux.conf`
My configuration contains following code

```lua
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}' '' 'select-pane -L' }
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' '' 'select-pane -D' }
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}' '' 'select-pane -U' }
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}' '' 'select-pane -R' }

bind-key -T copy-mode-vi 'C-h' if -F '#{pane_at_left}' '' 'select-pane -L'
bind-key -T copy-mode-vi 'C-j' if -F '#{pane_at_bottom}' '' 'select-pane -D'
bind-key -T copy-mode-vi 'C-k' if -F '#{pane_at_top}' '' 'select-pane -U'
bind-key -T copy-mode-vi 'C-l' if -F '#{pane_at_right}' '' 'select-pane -R'
```

Before using this code, read more at [aserowy/tmux.nvim](https://github.com/aserowy/tmux.nvim#navigation)

