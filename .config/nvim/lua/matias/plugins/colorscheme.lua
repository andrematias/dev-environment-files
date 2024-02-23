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
          dark = "macchiato",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "light",
          percentage = 0.30, -- percentage of the shade to apply to the inactive window
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
          booleans = {},
          properties = {},
          types = {},
          operators = { "bold" },
        },
        color_overrides = {
          latte = {
            base = "#ffffff",
          },
        },
        highlight_overrides = {
          latte = function(c)
            return {
              FileExplorer = { bg = c.mantle },
              CursorLineNr = { fg = c.blue },
              CursorLine = { bg = c.base },
            }
          end,
          mocha = function(c)
            return {
              FileExplorer = { bg = c.mantle },
              CursorLineNr = { fg = c.lavender },
              CursorLine = { bg = c.base },
            }
          end,
        },
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
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- VsCode theme
  {
    "Mofiqul/vscode.nvim",
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        -- style = 'light',
        transparent = false,
        italic_comments = false,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
          FileExplorer = { bg = c.base },
          CursorLineNr = { fg = c.vscUiOrange },
          CursorLine = { bg = c.base },
        },
      })

      -- vim.cmd.colorscheme("vscode")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = false,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {
          light0_hard = "#fbf1c7",
        },
        overrides = {
          SignColumn = { bg = "none" },
          StatusLine = { bg = "none", fg = "white" },
          GruvboxAquaSign = { bg = "none" },
          GruvboxRedSign = { bg = "none" },
          GruvboxGreenSign = { bg = "none" },
          GruvboxOrangeSign = { bg = "none" },
          GruvboxYellowSign = { bg = "none" },
        },
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
