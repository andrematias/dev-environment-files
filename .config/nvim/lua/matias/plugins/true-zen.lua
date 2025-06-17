return {
  "Pocco81/true-zen.nvim",
  dependencies = {
    "preservim/vim-pencil",
  },
  config = function()
    require("true-zen").setup({
      modes = { -- configurations per mode
        ataraxis = {
          shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
          backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
          minimum_writing_area = { -- minimum size of main window
            width = 100,
            height = 100,
          },
          quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
          padding = { -- padding windows
            left = 52,
            right = 52,
            top = 0,
            bottom = 0,
          },
          callbacks = { -- run functions when opening/closing Ataraxis mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil,
          },
        },
        minimalist = {
          ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
          options = { -- options to be disabled when entering Minimalist mode
            number = false,
            relativenumber = false,
            showtabline = 0,
            signcolumn = "no",
            statusline = "",
            cmdheight = 1,
            laststatus = 0,
            showcmd = false,
            showmode = false,
            ruler = false,
            numberwidth = 1,
          },
          callbacks = { -- run functions when opening/closing Minimalist mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil,
          },
        },
        narrow = {
          --- change the style of the fold lines. Set it to:
          --- `informative`: to get nice pre-baked folds
          --- `invisible`: hide them
          --- function() end: pass a custom func with your fold lines. See :h foldtext
          folds_style = "hide",
          run_ataraxis = true, -- display narrowed text in a Ataraxis session
          callbacks = { -- run functions when opening/closing Narrow mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil,
          },
        },
        focus = {
          callbacks = { -- run functions when opening/closing Focus mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil,
          },
        },
      },
      integrations = {
        tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
        lualine = true, -- hide nvim-lualine (ataraxis)
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>zn", "<cmd>TZNarrow<CR>", { noremap = true, desc = "Set True Zen Narrow" })
    keymap.set("v", "<leader>zn", "<cmd>'<,'>TZNarrow<CR>", { noremap = true, desc = "Set True Zen Narrow" })
    keymap.set("n", "<leader>zf", "<cmd>TZFocus<CR>", { noremap = true, desc = "Set True Zen Focus" })
    keymap.set("n", "<leader>zm", "<cmd>TZMinimalist<CR>", { noremap = true, desc = "Set True Zen Minimalist" })
    keymap.set("n", "<leader>zz", "<cmd>TZAtaraxis<CR>", { noremap = true, desc = "Set True Zen Ataraxis" })
  end,
}
