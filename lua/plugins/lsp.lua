local map_key = require("utils.key_mapper").map_key

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", -- lua

                    "clangd", -- c, c++
                    "rust_analyzer", -- rust

                    "wgsl_analyzer", -- wgsl

                    "markdown_oxide", "mdx_analyzer",
                    -- md, mdx

                    "taplo", --toml
                    "yamlls", --yaml
                    "jsonls", -- json
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})

            lspconfig.clangd.setup({})
            lspconfig.rust_analyzer.setup({})

            lspconfig.wgsl_analyzer.setup({})

            lspconfig.markdown_oxide.setup({})
            lspconfig.mdx_analyzer.setup({})

            lspconfig.taplo.setup({})
            lspconfig.yamlls.setup({})
            lspconfig.jsonls.setup({})

            -- vim.lsp.buf.hover
            -- vim.lsp.buf.definition
            -- vim.lsp.buf.code_action
            map_key("K", vim.lsp.buf.hover)
            map_key("gd", vim.lsp.buf.definition)
            map_key("<leader>ca", vim.lsp.buf.code_action)
        end
    }
}
