return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
  },
  -- stylua: ignore
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<F5>", function() require('dap').continue() end, { desc = "Continue debugger" })
    keymap.set("n", "<F6>", function() require("dap").step_over() end, { desc = "Step over" })
    keymap.set("n", "<F7>", function() require("dap").step_into() end, { desc = "Step into" })
    keymap.set("n", "<F8>", function() require("dap").step_out() end, { desc = "Step out" })
    keymap.set(
      "n",
      "<leader>bb",
      function() require("dap").toggle_breakpoint() end,
      { desc = "Toggle breakpoint" }
    )
    keymap.set(
      "n",
      "<leader>B",
      function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
      { desc = "Set breakpoint" }
    )
    keymap.set(
      "n",
      "<leader>lp",
      function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
      { desc = "Log message breakpoint" }
    )
    keymap.set("n", "<leader>dr", function() require('dap').repl.open() end, { desc = "Open repl" })
  end,
}
