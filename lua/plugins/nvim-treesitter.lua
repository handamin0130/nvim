return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "lua",

                "c", "cpp", "cmake",
                "rust", "ron",

                "bash",

                "wgsl", "wgsl_bevy",
                
                "ini",
                "markdown", "markdown_inline",
                "json", "json5", "jsonc", "toml", "yaml",
                "csv",

                "tmux",

                "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}
