return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },

  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      require("onedark").load()
    end,
  },

  { "martinsione/darkplus.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
