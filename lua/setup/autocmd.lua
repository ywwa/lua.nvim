local autocmd = vim.api.nvim_create_autocmd

autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})

autocmd({ "User" }, {
  desc = "Reverse&Reapply local patches on updating/installing plugins.",
  group = vim.api.nvim_create_augroup("LazyPatches", {}),
  pattern = {
    "LazyInstall",
    "LazyInstallPre",
    "LazyUpdate",
    "LazyUpdatePre",
    "LazySync",
    "LazySyncPre",
    "LazyRestore",
    "LazyRestorePre",
  },
  callback = function(info)
    local git = require "utils.git"
    local patchesDir = vim.fs.joinpath(vim.fn.stdpath "config", "patches")
    local pluginDir = vim.fs.joinpath(vim.fn.stdpath "data", "lazy")

    vim.g.__lzSync = vim.g.__lzSync or info.match == "LazySyncPre"

    -- do nothing
    if vim.g.__lzSync and not vim.startswith(info.match, "LazySync") then
      return
    end

    if info.match == "LazySync" then
      vim.g.__lzSync = nil
    end

    for patch in vim.fs.dir(patchesDir) do
      local patchPath = vim.fs.joinpath(patchesDir, patch)
      local pluginPath = vim.fs.joinpath(pluginDir, (patch:gsub("%.patch$", "")))
      if vim.uv.fs_stat(pluginPath) then
        git.dir_exec(pluginPath, { "restore", "." })
        if not vim.endswith(info.match, "Pre") then
          vim.notify("[PATCH] Applying patch: " .. patch)
          git.dir_exec(pluginPath, {
            "apply",
            "--ignore-space-change",
            patchPath,
          }, vim.log.levels.WARN)
        end
      end
    end
  end,
})
