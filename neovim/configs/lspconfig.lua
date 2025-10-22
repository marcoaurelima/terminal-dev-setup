-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local servers = { "lua_lsp", "html", "cssls", "clangd", "pyright", "ts_ls", "gopls" }
vim.lsp.enable(servers)
