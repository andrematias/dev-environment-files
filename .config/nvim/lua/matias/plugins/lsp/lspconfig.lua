return {
  -- enable = false,
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    local util = require("lspconfig/util")
    local path = util.path

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", function()
        vim.diagnostic.open_float({ max_width = 80 })
      end, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    vim.lsp.buf.hover({
      border = "rounded",
      max_width = math.floor(vim.o.columns * 0.3),
      max_height = math.floor(vim.o.lines * 0.3),
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities.offsetEncoding = { "utf-16" }

    local signs = { Error = "● ", Warn = "● ", Info = "● ", Hint = "● " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- disable virtual_text (inline) diagnostics and use floating window
    -- format the message such that it shows source, message and
    -- the error code.
    vim.diagnostic.config({
      -- signs = true,
      -- virtual_text = false,
      underline = true,
      virtual_text = {
        severity = { min = vim.diagnostic.severity.HINT }, -- don't show virtual text for HINT
      },
      signs = {
        severity = { min = vim.diagnostic.severity.HINT }, -- don't show signs for HINT
      },
      severity_sort = true,
      float = {
        source = true,
        border = "single",
        -- format = function(diagnostic)
        --   return string.format(
        --     "%s (%s) [%s]",
        --     diagnostic.message,
        --     diagnostic.source,
        --     diagnostic.code or diagnostic.user_data.lsp.code
        --   )
        -- end,
      },
    })

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure typescript server with plugin
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure python server
    local function get_python_path(workspace)
      -- Use activated virtualenv.
      if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
      end

      -- Find and use virtualenv from pipenv in workspace directory.
      local match = vim.fn.glob(path.join(workspace, "Pipfile"))
      if match ~= "" then
        local venv = vim.fn.trim(vim.fn.system("PIPENV_PIPFILE=" .. match .. " pipenv --venv"))
        return path.join(venv, "bin", "python")
      end

      -- Fallback to system Python.
      return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
    end

    lspconfig["pyright"].setup({
      on_init = function(client)
        client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
      end,
      -- handlers = handlers,
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      -- handlers = handlers,
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- configure php lsp server
    lspconfig["intelephense"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure clang lsp server
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure cmake lsp server
    lspconfig["neocmake"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure docker language server
    lspconfig["dockerls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure go language server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
