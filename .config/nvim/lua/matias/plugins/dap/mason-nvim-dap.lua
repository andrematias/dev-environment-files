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
      },
    })
  end,
}
