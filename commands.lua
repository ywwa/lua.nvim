local create_cmd = vim.api.nvim_create_user_command
local create_autocmd = vim.api.nvim_create_autocmd

-- Autosave files command { yoinked from siduck's dotfiles }
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

-- Toggle colorcolumn display
create_cmd("CCToggle", function()
  vim.g.ccenabled = not vim.g.ccenabled

  if vim.g.ccenabled then
    vim.opt.colorcolumn = "80"
  else
    vim.opt.colorcolumn = "0"
  end
end, {})

-- Commands for "peek.nvim" plugin
create_cmd("PeekOpen", function()
  require("peek").open()
end, {})

create_cmd("PeekClose", function()
  require("peek").close()
end, {})

create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.o.scrolloff = (vim.bo.filetype == "NvimTree" or vim.bo.filetype == "nvdash" or vim.bo.filetype == "terminal")
        and 0
      or 10
  end,
})

local function getcmd_output(command)
  local handle = io.popen(command)
  local output = handle:read "*a"
  handle:close()
  return output
end

create_autocmd({ "UIEnter" }, {
  callback = function()
    if tonumber(getcmd_output "pgrep nvim | wc -l") == 2 then
      vim.defer_fn(function()
        require("lazy").load { plugins = { "presence.nvim" } }
      end, 0)
    end
  end,
})
