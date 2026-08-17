return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c",
        "cpp",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "asm",
        "make",
        "typescript",
        "javascript",
        "python",
        "yaml",
        "xml",
        "tsx",
        "toml",
        "rust",
        "tmux",
        "sql",
        "regex",
        "pem",
        "php",
        "perl",
        "java",
        "c_sharp",
        "bash",
        "awk",
        "angular",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",

    opts = {
      renderer = {
        icons = {
          git_placement = "after",

          glyphs = {
            git = {
              unstaged = "●",
              staged = "󰄬",
              unmerged = "",
              renamed = "󰏫",
              untracked = "+",
              deleted = "×",
              ignored = ":◌",
            },
          },
        },
      },
    },
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
