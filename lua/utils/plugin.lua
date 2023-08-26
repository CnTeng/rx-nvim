local M = {}

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

function M.load(args)
  if args.init ~= nil then args.init() end

  if type(args.opts) == "function" then args.opts = args.opts() end

  if args.name ~= nil then require(args.name).setup(args.opts) end

  if args.keys ~= nil then
    for _, key in ipairs(args.keys) do
      require("utils").keymap(key)
    end
  end

  if args.config ~= nil then args.config() end
end

local lazy_group = augroup("lazy load", { clear = true })

function M.lazy(args)
  if args.pattern == nil then args.pattern = "*" end
  if args.setup == nil then args.setup = true end

  autocmd(args.event, {
    desc = "Lazy load plugin",
    group = lazy_group,
    once = true,
    pattern = args.pattern,
    callback = function()
      local pack = args.name:gsub("_", "-"):lower()

      vim.cmd.packadd(pack .. ".nvim")
      vim.cmd.packadd("nvim-" .. pack)
      vim.cmd.packadd("vim-" .. pack)
      vim.cmd.packadd(pack)

      if not args.setup then args.name = nil end
      M.load(args)
    end,
  })
end

return M
