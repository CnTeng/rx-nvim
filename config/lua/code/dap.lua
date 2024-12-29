---@type LazyPluginSpec[]
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },
    keys = {
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

      for lang, adapter in pairs(opts.adapters) do
        dap.adapters[lang] = adapter
      end

      for lang, configuration in pairs(opts.configurations) do
        dap.configurations[lang] = configuration
      end

      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = "nvim-neotest/nvim-nio",
    keys = {
      {
        "<leader>dd",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle full UI",
      },
      {
        mode = { "n", "v" },
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Evaluate expression",
      },
    },
    opts = {
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = "",
      },
    },
  },
}
