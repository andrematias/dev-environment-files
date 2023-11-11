return {
  "ahmedkhalf/project.nvim",
  config = function()
    local project = require("project_nvim")

    project.setup({
      active = true,
      on_config_done = nil,
      manual_mode = false,
      detection_methods = { "pattern" },
      patterns = { ".git" },
      show_hidden = true,
      silent_chdir = false,
      datapath = vim.fn.stdpath("data"),
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>pp", "<cmd>Telescope projects<CR>", { desc = "Fuzzy find projects" })
  end,
}
