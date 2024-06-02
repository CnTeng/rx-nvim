local M = {}

function M.opts(name)
  local plugin = require("lazy.core.config").spec.plugins[name]

  if not plugin then
    return {}
  end

  return require("lazy.core.plugin").values(plugin, "opts", false)
end

return M
