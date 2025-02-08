local M = {}

function M.error(cmd, msg, lev)
  lev = lev or vim.log.levels.WARN
  vim.notify('[Git] Failed to exec command: "' .. table.concat(cmd, " ") .. "\n" .. msg .. '"', lev)
end

function M.dir_exec(path, cmd, error_lev)
  local shell_args = { "git", "-C", path, unpack(cmd) }
  local shell_outp = vim.fn.system(shell_args)

  if vim.v.shell_error ~= 0 then
    if error_lev then
      M.error(shell_args, shell_outp, error_lev)
    end
    return {
      success = false,
      output = shell_outp,
    }
  end
  return {
    success = true,
    output = shell_outp,
  }
end

return M
