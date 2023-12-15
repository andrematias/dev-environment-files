return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        persist_buffer_sort = true,
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 20,
        max_prefix_length = 20,
        tab_size = 20,
        diagnostics = false, -- "nvim_lsp",
        diagnostics_update_in_insert = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            padding = 1,
            highlight = "FileExplorer",
          },
        },
        close_command = "Bdelete! %d",
        mode = "buffers",
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
      },
    })

    vim.cmd("hi FileExplorer guibg=#252525 gui=bold")
  end,
}
