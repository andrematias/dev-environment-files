return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      close_command = "Bdelete! %d",
      mode = "buffers",
      separator_style = "thin",
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
}
