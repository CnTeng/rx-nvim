local M = {}

local function rhs_to_fun(rhs)
  local feed = vim.api.nvim_replace_termcodes("<Ignore>" .. rhs, true, true, true)
  vim.api.nvim_feedkeys(feed, "i", false)
end

function M.create(name, lazy, keys, exec_autocmd)
  for _, key in ipairs(keys) do
    local lhs = key[1]
    local rhs = key[2]

    if lazy then
      rhs = type(key[2]) == "function" and function()
        exec_autocmd(name)
        key[2]()
      end or function()
        exec_autocmd(name)
        rhs_to_fun(key[2])
      end
    end

    local mode = key.mode ~= nil and key.mode or "n"
    local opts = type(key[3]) == "string" and { desc = key[3] } or key[3]
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

return M
