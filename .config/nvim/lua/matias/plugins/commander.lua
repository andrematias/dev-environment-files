return {
  dir = "~/.config/nvim/commander.nvim",
  config = function()
    local commander = require("commander")
    -- commander.setup({
    --   default_cmd = "gcc -o ",
    -- })

    local keymap = vim.keymap
    keymap.set("n", "<leader>cc", commander.commander, { desc = "Run a command in vertical split" })
  end,
}
