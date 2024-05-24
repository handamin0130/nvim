local map_key = require("utils.key_mapper").map_key

return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({})

			map_key("<leader>t", ":ToggleTerm<CR>")
		end,
	},
}
