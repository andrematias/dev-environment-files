return {
  -- VsCode theme
  {
    "Mofiqul/vscode.nvim",
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        style = "light",
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

      -- vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "lunacookies/vim-colors-xcode",
    config = function()
      -- vim.cmd.colorscheme("xcodelighthc")
    end,
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    config = function()
      require("modus-themes").setup({
        style = "auto",
        variant = "default",
        transparent = false,
        dim_inactive = false,
        hide_inactive_statusline = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },

        on_colors = function(colors)
          colors.yellow = "#bfa200"
        end,

        on_highlights = function(highlights, colors)
          highlights.NvimTreeNormal = {
            bg = colors.bg_main,
            fg = colors.fg_main,
          }
          highlights.NvimTreeNormalNC = {
            bg = colors.bg_main,
            fg = colors.fg_main,
          }
          highlights.NvimTreeCursorColumn = {
            bg = colors.bg_main,
            fg = colors.fg_main,
          }
          highlights.NvimTreeCursorLine = {
            bg = colors.bg_main,
            fg = colors.yellow,
          }
          highlights.NvimTreeCursorLineNr = {
            bg = colors.bg_main,
            fg = colors.fg_main,
          }
          highlights.NvimTreeLineNr = {
            bg = colors.bg_main,
            fg = colors.fg_main,
          }
          highlights.NvimTreeSignColumn = {
            bg = colors.bg_main,
            fg = colors.fg_main,
          }
          highlights.NvimTreeFolderIcon = {
            bg = colors.bg_main,
            fg = colors.blue,
          }
          highlights.NvimTreeSymlink = {
            fg = colors.blue,
          }
          highlights.NvimTreeWinSeparator = {
            bg = colors.bg_main,
            fg = colors.bg_main,
          }

          highlights.TelescopeBorder = {
            bg = colors.bg_main,
            fg = colors.blue,
          }
          highlights.TelescopePromptBorder = {
            bg = colors.bg_main,
            fg = colors.blue,
          }
          highlights.TelescopePromptTitle = {
            bg = colors.bg_main,
            fg = colors.blue,
          }

          highlights.WhichKeyNormal = {
            bg = colors.bg_main,
            fg = colors.blue,
          }

          highlights.LineNr = {
            bg = colors.bg_main,
            fg = colors.yellow,
          }

          highlights.LineNrBelow = {
            bg = colors.bg_main,
          }

          highlights.LineNrAbove = {
            bg = colors.bg_main,
          }

          highlights.NormalFloat = {
            bg = colors.bg_main,
          }

          highlights.FloatBorder = {
            fg = colors.blue,
          }
        end,
      })

      vim.cmd.colorscheme("modus")
    end,
  },
}
