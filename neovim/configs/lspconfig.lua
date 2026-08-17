require("nvchad.configs.lspconfig").defaults()

local servers = { "lua_lsp", "html", "cssls", "clangd", "pyright", "ts_ls", "gopls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
