return {
  "nguyenvukhang/nvim-toggler",
  lazy = false,
  config = function()
    require("nvim-toggler").setup {
      -- your own inverses
      inverses = {
        ["vim"] = "emacs",
        ["true"] = "false",
        ["TRUE"] = "FALSE",
      },
      -- removes the default set of inverses
      remove_default_inverses = true,
      -- auto-selects the longest match when there are multiple matches
      autoselect_longest_match = false,
    }
  end,
}
