local M = {}

local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup
local exec_autocmds = vim.api.nvim_exec_autocmds
local clear_autocmds = vim.api.nvim_clear_autocmds

function M.load(args)
  if args.init ~= nil then args.init() end
  if args.setup == nil then args.setup = true end

  if type(args.opts) == "function" then args.opts = args.opts() end

  if args.name ~= nil and args.setup == true then require(args.name).setup(args.opts) end

  if args.keys ~= nil then
    for _, key in ipairs(args.keys) do
      require("utils").keymap(key)
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
      local t_start = os.clock()
      clear_autocmds { group = args.name }

      vim.cmd.packadd(args.pname)

      load_dep(args.before)
      M.load(args)
      load_dep(args.after)

      local t_end = os.clock()
      print(args.name .. ": " .. tostring((t_end - t_start) * 1000) .. "ms")
    end,
  })
end

function M.lazy(args)
  create_augroup(args.name, { clear = true })

  lazy_load("User", args.name, args)

  if args.event == nil then return end
  lazy_load(args.event, args.pattern, args)
end

return M
