---@type LazyPluginSpec[]
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "igorlfs/nvim-dap-view", opts = {} },
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },
    keys = {
      {
        "<leader>dd",
        function()
          require("dap-view").toggle()
        end,
        desc = "Toggle UI",
      },

      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },

      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },

      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Condition breakpoint",
      },

      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },

      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to cursor",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run last",
      },

      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
    },
    opts = {
      signs = {
        DapBreakpoint = { "󰄯", "DiagnosticError" },
        DapBreakpointCondition = { "󰘥", "DiagnosticError" },
        DapLogPoint = { "󰰎", "DiagnosticInfo" },
        DapStopped = { "󰁔", "DiagnosticWarn", "debugPC" },
        DapBreakpointRejected = { "󰗖", "DiagnosticError" },
      },
    },
    config = function(_, opts)
      for name, sign in pairs(opts.signs) do
        vim.fn.sign_define(name, { text = sign[1], texthl = sign[2], linehl = sign[3], numhl = sign[3] })
      end

      local dap = require("dap")

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "lldb-dap",
          args = { "--port", "${port}" },
        },
      }

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap", "-q" },
      }

      dap.configurations.c = {
        {
          name = "lldb: Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
        {
          name = "lldb: Attach to process",
          type = "codelldb",
          request = "attach",
          pid = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },

        {
          name = "gdb: Launch file",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
        {
          name = "gdb: Attach to process",
          type = "gdb",
          request = "attach",
          pid = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c
    end,
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "Debug main.go",
          request = "launch",
          program = "${workspaceFolder}/main.go",
          args = function()
            return coroutine.create(function(dap_run_co)
              local args = {}
              vim.ui.input({ prompt = "Args: " }, function(input)
                args = vim.split(input or "", " ")
                coroutine.resume(dap_run_co, args)
              end)
            end)
          end,
        },
      },
    },
  },
}
