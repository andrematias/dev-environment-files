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
  command = "PencilSoft | setlocal conceallevel=2 spell spelllang=pt_br,en_us",
})

autocmd("Filetype", {
  group = "setPencilMode",
  pattern = { "text" },
  command = "PencilHard | setlocal spell spelllang=pt_br,en_us",
})

-- Markdown Syntax
augroup("setMarkdownSyntax", { clear = true })
autocmd("Filetype", {
  group = "setMarkdownSyntax",
  pattern = { "md", "markdown", "mkd" },
  command = "setlocal syntax=markdown foldmethod=manual",
})

-- Terminal mode
augroup("TerminalMode", { clear = true })

autocmd("TermOpen", {
  group = "TerminalMode",
  command = "setlocal nonumber norelativenumber",
})

autocmd("TermOpen", {
  group = "TerminalMode",
  command = "startinsert",
})

autocmd("TermEnter", {
  group = "TerminalMode",
  command = "setlocal signcolumn=no",
})
