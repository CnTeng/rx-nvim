local cmd = { name = nil }

function cmd:new(name)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  self.name = name

  vim.api.nvim_create_user_command(self.name, function(opt)
    vim.api.nvim_del_user_command(self.name)

    vim.api.nvim_exec_autocmds("User", {
      pattern = self.name,
      modeline = false,
    })

    vim.cmd[opt.name](opt.args)
  end, {
    nargs = "*",
    complete = function(_, line)
      vim.api.nvim_exec_autocmds("User", {
        pattern = self.name,
        modeline = false,
      })

      return vim.fn.getcompletion(line, "cmdline")
    end,
  })

  return o
end

return cmd
