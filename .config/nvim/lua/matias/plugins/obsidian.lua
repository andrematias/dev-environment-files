return {
  "epwalsh/obsidian.nvim",
  lazy = false,
  version = "*",
  lazy = false,
  ft = "markdown",
  -- event = {
  --   "BufReadPre " .. vim.fn.expand("~") .. "Documents/braindump/**.md",
  --   "BufNewFile " .. vim.fn.expand("~") .. "Documents/braindump/**.md",
  -- },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local ob = require("obsidian")
    ob.setup({
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/vaults/braindump",
        },
      },
      ui = {
        enable = true,
        update_debounce = 200,
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "󰱒", hl_group = "ObsidianDone" },
          ["/"] = { char = "󱋭", hl_group = "ObsidianHalf" },
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        hl_groups = {
          ObsidianTodo = { bold = true },
          ObsidianDone = { bold = true },
          ObsidianRightArrow = { bold = true },
          ObsidianHalf = { bold = true },
          ObsidianBullet = { bold = true },
          ObsidianRefText = { underline = true, fg = "#c792ea" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#89ddff" },
          ObsidianHighlightText = { bg = "#75662e" },
        },
      },
      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {},
      },
      daily_notes = {
        folder = "Diary",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        template = nil,
      },
      -- Specify how to handle attachments.
      attachments = {
        img_folder = "Attachments",
        img_text_func = function(client, path)
          local link_path
          local vault_relative_path = client:vault_relative_path(path)
          if vault_relative_path ~= nil then
            link_path = vault_relative_path
          else
            link_path = tostring(path)
          end
          local display_name = vim.fs.basename(link_path)
          return string.format("![%s](%s)", display_name, link_path)
        end,
      },
    })

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>oo", "<cmd>ObsidianFollowLink<cr>", { desc = "Open current obsidian link" })
    keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Open a new obsidian note" })
    keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Open a new obsidian note" })
    keymap.set("n", "<leader>og", "<cmd>ObsidianSearch<cr>", { desc = "Search text in obsidian notes" })
    keymap.set("n", "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Search obsidian notes" })
    keymap.set("v", "<leader>ol", "<cmd>ObsidianLink<cr>", { desc = "Obsidian Link to note" })
    keymap.set("v", "<leader>on", "<cmd>ObsidianLinkNew<cr>", { desc = "Create obsidian link to selection" })
  end,
}
