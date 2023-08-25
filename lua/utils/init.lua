local M = {}

function M.keymap(key)
  local lhs = key[1]
  local rhs = key[2]
  local mode = key.mode ~= nil and key.mode or "n"
  local opts = type(key[3]) == "string" and { desc = key[3] } or key[3]
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
