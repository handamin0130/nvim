local map_key = require("utils.key_mapper").map_key

-- Neotree toggle
map_key("<leader>e", ":Neotree toggle<cr>")

-- pane navigation
map_key("<C-h>", "<C-w>h") -- Left
map_key("<C-j>", "<C-w>j") -- Down
map_key("<C-k>", "<C-w>k") -- Up
map_key("<C-l>", "<C-w>l") -- Right

-- clear search highlight
map_key("<leader>h", ":nohlsearch<CR>")

-- indent
map_key("<", "<gv", "v")
map_key(">", ">gv", "v")

-- save
map_key("<leader>s", ":w")
