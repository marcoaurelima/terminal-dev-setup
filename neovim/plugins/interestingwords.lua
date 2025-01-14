return {
  "Mr-LLLLL/interestingwords.nvim",
  lazy = false,
  config = function()
    require("interestingwords").setup {
      colors = {
        "#aeee00",
        "#ff0000",
        "#0000ff",
        "#b88823",
        "#ffa724",
        "#ff2c4b",
        "#00aaff",
        "#ffaa00",
        "#00ff00",
        "#ff00aa",
        "#aa00ff",
        "#ffaaee",
        "#00ffaa",
        "#aaff00",
        "#ff66cc", -- Rosa claro
        "#339966", -- Verde esmeralda
      },
      search_count = true,
      navigation = true,
      search_key = "<leader>is",
      cancel_search_key = "<leader>ix",
      color_key = "<leader>ic",
      cancel_color_key = "<leader>iX",
    }
  end,
}
