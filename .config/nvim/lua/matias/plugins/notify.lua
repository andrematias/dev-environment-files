return {
  {
    "rcarriga/nvim-notify",
    enabled = false,
    lazy = false,
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "NotifyBackground",
        fps = 60,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = "",
        },
        level = 1,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 3000,
        top_down = true,
      })
      local log = require("plenary.log").new({
        plugin = "notify",
        level = "info",
        use_console = false,
      })

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.notify = function(msg, level, opts)
        log.info(msg, level, opts)
        if string.find(msg, "method .* is not supported") then
          return
        end

        notify(msg, level, opts)
      end
    end,
    cond = function()
      if not pcall(require, "plenary") then
        return false
      end

      if pcall(require, "noice") then
        return false
      end
      return true
    end,
  },
}
