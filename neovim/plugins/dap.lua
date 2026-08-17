return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "jbyuki/one-small-step-for-vimkind" },
  },
  -- stylua: ignore
  keys = {
    { "<leader>dR", function() require("dap").run_to_cursor() end, desc = "Run to Cursor", },
    { "<leader>dE", function() require("dapui").eval(vim.fn.input "[Expression] > ") end, desc = "Evaluate Input", },
    { "<leader>dC", function() require("dap").set_breakpoint(vim.fn.input "[Condition] > ") end, desc = "Conditional Breakpoint", },
    { "<leader>dU", function() require("dapui").toggle() end, desc = "Toggle UI", },
    { "<leader>db", function() require("dap").step_back() end, desc = "Step Back", },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue", },
    { "<leader>dd", function() require("dap").disconnect() end, desc = "Disconnect", },
    { "<leader>de", function() require("dapui").eval() end, mode = {"n", "v"}, desc = "Evaluate", },
    { "<leader>dg", function() require("dap").session() end, desc = "Get Session", },
    { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variables", },
    { "<leader>dS", function() require("dap.ui.widgets").scopes() end, desc = "Scopes", },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into", },
    { "<leader>do", function() require("dap").step_over() end, desc = "Step Over", },
    { "<leader>dp", function() require("dap").pause.toggle() end, desc = "Pause", },
    { "<leader>dq", function() require("dap").close() end, desc = "Quit", },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL", },
    { "<leader>ds", function() require("dap").continue() end, desc = "Start", },
    { "<leader>dt", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint", },
    { "<leader>dx", function() require("dap").terminate() end, desc = "Terminate", },
    { "<leader>du", function() require("dap").step_out() end, desc = "Step Out", },

    { "<leader>dl", function() require("dap").list_breakpoints() end, desc = "List Breakpoints", },
    { "<leader>dz", function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints", },
  },
  opts = {
    setup = {
      -- osv = function(_, _)
      --   require("plugins.dap.lua").setup()
      -- end,
    },
  },
  config = function(plugin, opts)
    -- Breakpoint
    vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "DapBreakpoint",
      numhl = "DapBreakpoint",
    })

    -- Breakpoint condicional
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "",
      texthl = "DapBreakpointCondition",
      numhl = "DapBreakpointCondition",
    })

    -- Breakpoint rejeitado
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "",
      texthl = "DapBreakpointRejected",
      numhl = "DapBreakpointRejected",
    })

    -- Logpoint
    vim.fn.sign_define("DapLogPoint", {
      text = "",
      texthl = "DapLogPoint",
      numhl = "DapLogPoint",
    })

    -- Linha atual (parado no debugger)
    vim.fn.sign_define("DapStopped", {
      text = "",
      texthl = "DapStopped",
      linehl = "DapStoppedLine",
      numhl = "DapStopped",
    })

    vim.api.nvim_set_hl(0, "DapBreakpoint", {
      fg = "#E51400",
    })

    vim.api.nvim_set_hl(0, "DapBreakpointCondition", {
      fg = "#FFCC00",
    })

    vim.api.nvim_set_hl(0, "DapBreakpointRejected", {
      fg = "#888888",
    })

    vim.api.nvim_set_hl(0, "DapLogPoint", {
      fg = "#3FB950",
    })

    vim.api.nvim_set_hl(0, "DapStopped", {
      fg = "#FFCC00",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "DapStoppedLine", {
      bg = "#2A2D2E",
    })
    require("nvim-dap-virtual-text").setup {
      commented = true,
    }

    local dap, dapui = require "dap", require "dapui"
    dapui.setup {}

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    dap.adapters.delve = function(callback, config)
      if config.mode == "remote" and config.request == "attach" then
        callback {
          type = "server",
          host = config.host or "127.0.0.1",
          port = config.port or "38697",
        }
      else
        callback {
          type = "server",
          port = "${port}",
          executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
            detached = vim.fn.has "win32" == 0,
          },
        }
      end
    end

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
        console = "externalTerminal",
      },
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
        console = "externalTerminal",
      },
      -- works with go.mod packages and sub packages
      {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
        console = "externalTerminal",
      },
    }

    -- set up debugger
    for k, _ in pairs(opts.setup) do
      opts.setup[k](plugin, opts)
    end
  end,
}
