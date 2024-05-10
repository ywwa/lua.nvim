local api = vim.api

api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = api.nvim_buf_get_name(args.buf)
    local buftype = api.nvim_buf_get_option(args.buf, "buftype")

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        api.nvim_exec_autocmds("FileType", {})
        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end, 0)
    end
  end,
})
