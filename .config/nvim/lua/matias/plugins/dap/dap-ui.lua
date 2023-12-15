return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<F4>", ":lua require'dapui'.toggle()<CR>", { desc = "Toggle Debugger UI" })
  end,
}
