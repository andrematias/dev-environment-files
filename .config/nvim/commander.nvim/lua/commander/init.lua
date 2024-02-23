local api = vim.api
local augroup = api.nvim_create_augroup -- Create/get autocommand group
local autocmd = api.nvim_create_autocmd -- Create autocommand

local global_options = {
  default_cmd = "make -k -C ",
  cache = {
    last_cmd = nil,
  },
}

local get_input = function()
  local cmd = global_options.default_cmd .. vim.fn.getcwd() .. "/"
  if global_options.cache.last_cmd then
    cmd = global_options.cache.last_cmd
  end
  local input = vim.fn.input("Run: ", cmd, "file")
  global_options.cache.last_cmd = input
  return input
end

M = {}

M.commander = function()
  vim.cmd("new | terminal " .. get_input())
end

M.vsplit_commander = function()
  vim.cmd("vsplit | terminal " .. get_input())
end

M.split_commander = function()
  vim.cmd("split | terminal " .. get_input())
end

M.tab_commander = function()
  vim.cmd("tabnew | terminal " .. get_input())
end

M.local_commander = function()
  vim.cmd("terminal " .. get_input())
end

M.setup = function(o)
  global_options = vim.tbl_deep_extend("force", global_options, o)
end

-- User commands
api.nvim_create_user_command("Commander", M.commander, {})
api.nvim_create_user_command("CommanderSV", M.vsplit_commander, {})
api.nvim_create_user_command("CommanderSH", M.split_commander, {})
api.nvim_create_user_command("CommanderT", M.tab_commander, {})
api.nvim_create_user_command("CommanderL", M.local_commander, {})

-- Auto commands for Command Mode
augroup("CommanderMode", { clear = true })
autocmd("TermOpen", {
  group = "CommanderMode",
  command = "setlocal nonumber norelativenumber",
})

autocmd("TermOpen", {
  group = "CommanderMode",
  command = "startinsert",
})

autocmd("TermEnter", {
  group = "CommanderMode",
  command = "setlocal signcolumn=no",
})

return M
