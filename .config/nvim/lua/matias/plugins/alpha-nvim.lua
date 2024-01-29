return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      [[                                                 ]],
      [[                     --                          ]],
      [[    Faça o seu melhor hoje, Será o suficiente.   ]],
      [[                                                 ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("p", "  Projects", "<cmd>Telescope projects<CR>"),
      dashboard.button("e", "  New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fr", "󰱼  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("SPC fs", "  Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("c", "  Edit Configurations", "<cmd>e $HOME/.config/nvim/<CR>"),
      dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    dashboard.section.footer.val = function()
      return "André Matias"
    end

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
