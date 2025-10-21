-- Helps install linters, language servers, etc, and initialize them.

Pack({ source = "mason-org/mason.nvim", name = "mason", setup = true })
Pack({ source = "mason-org/mason-lspconfig.nvim", name = "mason-lspconfig", setup = true })
Pack({ source = "esmuellert/nvim-eslint", setup = true })
