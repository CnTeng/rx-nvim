local M = {}

local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup
local exec_autocmds = vim.api.nvim_exec_autocmds
local clear_autocmds = vim.api.nvim_clear_autocmds
local packadd = vim.cmd.packadd

local function lazy_keymap(name, key)
  local lhs = key[1]
  local rhs = type(key[2]) == "function"
      and function()
        vim.api.nvim_exec_autocmds("User", { pattern = name, modeline = false })
        key[2]()
      end
    or function()
      vim.api.nvim_exec_autocmds("User", { pattern = name, modeline = false })
      local feed = vim.api.nvim_replace_termcodes("<Ignore>" .. key[2], true, true, true)
      vim.api.nvim_feedkeys(feed, "i", false)
    end
  local mode = key.mode ~= nil and key.mode or "n"
  local opts = type(key[3]) == "string" and { desc = key[3] } or key[3]
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.load(args)
  if args.init ~= nil then args.init() end
  if args.setup == nil then args.setup = true end

  if type(args.opts) == "function" then args.opts = args.opts() end

  if args.name ~= nil and args.setup == true then require(args.name).setup(args.opts) end

  if args.keys ~= nil then
    for _, key in ipairs(args.keys) do
      lazy_keymap(args.name, key)
    end
  end

  if args.config ~= nil then args.config() end
end

local function toTable(v)
  if type(v) == "string" or v == nil then
    return { v }
  else
    return v
  end
end

local function load_dep(deps)
  if deps == nil then return end

  for _, dep in ipairs(toTable(deps)) do
    exec_autocmds("User", { pattern = dep, modeline = false })
  end
end

local function lazy_load(event, pattern, args)
  create_autocmd(event, {
    group = args.name,
    pattern = pattern,
    callback = function()
      clear_autocmds { group = args.name }

      local t_start = os.clock()
      packadd(args.pname)

      local t_end = os.clock()
      print(args.name .. ": " .. tostring((t_end - t_start) * 1000) .. "ms")

      load_dep(args.before)
      M.load(args)
      load_dep(args.after)
    end,
  })
end

function M.lazy(args)
  if args.keys ~= nil then
    for _, key in ipairs(args.keys) do
      lazy_keymap(args.name, key)
    end
  end
  create_augroup(args.name, { clear = true })

  lazy_load("User", args.name, args)

  if args.event == nil then return end
  lazy_load(args.event, args.pattern, args)
end

function M.lazy_cmd(opts)
  vim.api.nvim_create_user_command(opts.cmd, function(opt)
    vim.api.nvim_del_user_command(opts.cmd)

    packadd(opts.pname)
    M.load(opts)

    vim.cmd[opt.name](opt.args)
  end, {
    nargs = "*",
    complete = function(_, line)
      packadd(opts.pname)
      M.load(opts)

      return vim.fn.getcompletion(line, "cmdline")
    end,
  })
end

return M
