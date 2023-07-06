local create_cmd = vim.api.nvim_create_user_command
local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup
local del_augroup = vim.api.nvim_del_augroup_by_name

local settings = require("custom.chadrc").custom

-- Toggle AutoSave
create_cmd("AutoSaveToggle", function()
  vim.g.CmdAutoSave = not vim.g.CmdAutoSave

  if vim.g.CmdAutoSave then
    create_autocmd({ "InsertLeave", "TextChanged" }, {
      group = create_augroup("Autosave", {}),
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
    del_augroup "Autosave"
  end
end, {})

-- Toggle ColorColumn
create_cmd("ColorColumnToggle", function()
  vim.g.CmdColorColumn = not vim.g.CmdColorColumn

  if vim.g.CmdColorColumn then
    vim.opt.cc = settings.colorcolumn
  else
    vim.opt.cc = "0"
  end
end, {})

create_cmd("OpenRepo", function()
  local currentline = vim.fn.getline "."
  local reponame = vim.fn.matchstr(currentline, '".*"')
  local url = "https://github.com/" .. reponame

  vim.cmd("silent !xdg-open " .. url)
end, {})
