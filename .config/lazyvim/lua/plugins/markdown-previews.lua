return {
  "selimacerbas/markdown-preview.nvim",
  dependencies = { "selimacerbas/live-server.nvim" },
  config = function()
    require("markdown_preview").setup({
      instance_mode = "takeover",
      port = 0,
      open_browser = true,
      -- browser = nil,
      browser = "qutebrowser",
      content_name = "content.md",
      index_name = "index.html",
      workspace_dir = nil,
      overwrite_index_on_start = true,
      auto_refresh = true,
      auto_refresh_events = {
        "InsertLeave",
        "TextChanged",
        "TextChangedI",
        "BufWritePost",
      },
      debounce_ms = 300,
      notify_on_refresh = false,
      mermaid_renderer = "mmdr",
      scroll_sync = true,
      bottom_padding = 1.0,
    })
  end,
}
