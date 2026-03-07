return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  config = function()
    vim.o.autoread = true
    vim.g.opencode_opts = {
      lsp = {
        enabled = true
      }
    }

    local keymap = vim.keymap
    keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
    keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
    keymap.set({ "n", "t" }, "<C-t>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

    keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
    keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

    keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
    keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })
  end,
}
