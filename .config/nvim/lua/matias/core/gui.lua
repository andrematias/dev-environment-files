if vim.g.neovide then
  local function rpcrequest(method, ...)
    return vim.rpcrequest(vim.g.neovide_channel_id, method, ...)
  end

  local function set_clipboard(register)
    return function(lines, regtype)
      rpcrequest("neovide.set_clipboard", lines)
    end
  end

  local function get_clipboard(register)
    return function()
      return rpcrequest("neovide.get_clipboard", register)
    end
  end

  vim.g.clipboard = {
    name = "neovide",
    copy = {
      ["+"] = set_clipboard("+"),
      ["*"] = set_clipboard("*"),
    },
    paste = {
      ["+"] = get_clipboard("+"),
      ["*"] = get_clipboard("*"),
    },
    cache_enabled = 0,
  }

  vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
    pattern = "*",
    once = true,
    nested = true,
    callback = function()
      rpcrequest("neovide.quit", vim.v.exiting)
    end,
  })

  if vim.loop.os_uname().sysname == "Darwin" then
    vim.opt.guifont = "IosevkaTerm Nerd Font:h18"
    vim.g.neovide_refresh_rate = 60
  else
    vim.opt.guifont = "IosevkaTerm Nerd Font:h12"
    vim.g.neovide_refresh_rate = 144
  end

  vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
  vim.opt.linespace = 1
  vim.g.neovide_cursor_animation_length = 0.10
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_theme = "auto"
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_scroll_animation_length = 0.5
  vim.g.neovide_scroll_animation_far_lines = 4
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_cursor_vfx_mode = "ripple"
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  -- vim.g.neovide_cursor_vfx_mode = "sonicboom"
  -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
