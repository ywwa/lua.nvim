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
{ -- comented lines -> disabled

    -- User Interface 
     1 "anuvyklack/pretty-fold.nvim",               -- VSCode like folding
     2 "kevinhwang91/nvim-ufo",                     -- VSCode like folding x2
     3 "lukas-reineke/virt-column.nvim",            -- Color column with custom content
     4 "andreadev-it/shade.nvim",                   -- Darken inactive buffers
     5 "zbirenbaum/neodim",                         -- Dim unused functions variables etc
     6 "karb94/neoscroll.nvim",                     -- Smooth scrolling
     7 "Aasim-A/scrollEOF.nvim",                    -- Scroll past End of file
     8 "folke/zen-mode.nvim",                       -- ZenMode
     9 "danilamihailov/beacon.nvim",                -- Jumping cursor animation
    10 "nvimdev/lspsaga.nvim",                      -- Winbar.
    11 "aserowy/tmux.nvim",                         -- Navigation between nvim and tmux panes
    12 "folke/todo-comments.nvim",                  -- Todo comments.

    -- Development
    13 "charkuils/nvim-ship",                       -- Send HTTP request just like in postman
    14 "toppair/peek.nvim",                         -- Markdown preview plugin
    15 "vuki656/package-info.nvim",                 -- Versions of packages in package.json
    16 "vuki656/lazygit.nvim",                      -- Lazygit

    -- Debugging
    17 "folke/trouble.nvim",                        -- Code diagnostics

    -- Language support
    18 "elkowar/yuck.vim",                          -- Eww configuration language

    -- Quality of life
    19 "abecodes/tabout.nvim",                      -- Tab out of "" () [] {} etc.
    20 "max397574/better-escape.nvim",              -- idk how to describe
    21 "numToStr/Comment.nvim",                     -- Comment.
    22 "m-demare/hlargs.nvim",                      -- better highlighting of args
    23 "kevinhwang91/nvim-hlslens",                 -- ok
    24 "shellRaining/hlchunk.nvim",                 -- highlight chuck of code (makes folds look cleaner)
    25 "mrjones2014/nvim-ts-rainbow",               -- Colors for blankline
    26 "nvim-treesitter/nvim-treesitter-context",   -- Keep first line of function, class etc on top
    27 "ofirgall/open.nvim",                        -- I use this to open plugin repos from plugins.lua
    28 "ethanholz/nvim-lastplace",                  -- Restore last place of cursor
    29 "nvim-treesitter/nvim-treesitter-textobjects",
    30 "kylechui/nvim-surround",                    -- Surround

    -- FUN
    31 "andweeb/presence.nvim",                     -- Discord Rich Presence
    32 "alanfortlink/blackjack.nvim",               -- Play classic blackjack inside neovim
    33 "alec-gibson/nvim-tetris",                   -- Play tetris inside neovim
 
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

    "SPC o g"         -- Open plugin repo in browser
}
```

## Commands 
```lua
{
    "AutosaveToggle"    -- Toggles file autosave on insert mode leave
    "ColorcolumnToggle" -- Toggle colorcolumn display

   
    -- Autocommand that handles loading of discordRPC
    create_autocmd({ "UIEnter" }, {
      once = true,
      callback = function()
        local function getcmd_output()
          local handle = io.popen "pgrep nvim | wc -l"
          local output = handle:read "*a"
          handle:close()
          return output
        end

        if tonumber(getcmd_output()) == settings.discord_rpc then
          require("lazy").load { plugins = { "presence.nvim" } }
        end
      end,
    })

    -- Disable colorcolumn in blacklisted filetypes
    create_autocmd({ "FileType" }, {
      callback = function()
        if vim.g.ccenable then
          vim.opt_local.cc = (vim.tbl_contains(settings.blacklist, vim.bo.ft) and "0" or settings.cc_size)
        end
      end,
    })

    -- Disable scrolloff in blacklisted filetypes
    create_autocmd({ "BufEnter" }, {
      callback = function()
        vim.o.scrolloff = (vim.tbl_contains(settings.blacklist, vim.bo.ft) and 0 or settings.so_size)
      end,
    })

    -- Toggle colorcolumn
    create_cmd("ColorcolumnToggle", function()
      vim.g.ccenable = not vim.g.ccenable

      if vim.g.ccenable then
        vim.opt.cc = settings.cc_size
      else
        vim.opt.cc = "0"
      end
    end, {})
}
```

to change values of `colorcolumn`, `scrolloff`, `blacklist` or `discord_rpc` please check `config.lua` file!

## Help
In case you need any help with my config you can contact me in official
<a href="https://discord.com/invite/gADmkJb9Fb">Discord Server</a> or 
<a href="https://t.me/nvchad_tg">Telegram channel</a> of <a href="https://nvchad.com">NvChad</a>
