local map_key = require("utils.key_mapper").map_key

return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
   config = function()
        map_key("<leader>ms", "<Plug>MarkdownPreview")
        map_key("<leader>mc", "<Plug>MarkdownPreviewStop")
    end, 
    ft = { "markdown" },
}
