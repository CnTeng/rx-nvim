local M = {}

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

function M.load(args)
  if args.name ~= nil then require(args.name).setup(args.opts) end

  if args.keys ~= nil then
    for _, key in ipairs(args.keys) do
      require("utils").keymap(key)
    end
  end

  if args.config ~= nil then args.config() end
end

local lazy_group = augroup("lazy", { clear = true })

function M.lazy(args)
  if args.pattern == nil then args.pattern = "*" end

  autocmd(args.events, {
    desc = "Lazy load plugin",
    group = lazy_group,
    once = true,
    pattern = args.pattern,
    callback = function()
      if args.pname ~= nil then vim.cmd.packadd(args.pname) end

      M.load { name = args.name, opts = args.opts, keys = args.keys }

      if args.callback ~= nil then args.callback() end
    end,
  })
end

return M
