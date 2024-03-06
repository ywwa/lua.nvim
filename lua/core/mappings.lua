local map = vim.keymap.set

map("n", "<ESC>", ":noh<CR>", { desc = "Clear highlights", silent = true })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down", silent = true })
map("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move line up", silent = true })

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
