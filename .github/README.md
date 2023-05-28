<h1 align="center">Nvim(Chad) configuration</h1>
<p align="center">
    Laziest 
    <a href="https://github.com/NvChad/NvChad">NvChad</a>
    config 
    <a href="https://yuukilla.github.io">V2.0</a>
<p>

<h3 align="center">

```lua

"▓██   ██▓ █     █░ █     █░ ▄▄▄      "
" ▒██  ██▒▓█░ █ ░█░▓█░ █ ░█░▒████▄    "
"  ▒██ ██░▒█░ █ ░█ ▒█░ █ ░█ ▒██  ▀█▄  "
"  ░ ▐██▓░░█░ █ ░█ ░█░ █ ░█ ░██▄▄▄▄██ "
"  ░ ██▒▓░░░██▒██▓ ░░██▒██▓  ▓█   ▓██▒"
"   ██▒▒▒ ░ ▓░▒ ▒  ░ ▓░▒ ▒   ▒▒   ▓▒█░"
" ▓██ ░▒░   ▒ ░ ░    ▒ ░ ░    ▒   ▒▒ ░"
" ▒ ▒ ░░    ░   ░    ░   ░    ░   ▒   "
" ░ ░         ░        ░          ░  ░"
" ░ ░   git@github.com:yuukilla       "

```
<hr>
</h3>

## List of plugins
```lua
{
     1 "code-biscuits/nvim-biscuits",               -- MMMM biscuits
     2 "anuvyklack/pretty-fold.nvim",               -- VSCode like folding
     3 "kevinhwang91/nvim-ufo",                     -- VSCode like folding x2
     4 "lukas-reineke/virt-column.nvim",            -- Color column with custom content
     5 "karb94/neoscroll.nvim",                     -- Smooth scrolling
     6 "Aasim-A/scrollEOF.nvim",                    -- Scroll past End of file
     7 "zbirenbaum/neodim",                         -- Dim unused functions variables etc
     8 "andreadev-it/shade.nvim",                   -- Darken inactive buffers
     9 "folke/zen-mode.nvim",                       -- ZenMode
    10 "danilamihailov/beacon.nvim",                -- Jumping cursor animation
    11 "nvimdev/lspsaga.nvim",                      -- Winbar.
    12 "aserowy/tmux.nvim",                         -- Navigation between nvim and tmux panes
    13 "folke/todo-comments.nvim",                  -- Todo comments.
    14 "javiorfo/nvim-ship",                        -- Send HTTP request just like in postman
    15 "toppair/peek.nvim",                         -- Markdown preview plugin
    16 "vuki656/package-info.nvim",                 -- Versions of packages in package.json
    17 "folke/trouble.nvim",                        -- Debugger
    18 "elkowar/yuck.vim",                          -- Eww configuration language
    19 "abecodes/tabout.nvim",                      -- Tab out of "" () [] {} etc.
    20 "max397574/better-escape.nvim",              -- idk how to describe
    21 "ray-x/lsp_signature.nvim",                  -- same here
    22 "kristijanhusak/vim-js-file-import",         -- Plugin name self explanatory
    23 "hrsh7th/cmp-cmdline",                       -- same here too
    24 "numToStr/Comment.nvim",                     -- Comment.
    25 "m-demare/hlargs.nvim",                      -- better highlighting of args
    26 "kevinhwang91/nvim-hlslens",                 -- ok
    27 "tpope/vim-surround",                        -- Auto surround of things
    28 "mrjones2014/nvim-ts-rainbow",               -- Colors for blankline
    29 "ludovicchabant/vim-gutentags",              -- Needed for lsp
    30 "nvim-treesitter/nvim-treesitter-context",   -- Keep first line of function, class etc on top
    31 "andweeb/presence.nvim",                     -- Discord Rich Presence
}
```

<h4 align="center">

```lua
"NvChad/ui" -> "yuukilla/nvchad-ui"
```

</h4>
Original
<a href="https://github.com/NvChad/ui">Nvchad/ui</a>
plugin has been replaced with my
<a href="https://github.com/yuukilla/nvchad-ui">fork</a>
that contains some minor changes that are not included in original plugin


## Mappings
```lua
{
    "SPC  h "         -- Toggle [H]orizontal terminal
    "SPC  v "         -- Toggle [V]ertical terminal

    "SPC s r"         -- Run Http request
    "SPC s q"         -- Close ship response
    
    "SPC m o"         -- Open Markdown preview
    "SPC m q"         -- Close Markdown preview

    "SPC t o"         -- Open new Tab
    "SPC t q"         -- Close active Tab
    "SPC t n"         -- [N]ext Tab
    "SPC t p"         -- [P]revious Tab

    "SPC t t"         -- Toggle Trouble

    "SPC t c"         -- Toggle colorcolumn
    "SPC t d"         -- Open cmd promt for quick cd

    "SPC g b"         -- Toggle Cuurrent line blame
}
```

## Commands 
```lua
{
    "AutosaveToggle"    -- Toggles file autosave on insert mode leave
    "CCToggle"          -- Toggle colorcolumn display
    "PeekOpen"          -- Opens markdown preview
    "PeekClose"         -- Closes markdown preview

    -- auto commands

    -- QOL autocommand that removes scrolloff in certain filetypes
    -- yes. scrolloff amount is hardcoded, cry about it
    create_autocmd({ "BufEnter" }, {
      callback = function()
        vim.o.scrolloff = (
          vim.bo.filetype == "NvimTree" or
          vim.bo.filetype == "nvdash" or
          vim.bo.filetype == "terminal"
        ) and 0 or 10
      end,
    })

    -- Autocommand that starts discord RPC only in first instance of nvim
    -- neovide unsupported ( but if you want to change 2 to 1 )
    create_autocmd({ "UIEnter" }, {
      callback = function()
        if tonumber(getcmd_output "pgrep nvim | wc -l") == 2 then
          vim.defer_fn(function()
            require("lazy").load { plugins = { "presence.nvim" } }
          end, 0)
        end
      end,
    })

}
```
