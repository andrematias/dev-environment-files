return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("plugins.lualine.themes.default")
  end,
}
