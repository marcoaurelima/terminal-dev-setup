return {
  "Bekaboo/dropbar.nvim",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },

  config = function()
    require("dropbar").setup {
      bar = {
        padding = {
          left = 5,
          right = 0,
        },
      },
    }
  end,

  lazy = false,
}
