local M = {}

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

function M.load_plugin(args)
  if args.name ~= nil then require(args.name).setup(args.opts) end
  if args.keys ~= nil then
    for _, v in ipairs(args.keys) do
      vim.keymap.set(v[1], v[2], v[3], v[4])
    end
  end
  if args.config ~= nil then args.config() end
end

local lazyload_group = augroup("lazyload", { clear = true })

function M.lazy_plugin(args)
  if args.pattern == nil then args.pattern = "*" end

  autocmd(args.events, {
    desc = "Lazy load plugin",
    group = lazyload_group,
    once = true,
    pattern = args.pattern,
    callback = function()
      if args.pname ~= nil then vim.cmd.packadd(args.pname) end

      M.load_plugin { name = args.name, opts = args.opts, keys = args.keys }

      if args.callback ~= nil then args.callback() end
    end,
  })
end

return M
