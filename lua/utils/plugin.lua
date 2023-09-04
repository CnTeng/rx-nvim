local M = {}

local function exec_autocmd(name) vim.api.nvim_exec_autocmds("User", { pattern = name, modeline = false }) end

local function load_deps(deps)
  local function to_table(v) return (type(v) == "string" or v == nil) and { v } or v end

  for _, dep in ipairs(to_table(deps)) do
    exec_autocmd(dep)
  end
end

local function load_deps_pack(deps)
  local function to_table(v) return (type(v) == "string" or v == nil) and { v } or v end

  for _, dep in ipairs(to_table(deps)) do
    vim.cmd.pack(dep)
  end
end

local function load(opts)
  if opts.init ~= nil then opts.init() end

  if opts.packbefore ~= nil then load_deps_pack(opts.packbefore) end
  if opts.before ~= nil then load_deps(opts.before) end

  if type(opts.opts) == "function" then opts.opts = opts.opts() end

  if opts.name ~= nil and (opts.opts ~= nil or opts.config == true) then require(opts.name).setup(opts.opts) end

  if type(opts.config) == "function" then opts.config() end

  if opts.packafter ~= nil then load_deps_pack(opts.packafter) end
  if opts.after ~= nil then load_deps(opts.after) end
end

local function create_autocmd(event, pattern, opts)
  vim.api.nvim_create_autocmd(event, {
    group = opts.name,
    pattern = pattern,
    callback = function()
      vim.api.nvim_clear_autocmds { group = opts.name }

      if opts.lazy then vim.cmd.packadd(opts.pack) end

      load(opts)
    end,
  })
end

local function lazy_keys(name, lazy, keys)
  local function rhs_to_fun(rhs)
    local feed = vim.api.nvim_replace_termcodes("<Ignore>" .. rhs, true, true, true)
    vim.api.nvim_feedkeys(feed, "i", false)
  end

  for _, key in ipairs(keys) do
    local lhs = key[1]
    local rhs = key[2]

    if lazy then
      rhs = type(key[2]) == "function" and function()
        exec_autocmd(name)
        key[2]()
      end or function()
        exec_autocmd(name)
        rhs_to_fun(key[2])
      end
    end

    local mode = key.mode ~= nil and key.mode or "n"
    local opts = type(key[3]) == "string" and { desc = key[3] } or key[3]
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function lazy_autocmd(opts)
  vim.api.nvim_create_augroup(opts.name, { clear = true })

  create_autocmd("User", opts.name, opts)

  if opts.event == nil then return end
  create_autocmd(opts.event, opts.ft, opts)
end

local function lazy_cmd(opts)
  vim.api.nvim_create_user_command(opts.cmd, function(opt)
    vim.api.nvim_del_user_command(opts.cmd)

    exec_autocmd(opts.name)

    vim.cmd[opt.name](opt.args)
  end, {
    nargs = "*",
    complete = function(_, line)
      exec_autocmd(opts.name)
      return vim.fn.getcompletion(line, "cmdline")
    end,
  })
end

-- opts: name lazy pack event cmd ft keys before after init opts config
function M.lazy(opts)
  if opts.lazy == nil then opts.lazy = true end
  lazy_autocmd(opts)

  if opts.cmd ~= nil then lazy_cmd(opts) end

  if not opts.lazy then exec_autocmd(opts.name) end

  if opts.keys ~= nil then lazy_keys(opts.name, opts.keys, opts.keys) end
end

return M
