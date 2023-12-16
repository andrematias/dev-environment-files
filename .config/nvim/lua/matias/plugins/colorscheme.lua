return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = { "bold" },
          functions = { "bold" },
          keywords = { "bold", "italic" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = { "bold" },
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          markdown = true,
          gitsigns = true,
          nvimtree = true,
          mason = true,
          aerial = true,
          alpha = true,
          treesitter = true,
          telescope = {
            enabled = true,
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     local onedark = require("onedark")
  --     local palette = require("onedark.palette").darker
  --     onedark.setup({
  --       style = "darker",
  --       transparent = true, -- Show/hide background
  --       term_colors = true, -- Change terminal color as per the selected theme style
  --       ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  --       cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  --
  --       -- Change code style ---
  --       -- Options are italic, bold, underline, none
  --       code_style = {
  --         comments = "italic",
  --         keywords = "bold,italic",
  --         functions = "bold",
  --         strings = "none",
  --         variables = "none",
  --       },
  --
  --       -- Custom Highlights --
  --       highlights = {
  --         ["FileExplorer"] = { fg = palette.orange, bg = "none", fmt = "bold" },
  --       },
  --
  --       -- colors = {}, -- Override default colors
  --
  --       -- Plugins Config --
  --       diagnostics = {
  --         darker = true, -- darker colors for diagnostic
  --         undercurl = true, -- use undercurl instead of underline for diagnostics
  --         background = false, -- use background color for virtual text
  --       },
  --     })
  --
  --     onedark.load()
  --   end,
  -- },
  -- {
  --   "LunarVim/darkplus.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme darkplus]])
  --
  --     vim.cmd([[
  --       highlight DiagnosticVirtualTextWarn guifg=#704100 guibg=none
  --       highlight DiagnosticVirtualTextError guifg=#8c2929 guibg=none
  --       highlight DiagnosticVirtualTextInfo guifg=#a88643 guibg=none
  --       highlight DiagnosticVirtualTextHint guifg=#296a8b guibg=none
  --     ]])
  --   end,
  -- },
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
