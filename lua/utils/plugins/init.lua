local plugins = {
  name = nil,
  lazy = true,
  pack = nil,
  event = nil,
  ft = nil,
  keys = nil,
  before = nil,
  after = nil,
  init = nil,
  opts = nil,
  config = nil,
}

function plugins:new(opts)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  self.name = opts.name
  if opts.lazy ~= nil then self.lazy = opts.lazy end
  self.pack = opts.pack
  self.event = opts.event

  if opts.cmd ~= nil then require("utils.plugins.cmd"):new(opts.cmd) end

  self.ft = opts.ft
  self.keys = opts.keys
  self.before = opts.before
  self.after = opts.after
  self.init = opts.init
  self.opts = opts.opts
  self.config = opts.config
  return o
end

return plugins
