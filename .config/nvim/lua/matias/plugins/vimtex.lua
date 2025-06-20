return {
  "lervag/vimtex",
  init = function()
    -- Viewer settings
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_context_pdf_viewer = "zathura"
    vim.g.vimtex_view_zathura_use_synctex = 0

    -- Indentation settings
    vim.g.vimtex_indent_enabled = false
    vim.g.tex_indent_items = false
    vim.g.tex_indent_brace = false

    -- Suppression settings
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_log_ignore = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }

    -- Other settings
    vim.g.vimtex_mappings_enabled = false
    vim.g.tex_flavor = "latex"
  end,
}
