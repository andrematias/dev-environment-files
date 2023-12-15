return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup()

    -- set keymaps
    local keymap = vim.keymap

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      -- function to run on opening the terminal
      on_open = function()
        vim.cmd("startinsert!")
      end,
      -- function to run on closing the terminal
      on_close = function()
        vim.cmd("startinsert!")
      end,
    })

    local function lazygit_toggle()
      lazygit:toggle()
    end

    keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", {
      noremap = true,
      silent = true,
      desc = "Toggle Terminal",
    })

    keymap.set("n", "<leader>g", lazygit_toggle, {
      noremap = true,
      silent = true,
      desc = "Toggle Lazygit Terminal",
    })

    keymap.set("t", "<esc>", [[<C-\><C-n>]], {
      noremap = true,
      silent = true,
      desc = "Normal mode on terminal",
    })
  end,
}
