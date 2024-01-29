return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = false,
      },
      sections = {
        lualine_a = {
          {
            -- "mode",
            -- function()
            --   return " "
            -- end,
            -- function()
            --   return " "
            -- end,
            -- function()
            --   return "󱍢 "
            -- end,
            function()
              return string.upper(vim.fn.mode())
            end,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {},
        lualine_c = {
          {
            "buffers",
            show_filename_only = true,
            hide_filename_extension = true,
            show_modified_status = true,
            mode = 0,
            use_mode_colors = true,
            symbols = {
              modified = " ●",
              alternate_file = " ",
              directory = "",
            },
            filetype_names = {
              NvimTree = "",
              TelescopePrompt = "",
              aerial = "",
            },
          },
        },
        lualine_x = {
          { "selectioncount" },
          { "searchcount" },
          { "progress" },
        },
        lualine_y = { "tabs" },
        lualine_z = {},
      },
      extensions = { "mason" },
    })
  end,
}
