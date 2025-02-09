local api = vim.api
local g = vim.g
local set_buf = api.nvim_set_current_buf
local conf = require("modules.config").terminal

local M = {}

g.mod_terms = {}
g.hterm = false
g.vterm = false

local pos_data = {
  sp = { resize = "height", area = "lines" },
  vsp = { resize = "width", area = "columns" },
  ["bo sp"] = { resize = "height", area = "lines" },
  ["bo vsp"] = { resize = "width", area = "columns" },
}

local function save_term_info(index, val)
  local terms_list = g.mod_terms
  terms_list[tostring(index)] = val
  g.mod_terms = terms_list
end

local function opts_to_id(id)
  for _, opts in pairs(g.mod_terms) do
    if opts.id == id then
      return opts
    end
  end
end

local function create_float(buffer, float_opts)
  local opts = vim.tbl_deep_extend("force", conf.float, float_opts or {})

  opts.width = math.ceil(opts.width * vim.o.columns)
  opts.height = math.ceil(opts.height * vim.o.lines)
  opts.row = math.ceil(opts.row * vim.o.lines)
  opts.col = math.ceil(opts.col * vim.o.columns)

  api.nvim_open_win(buffer, true, opts)
end

local function format_cmd(cmd)
  return type(cmd) == "string" and cmd or cmd()
end

M.display = function(opts)
  if opts.pos == "float" then
    create_float(opts.buf, opts.float_opts)
  else
    vim.cmd(opts.pos)
  end

  local win = api.nvim_get_current_win()
  opts.win = win

  vim.bo[opts.buf].buflisted = false
  vim.bo[opts.buf].ft = "Term_" .. opts.pos:gsub(" ", "")
  vim.cmd "startinsert"

  if (opts.pos == "sp" and not g.hterm) or (opts.pos == "vsp" and not g.vterm) or (opts.pos ~= "float") then
    local pos_type = pos_data[opts.pos]
    local size = opts.size and opts.size or conf.sizes[opts.pos]
    local new_size = vim.o[pos_type.area] * size
    api["nvim_win_set_" .. pos_type.resize](0, math.floor(new_size))
  end

  api.nvim_win_set_buf(win, opts.buf)

  local winopts = vim.tbl_deep_extend("force", conf.winopts, opts.winopts or {})

  for k, v in pairs(winopts) do
    vim.wo[win][k] = v
  end

  save_term_info(opts.buf, opts)
end

local function create(opts)
  local buf_exists = opts.buf
  opts.buf = opts.buf or api.nvim_create_buf(false, true)

  local shell = conf.shell or vim.o.shell
  local cmd = { shell }

  if opts.cmd and opts.buf then
    cmd = { shell, "-c", format_cmd(opts.cmd) .. "; " .. shell }
  else
    cmd = { shell }
  end

  M.display(opts)

  save_term_info(opts.buf, opts)

  if not buf_exists then
    vim.fn.termopen(cmd, opts.termopen_opts or { detach = false })
  end

  g.hterm = opts.pos == "sp"
  g.vterm = opts.pos == "vsp"
end

M.new = function(opts)
  create(opts)
end

M.toggle = function(opts)
  local x = opts_to_id(opts.id)
  opts.buf = x and x.buf or nil

  if (x == nil or not api.nvim_buf_is_valid(x.buf)) or vim.fn.bufwinid(x.buf) == -1 then
    create(opts)
  else
    api.nvim_win_close(x.win, true)
  end
end

M.runner = function(opts)
  local x = opts_to_id(opts.id)
  local clear_cmd = opts.clear_cmd or "clear; "
  opts.buf = x and x.buf or nil

  if x == nil then
    create(opts)
  else
    if vim.fn.bufwinid(x.buf) == -1 then
      M.display(opts)
    end

    local cmd = format_cmd(opts.cmd)

    if x.buf == api.nvim_get_current_buf() then
      set_buf(g.buf_history(#g.buf_history - 1))
      cmd = format_cmd(opts.cmd)
      set_buf(x.buf)
    end

    local job_id = vim.b[x.buf].terminal_job_id
    vim.api.nvim_chan_set(job_id, clear_cmd .. cmd .. " \n")
  end
end

api.nvim_create_autocmd("TermClose", {
  callback = function(args)
    save_term_info(args.buf, nil)
  end,
})

return M
