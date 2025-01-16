return {
  "jay-babu/mason-nvim-dap.nvim",
  lazy = false,
  config = function()
    require("mason").setup()
    require("mason-nvim-dap").setup({
      ensure_installed = { "python", "delve" },
      automatic_installation = true
    })
  end,
}
