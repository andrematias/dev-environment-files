return {
  {
    "LunarVim/darkplus.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme darkplus]])

      vim.cmd([[
        highlight DiagnosticVirtualTextWarn guifg=#704100 guibg=none
        highlight DiagnosticVirtualTextError guifg=#8c2929 guibg=none
        highlight DiagnosticVirtualTextInfo guifg=#a88643 guibg=none
        highlight DiagnosticVirtualTextHint guifg=#296a8b guibg=none
      ]])
    end,
  },
  -- {
  --   "sam4llis/nvim-tundra",
  --   priority = 1000,
  --   config = function()
  --     local tundra = require("nvim-tundra")
  --     tundra.setup({
  --       transparent_background = false,
  --       dim_inactive_windows = {
  --         enabled = true,
  --         color = nil,
  --       },
  --       sidebars = {
  --         enabled = true,
  --         color = nil,
  --       },
  --       editor = {
  --         search = {},
  --         substitute = {},
  --       },
  --       syntax = {
  --         booleans = { bold = true, italic = true },
  --         comments = { bold = true, italic = true },
  --         conditionals = {},
  --         constants = { bold = true },
  --         fields = {},
  --         functions = {},
  --         keywords = {},
  --         loops = {},
  --         numbers = { bold = true },
  --         operators = { bold = true },
  --         punctuation = {},
  --         strings = {},
  --         types = { italic = true },
  --       },
  --       diagnostics = {
  --         errors = {},
  --         warnings = {},
  --         information = {},
  --         hints = {},
  --       },
  --       plugins = {
  --         lsp = true,
  --         semantic_tokens = true,
  --         treesitter = true,
  --         telescope = true,
  --         nvimtree = true,
  --         cmp = true,
  --         context = true,
  --         dbui = true,
  --         gitsigns = true,
  --         neogit = true,
  --         textfsm = true,
  --       },
  --       overwrite = {
  --         colors = {},
  --         highlights = {},
  --       },
  --     })
  --
  --     vim.opt.background = "dark"
  --     vim.cmd("colorscheme tundra")
  --   end,
  -- },
  -- {
  --   "bluz71/vim-nightfly-guicolors",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme nightfly]])
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     local bg = "#011628"
  --     local bg_dark = "#011423"
  --     local bg_highlight = "#143652"
  --     local bg_search = "#0A64AC"
  --     local bg_visual = "#275378"
  --     local fg = "#CBE0F0"
  --     local fg_dark = "#B4D0E9"
  --     local fg_gutter = "#627E97"
  --     local border = "#547998"
  --
  --     require("tokyonight").setup({
  --       style = "night",
  --       on_colors = function(colors)
  --         colors.bg = bg
  --         colors.bg_dark = bg_dark
  --         colors.bg_float = bg_dark
  --         colors.bg_highlight = bg_highlight
  --         colors.bg_popup = bg_dark
  --         colors.bg_search = bg_search
  --         colors.bg_sidebar = bg_dark
  --         colors.bg_statusline = bg_dark
  --         colors.bg_visual = bg_visual
  --         colors.border = border
  --         colors.fg = fg
  --         colors.fg_dark = fg_dark
  --         colors.fg_float = fg
  --         colors.fg_gutter = fg_gutter
  --         colors.fg_sidebar = fg_dark
  --       end,
  --     })
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },
}
