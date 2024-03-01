---@diagnostic disable: undefined-field
local map = vim.keymap.set

-- formatting
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "Lsp Formatting" })

-- move lines
map(
  { "n", "i", "v", "x" },
  "<A-j>",
  "<cmd> m+1<CR>==",
  { desc = "Typing Move line up" }
)
map(
  { "n", "i", "v", "x" },
  "<A-k>",
  "<cmd> m-2<CR>==",
  { desc = "Typing Move line down" }
)

-- indents
map({ "v" }, ">", ">gv", { desc = "Indent Line Right" })
map({ "v" }, "<", "<gv", { desc = "Indent Line Left" })

-- navigation
map({ "n", "t" }, "<C-h>", function()
  require("Navigator").left()
end, { desc = "Switch Left" })

map({ "n", "t" }, "<C-j>", function()
  require("Navigator").down()
end, { desc = "Switch Down" })

map({ "n", "t" }, "<C-k>", function()
  require("Navigator").up()
end, { desc = "Switch Up" })

map({ "n", "t" }, "<C-l>", function()
  require("Navigator").right()
end, { desc = "Switch Right" })

-- toggle
map("n", "<leader>tt", function()
  require("trouble").toggle()
end, { desc = "Toggle Trouble" })

vim.keymap.set("n", "<leader>tc", function()
  require("custom.utils.cc").toggleCC()
end, { desc = "Toggle Colorcolumn" })

-- TODO: kylechui/nvim-surround mappings

-- peek
map("n", "<leader>po", function()
  require("peek").open()
end, { desc = "Peek Open" })

map("n", "<leader>pq", function()
  require("peek").close()
end, { desc = "Peek Close" })
