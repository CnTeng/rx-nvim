local M = {}

function M.create(cmds, exec_autocmd)
  require("utils.plugin").to_table(cmds)
  local to_table = require("utils.plugin.utils").to_table

  for _, cmd in ipairs(to_table(cmds)) do
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
end

return M
