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
          mocha = {
            rosewater = "#ffc9c9",
            flamingo = "#ff9f9a",
            pink = "#ffa9c9",
            mauve = "#df95cf",
            lavender = "#a990c9",
            red = "#ff6960",
            maroon = "#f98080",
            peach = "#f9905f",
            yellow = "#f9bd69",
            green = "#b0d080",
            teal = "#a0dfa0",
            sky = "#a0d0c0",
            sapphire = "#95b9d0",
            blue = "#89a0e0",
            text = "#e0d0b0",
            subtext1 = "#d5c4a1",
            subtext0 = "#bdae93",
            overlay2 = "#928374",
            overlay1 = "#7c6f64",
            overlay0 = "#665c54",
            surface2 = "#504844",
            surface1 = "#3a3634",
            surface0 = "#252525",
            base = "#141516",
            mantle = "#0e0e0e",
            crust = "#080808",
          },
          latte = {
            text = "#000000",
            base = "#ffffff",
            rosewater = "#dc8a78",
            flamingo = "#dd7878",
            pink = "#ea76cb",
            mauve = "#8839ef",
            red = "#d20f39",
            maroon = "#e64553",
            peach = "#fe640b",
            yellow = "#df8e1d",
            green = "#40a02b",
            teal = "#179299",
            sky = "#04a5e5",
            sapphire = "#209fb5",
            blue = "#1e66f5",
            lavender = "#7287fd",
            subtext1 = "#5c5f77",
            subtext0 = "#6c6f85",
            overlay2 = "#7c7f93",
            overlay1 = "#8c8fa1",
            overlay0 = "#9ca0b0",
            surface2 = "#acb0be",
            surface1 = "#bcc0cc",
            surface0 = "#ccd0da",
            mantle = "#e6e9ef",
            crust = "#dce0e8",
          },
        },
        highlight_overrides = {
          latte = function(c)
            return {
              FileExplorer = { bg = c.mantle },
            }
          end,
          mocha = function(c)
            return {
              FileExplorer = { bg = c.crust },
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
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
