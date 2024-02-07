return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
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
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        hl_groups = {
          ObsidianTodo = { bold = true, fg = "#f78c6c" },
          ObsidianDone = { bold = true, fg = "#89ddff" },
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
          ObsidianHalf = { bold = true, fg = "#ff5370" },
          ObsidianBullet = { bold = true, fg = "#89ddff" },
          ObsidianRefText = { underline = true, fg = "#c792ea" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#89ddff" },
          ObsidianHighlightText = { bg = "#75662e" },
        },
      },
      -- Specify how to handle attachments.
      attachments = {
        img_folder = "~/Documents/vaults/braindump/Attachments",
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
  end,
}
