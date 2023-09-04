local M = {}

local function create_autocmd(event, pattern, opts, load_plugin)
  vim.api.nvim_create_autocmd(event, {
    group = opts.name,
    pattern = pattern,
    callback = function()
      vim.api.nvim_clear_autocmds { group = opts.name }

      if opts.lazy then vim.cmd.packadd(opts.pack) end

      load_plugin(opts)
    end,
  })
end

function M.create(opts, callback)
  vim.api.nvim_create_augroup(opts.name, { clear = true })

  create_autocmd("User", opts.name, opts, callback)

  if opts.event == nil then return end

  create_autocmd(opts.event, opts.ft, opts, callback)
end

function M.exec(name)
  vim.api.nvim_exec_autocmds("User", {
    pattern = name,
    modeline = false,
  })
end

return M
