local cppdbg_path = os.getenv "CPPDBG_PATH"
if cppdbg_path == nil then return end

require("utils").lazy {
  name = "dap",
  pack = "nvim-dap",
  config = function()
    local dap = require "dap"
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = cppdbg_path,
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
      },
      {
        name = "Attach to gdbserver :1234",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = vim.g.gdbpath,
        cwd = "${workspaceFolder}",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
      },
    }

    dap.configurations.c = dap.configurations.cpp
  end,
}
