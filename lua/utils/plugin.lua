local M = {}

local autocmd = vim.api.nvim_create_autocmd
local getautocmd = vim.api.nvim_get_autocmds
local doautocmd = vim.api.nvim_exec_autocmds

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

local function lazy_cmd(event, pattern, args)
  autocmd(event, {
    desc = "Lazy load plugin",
    once = true,
    pattern = pattern,
    callback = function()
      vim.cmd.packadd(args.pname)

      for _, dep in ipairs(toTable(args.dependencies)) do
        if table.maxn(getautocmd { pattern = dep }) == 0 then
          vim.cmd.packadd(dep)
        else
          doautocmd("User", { pattern = dep })
        end
      end

      M.load(args)
    end,
  })
end

function M.lazy(args)
  lazy_cmd("User", args.name, args)
  if args.event ~= nil then lazy_cmd(args.event, args.pattern, args) end
end

return M
