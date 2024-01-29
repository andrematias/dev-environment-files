return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local colors = require("gruvbox").palette
    lualine.setup({
      options = {
        icons_enabled = false,
        globalstatus = true,
        component_separators = "",
        section_separators = "",
        -- component_separators = "|",
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = false,
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            show_filename_only = true,
            hide_filename_extension = true,
            show_modified_status = true,
            mode = 0,
            use_mode_colors = false,
            buffers_color = {
              active = { fg = colors.bright_orange, bg = "none" },
              inactive = { fg = colors.gray, bg = "none" },
            },
            symbols = {
              modified = " ●",
              alternate_file = "",
              directory = "",
            },
            filetype_names = {
              alpha = "",
              NvimTree = "",
              TelescopePrompt = "",
              aerial = "",
            },
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
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
            function()
              return "󱍢"
            end,
            separator = { left = "", right = "" },
            -- function()
            --   return string.upper(vim.fn.mode())
            -- end,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {},
        lualine_c = { "filename", "filesize" },
        lualine_x = {
          { "selectioncount" },
          { "searchcount" },
          { "progress" },
        },
        lualine_y = {
          "branch",
          {
            "diagnostics",
            update_in_insert = true,
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
        },
        lualine_z = {
          {
            "tabs",
            symbols = {
              modified = "●", -- Text to show when the file is modified.
            },
          },
        },
      },
      extensions = { "mason", "lazy", "nvim-dap-ui", "nerdtree", "quickfix" },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
