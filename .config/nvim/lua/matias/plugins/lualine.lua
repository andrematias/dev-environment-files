return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    lualine.setup({
      theme = "catppuccin",
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
            -- function() return "" end,
            function()
              return string.upper(vim.fn.mode())
            end,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {},
        -- lualine_c = {
        --   {
        --     "buffers",
        --     show_filename_only = true,
        --     hide_filename_extension = false,
        --     show_modified_status = true,
        --     mode = 0,
        --     use_mode_colors = false,
        --     symbols = {
        --       modified = " ●",
        --       alternate_file = " ",
        --       directory = "",
        --     },
        --     filetype_names = {
        --       NvimTree = "",
        --       TelescopePrompt = "",
        --       aerial = "",
        --     },
        --   },
        -- },
        lualine_x = {
          { "selectioncount" },
          { "searchcount" },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "progress" },
        },
        lualine_y = { "tabs" },
        lualine_z = {},
      },
      extensions = { "mason" },
    })
  end,
}
