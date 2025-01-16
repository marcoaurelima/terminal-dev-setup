return {
  "codota/tabnine-nvim",
  lazy = false,
  build = "./dl_binaries.sh",
  config = function()
    require("tabnine").setup {
      disable_auto_comment = true,
      --accept_keymap = "<Tab>",
      accept_keymap = "<C-]>",
      -- dismiss_keymap = "<C-]>",
      dismiss_keymap = "<C-[>",
      debounce_ms = 600,
      suggestion_color = { gui = "#808080", cterm = 244 },
      exclude_filetypes = { "TelescopePrompt" },
      log_file_path = nil, -- absolute path to Tabnine log file
    }
    -- require("tabnine.status").status()
  end,
}
