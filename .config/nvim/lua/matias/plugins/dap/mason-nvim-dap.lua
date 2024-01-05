return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    local mason_dap = require("mason-nvim-dap")
    mason_dap.setup({
      ensure_installed = { "python", "codelldb", "node2" },
      handlers = {
        function(config)
          -- Keep original functionality
          require("mason-nvim-dap").default_setup(config)
        end,
        cppdbg = function(set)
          set.configurations = {
            {
              name = "CPPDBG: Relative Workspace",
              type = "cppdbg",
              request = "launch",
              runInTerminal = true,
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = function()
                return vim.fn.input("Workspace: ", vim.fn.getcwd() .. "/", "file")
              end,
              stopOnEntry = true,
              args = function()
                local input_args = vim.fn.input("Args to executable: ")
                return vim.split(input_args, " ")
              end,
            },
          }
          require("mason-nvim-dap").default_setup(set) -- don't forget this!
        end,

        codelldb = function(set)
          set.configurations = {
            {
              name = "LLDB: Relative",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = function()
                return vim.fn.input("Workspace: ", vim.fn.getcwd() .. "/", "file")
              end,
              stopOnEntry = true,
              runInTerminal = true,
              args = function()
                local input_args = vim.fn.input("Args to executable: ")
                return vim.split(input_args, " ")
              end,
            },
          }
          require("mason-nvim-dap").default_setup(set) -- don't forget this!
        end,

        python = function(set)
          set.configurations = {
            {
              name = "DebugPy: Relative",
              type = "python",
              request = "launch",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = function()
                return vim.fn.input("Workspace: ", vim.fn.getcwd() .. "/", "file")
              end,
              stopOnEntry = true,
              runInTerminal = true,
              args = function()
                local input_args = vim.fn.input("Args to executable: ")
                return vim.split(input_args, " ")
              end,
            },
          }
          require("mason-nvim-dap").default_setup(set) -- don't forget this!
        end,
      },
    })
  end,
}
