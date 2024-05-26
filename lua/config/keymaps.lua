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
map_key("<leader>s", ":w<CR>")

-- delete
map_key("<leader>d", '"_d', "n") -- Normal mode
map_key("<leader>d", '"_d', "x") -- Visual mode
map_key("<leader>p", '"_dP', "x") -- Visual mode

-- exit
map_key("<leader>q", ":wq<CR>") -- current view exit
map_key("<leader>x", ":wqa<CR>") -- nvim exit
