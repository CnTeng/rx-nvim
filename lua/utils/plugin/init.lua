local M = {}

local autocmd = require "utils.plugin.autocmd"
local cmd = require "utils.plugin.cmd"
local keys = require "utils.plugin.keys"

local function load_deps(deps)
  local function to_table(v) return (type(v) == "string" or v == nil) and { v } or v end

  for _, dep in ipairs(to_table(deps)) do
    autocmd.exec(dep)
  end
end

function M.load(opts)
  if opts.init ~= nil then opts.init() end

  if opts.before ~= nil then load_deps(opts.before) end

  if type(opts.opts) == "function" then opts.opts = opts.opts() end

  if opts.name ~= nil and (opts.opts ~= nil or opts.config == true) then require(opts.name).setup(opts.opts) end

  if type(opts.config) == "function" then opts.config() end

  if opts.after ~= nil then load_deps(opts.after) end
end

function M.create(opts)
  if opts.lazy == nil then opts.lazy = true end

  opts.autocmd = autocmd.create(opts, M.load)

  if opts.cmd ~= nil then opts.cmd = cmd.create(opts.cmd, autocmd.exec) end

  if not opts.lazy then autocmd.exec(opts.name) end

  if opts.keys ~= nil then keys.create(opts.name, opts.lazy, opts.keys, autocmd.exec) end
end

return M
