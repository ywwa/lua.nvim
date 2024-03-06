local map = vim.keymap.set

map("n", "<ESC>", "<cmd>noh<CR>", { desc = "Clear highlights", silent = true })

map(
  "v",
  "J",
  "<cmd>m '>+1<CR>gv=gv",
  { desc = "Move line down", silent = true }
)
map("v", "K", "<cmd>m '>-2<CR>gv=gv", { desc = "Move line up", silent = true })

-- indent in visual mode
map({ "v" }, ">", ">gv", { desc = "Indent Line Right" })
map({ "v" }, "<", "<gv", { desc = "Indent Line Left" })

map("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move End of line" })
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })

-- leave terminal mode
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })

-- format code
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "Format code", silent = true })

map({ "n", "t" }, "<C-h>", function()
  require("Navigator").left()
end, { desc = "Move left" })
map({ "n", "t" }, "<C-j>", function()
  require("Navigator").down()
end, { desc = "Move down" })
map({ "n", "t" }, "<C-k>", function()
  require("Navigator").up()
end, { desc = "Move up" })
map({ "n", "t" }, "<C-l>", function()
  require("Navigator").right()
end, { desc = "Move right" })

-- telescope mappings
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Telescope find_files" })

map("n", "<leader>lg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Telescope live_grep" })
