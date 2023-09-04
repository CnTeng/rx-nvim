local M = {}

function M.create(cmd, exec_autocmd)
  vim.api.nvim_create_user_command(cmd, function(opt)
    vim.api.nvim_del_user_command(cmd)
    exec_autocmd()
    vim.cmd[opt.name](opt.args)
  end, {
    nargs = "*",
    complete = function(_, line)
      exec_autocmd()

      return vim.fn.getcompletion(line, "cmdline")
    end,
  })
end

return M
