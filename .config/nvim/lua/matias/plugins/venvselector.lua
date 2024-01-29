return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  opts = {
    name = ".venv",
  },
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select python virtual environment" })
    keymap.set("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { desc = "Select current python virtual environment" })
  end,
}
