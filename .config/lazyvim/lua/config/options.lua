-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim cursor
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- Define o limite de colunas para 80
vim.opt.textwidth = 100
-- vim.opt.colorcolumn = "100"

-- Configura as opções de formatação
-- t: quebra automática de texto usando textwidth
-- q: permite formatar comentários com 'gq'
-- j: remove caracteres de comentário ao unir linhas (onde apropriado)
-- vim.opt.formatoptions:append({ "t", "q", "j" })

vim.opt.wrap = false
vim.opt.sidescrolloff = 0
