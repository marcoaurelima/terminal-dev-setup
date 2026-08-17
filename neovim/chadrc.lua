-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    -- Modified
    -- Git icons
    NvimTreeGitDirty = { fg = "#E5C07B" },
    NvimTreeGitNew = { fg = "#98C379" },
    NvimTreeGitDeleted = { fg = "#E06C75" },
    NvimTreeGitRenamed = { fg = "#61AFEF" },
    NvimTreeGitMerge = { fg = "#C678DD" },
    NvimTreeGitIgnored = { fg = "#5C6370" },
    NvimTreeGitStaged = { fg = "#98C379" },
  },
}

M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.08,
    col = 0.06,
    width = 0.85,
    height = 0.75,
    border = "single",
  },
}

M.ui = {
  telescope = {
    style = "bordered",
  },

  statusline = {
    theme = "vscode_colored",
    separator_style = "round",
  },

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
  },
}

return M
