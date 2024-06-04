local map_key = require("utils.key_mapper").map_key

return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local util = require("lspconfig/util")
        
        -- rust
        lspconfig.rust_analyzer.setup({
            root_dir = util.root_pattern("Cargo.toml"),
            settings = {
                ["rust-analyzer"] = {
                    procMacro = { enable = true },
                    cargo = { allFeatures = true },
                    checkOnSave = {
                        command = "clippy",
                        extraArgs = { "--no-deps" },
                    },
                },
            },
        })

        -- docs

        -- keymaps
        map_key("K", vim.lsp.buf.hover)
        map_key("gd", vim.lsp.buf.definition)
        map_key("<leader>ca", vim.lsp.buf.code_action)
    end,
}