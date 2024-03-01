<h1 align="center">chadConfig</h1>
<p align="center">
    <a style="color: #DFC5FE" href="https://nvchad.com">NvChad</a>'s config for branch <b style="color: #DFC5FE">v3.0</b>
</p>

Personal NvChad config for web development.

### Installation

```shell
$ git clone -b v3.0 https://github.com/NvChad/NvChad ~/.config/nvim
$ git clone https://github.com/ywwa/chadConfig ~/.config/nvim/lua/custom && nvim
```

### Plugins

All plugins are stored in `plugins/` directory. All plugins are categorized.

`plugins/init.lua` -- Contains mostly overrides for `Base` NvChad plugins.

```lua
local init = {
  { "neovim/nvim-lspconfig",
    dependencies = { "pmizio/typescript-tools.nvim" }
  },

  {
    "nvim-treesitter/nvim-treesitter",
      dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" }
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" }
  },

  {
    "windwp/nvim-autopairs",
    enabled = false
  }
}
```

```lua
local tools = {
  { "numToStr/Navigator.nvim" },
  { "ethanholz/nvim-lastplace" },
  { "stevearc/conform.nvim" },
  { "folke/trouble.nvim" },
  {
    "roobert/surround-ui.nvim",
    dependencies = { "kylechui/nvim-surround" }
  },
  { "folke/twilight.nvim" },
  { "folke/neodev.nvim" },
  { "nacro90/numb.nvim" },
  { "folke/zen-mode.nvim" },
  { "kevinhwang91/nvim-hlslens" },
  { "toppair/peek.nvim" },
  { "yuki656/package-info.nvim" },
  { "ExaFunction/codeium.nvim" },
  { "laytan/tailwind-sorter.nvim" },
  { "mistricky/codesnap.nvim" },
  { "rest-nvim/rest.nvim" },
}
```

```lua
local ui = {
  { "folke/todo-comments.nvim" },
  { "xiyaowong/virtcolumn.nvim" },
  { "m-demare/hlargs.nvim" },
  { "karb94/neoscroll.nvim" },
  { "Aasim-A/scrollEOF.nvim" },
  {
    "anuvyklack/pretty-fold.nvim",
    dependencies = {
      "anuvyklack/keymap-amend.nvim",
      "anuvyklack/fold-preview.nvim",
    }
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    }
  },
}
```

```lua
local extras = {
  { "IogaMaster/neocord" }
}
```

### Utilities

`utils/` contains some helpful utilities

#### colorcolumn [ cc.lua ]

```lua
-- toggle on/off colorcolumn ( default: 80, to change check chadrc.lua )
require("custom.utils.cc").toggleCC()
```

#### scrolloff [ so.lua ]

Utility that setsup scrolloff and disables it in windows/buffers what are blacklisted

To change its size view `chadrc.lua` `M.utils` table.


#### neocord ( discordrpc ) [ rpc.lua ]

Utility that loads `neocord` plugin.
by default it loads if its first instance of neovim

```bash
pgrep nvim | wc -l # must be 2
```

To disable plugin at all change `chadrc.lua` `M.utils.enable_rpc` to `false`
