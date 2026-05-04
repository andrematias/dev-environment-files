return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },
}
