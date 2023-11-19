local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Disable line length marker
augroup("setLineLength", { clear = true })
autocmd("Filetype", {
  group = "setLineLength",
  pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescript" },
  command = "setlocal cc=0",
})

-- Set indentation to 2 spaces
augroup("setIndent", { clear = true })
autocmd("Filetype", {
  group = "setIndent",
  pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
  command = "setlocal shiftwidth=2 tabstop=2",
})

-- Pencil Toggle
augroup("setPencilMode", { clear = true })
autocmd("Filetype", {
  group = "setPencilMode",
  pattern = { "mkd", "markdown" },
  command = "PencilSoft",
})

autocmd("Filetype", {
  group = "setPencilMode",
  pattern = { "text" },
  command = "PencilHard",
})
