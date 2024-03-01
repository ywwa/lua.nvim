return function (_, opts)
  local cmp = require "cmp"

  opts.mapping["<CR>"] = nil
  opts.mapping["<C-y>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  }

  table.remove(opts.sources, 1)
  table.insert(opts.sources, 1, { name = "nvim_lsp", max_item_count = 30 })
  table.insert(opts.sources, 4, { name = "codeium" })
  table.insert(opts.sources, { name = "emoji" })

  cmp.setup(opts)
end
