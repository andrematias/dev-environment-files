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
      silent_chdir = true,
      datapath = vim.fn.stdpath("data"),
    })
  end,
}
