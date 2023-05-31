---@diagnostic disable: need-check-nil
local create_cmd = vim.api.nvim_create_user_command
local create_autocmd = vim.api.nvim_create_autocmd

local settings = require("custom.config").settings

-- Toggle autosave
create_cmd("AutosaveToggle", function()
  vim.g.autosave = not vim.g.autosave

  if vim.g.autosave then
    create_autocmd({ "InsertLeave", "TextChanged" }, {
      group = vim.api.nvim_create_augroup("Autosave", {}),
      callback = function()
        if vim.api.nvim_buf_get_name(0) and #vim.bo.buftype == 0 then
          vim.cmd "silent w"
          vim.api.nvim_echo({
            { "󰄳", "LazyProgressDone" },
            { " file autosaved at " .. os.date "%I:%M %p" },
          }, false, {})

          vim.defer_fn(function()
            vim.api.nvim_echo({}, false, {})
          end, 1800)
        end
      end,
    })
  else
    vim.api.nvim_del_augroup_by_name "Autosave"
  end
end, {})

-- Toggle colorcolumn
create_cmd("ColorcolumnToggle", function()
  vim.g.ccenable = not vim.g.ccenable

  if vim.g.ccenable then
    vim.opt.cc = settings.cc_size
  else
    vim.opt.cc = "0"
  end
end, {})

-- Disable scrolloff in blacklisted filetypes
create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.o.scrolloff = (vim.tbl_contains(settings.blacklist, vim.bo.ft) and 0 or settings.so_size)
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

-- Enable discord rich presence
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

-- Disable arrow keys
vim.keymap.set({ "n", "v", "x", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v", "x", "i" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v", "x", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v", "x", "i" }, "<Right>", "<Nop>")
