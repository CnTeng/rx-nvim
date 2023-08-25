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
      vim.cmd.packadd(pack)

      args.name = args.setup and args.name or nil
      M.load(args)
    end,
  })
end

return M
