return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").set_icon({
      toml = {
        icon = "",
        color = "#e535ab",
        cterm_color = "199",
        name = "Toml",
      },
      gql = {
        icon = "",
        color = "#e535ab",
        cterm_color = "199",
        name = "GraphQL",
      },
    })
  end,
}
