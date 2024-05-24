return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local logo = {
			[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣻⣽⢶⣴⣿⣿⣿⣿⣿⣿⢿⣶⣭⣛⠿⣿⣮⣕⠤⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟ ]],
			[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⣛⣻⣿⣿⣿⡏⣽⠙⣿⣿⢿⠇⠛⠉⠈⠋⠻⠛⠓⠌⠙⠿⣷⠆⠀⠰⡀⠀⠁⠀⠈⠛⣛⢿⣿⣿⣿⣿⣿⣿⣳⣿ ]],
			[[ ⣿⣿⣿⣿⣿⣿⣿⢿⠏⠀⣠⣾⣿⣿⣿⡟⢱⣿⢰⠹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣰⡤⠐⠂⠀⠀⢸⣷⢻⣿⣿⣿⣿⣿⣿⣿ ]],
			[[ ⣿⣿⣿⣿⣿⡟⠉⠉⢔⣵⣿⣿⣿⡿⡟⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠈⢀⠀⠀⠀⠈⠻⣆⣿⣿⣿⣿⣿⣿⣿ ]],
			[[ ⣿⣿⣿⣿⡿⢀⠐⡡⣺⣿⣿⡿⡻⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⣿⣸⣿⣿⣿⣿⣻⣿ ]],
			[[ ⣿⣿⣿⣿⣿⢁⡾⣱⣿⡿⠏⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣹⡏⣿⣿⣿⣿⣿⣝ ]],
			[[ ⣿⣿⣿⣿⢯⢏⢢⣿⣿⠁⠀⠀⠀⠀⣠⠀⠀⠠⠤⠀⠀⠀⠀⠀⢀⠀⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⢿⢹⣿⣿⣿⣿⣿ ]],
			[[ ⣿⣿⣿⡟⣎⡎⣿⣿⠇⠀⠀⠀⠀⢠⣿⡆⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠬⠏⣿⣿⣿⣿⣿ ]],
			[[ ⣿⣿⣿⡇⡽⣼⡏⠃⠀⠀⠀⠀⢠⣯⣭⣭⠀⠀⠀⠀⠀⠀⠐⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⡱⣿⣷⣿⣿⣿ ]],
			[[ ⣿⣿⣿⡟⡲⡳⠈⠀⠀⠀⠀⠀⣾⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢧⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⢸⣿⣿⣿⣿ ]],
			[[ ⣿⣿⡿⠗⠁⠀⠀⠀⠀⠀⠀⠀⠻⠿⠿⠿⣟⡀⠀⠀⠀⠀⠀⢳⡤⠍⠓⠒⠂⠀⠄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢯⢿⣿⣿⣿ ]],
			[[ ⣿⣯⡬⡄⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡆⠠⡄⢘⣕⠀⠠⡀⠀⠀⠹⣶⠆⠀⡖⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢋⢿⣿⣿ ]],
			[[ ⣿⣿⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⢊⢿⣧⡀⢃⢀⢹⣷⣶⣬⣷⣶⣶⣾⠶⢠⣤⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡃⡆⠀⠀⠀⠀⠀⠈⢷⣻⣿ ]],
			[[ ⣿⣏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣷⣿⣾⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣁⠀⠀⠀⠀⠀⠀⠈⢷⡽ ]],
			[[ ⡟⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢌⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢞⠉⠠⠔⠀⠀⠀⠀⠀⠀⠀⡐⣦⡄⣰⡄⠀⠀⠀⠀⠀⠀⠀⠹ ]],
			[[ ⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢛⣻⣿⣿⣿⣛⢿⣿⣿⣿⣿⣿⣿⣿⡂⡀⣀⣤⣀⣀⣀⠀⠀⠀⢸⣜⣺⡇⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀ ]],
			[[ ⠁⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⣦⠨⡦⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣭⣀⢦⡻⣿⡾⠿⠞⠫⣿⠃⠀⠀⠘⣿⣿⢻⢻⣿⡀⠀⠀⠀⠀⠀⠀⠀ ]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⡸⠀⠀⠀⡏⠐⠋⠀⠀⠊⠝⡻⢿⣿⣿⣿⡟⣱⡿⠋⡀⠑⠉⢛⠛⠐⠐⠀⠈⠀⠀⠀⠀⠻⠟⢮⣏⣿⣧⠀⠀⠀⠀⠀⠀⠀ ]],
			[[ ⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀⡇⢸⡮⠁⠀⠄⠀⠀⠀⠄⠁⢀⣆⡿⢃⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠊⠛⠧⠀⠀⠀⠀⠀⠀ ]],
			[[ ⠀⠀⠀⠀⠀⣰⡟⠀⠀⠀⠀⠇⢠⠃⠈⠀⠰⠀⠉⠁⠀⡄⣿⠟⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠴⠒⠒⠀⠀⠀⠀ ]],
			[[ ⠀⠀⠀⠀⣰⡯⠆⡄⠀⠀⠀⠃⢈⣴⡆⠀⠀⠀⠀⡀⣴⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠄⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠁⠀⠀⠲⢦⣀⠀⠀ ]],
			[[ ⠀⠀⠀⠈⠛⣼⠀⡇⠀⠀⠀⢸⣿⠃⠈⠀⠀⠀⠀⣼⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠟⠀⠀⠀⠀⠀⠀⠀⠙⡆⠀ ]],
			[[ ⠀⠀⠀⢀⣼⣿⢸⢸⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡜⠃⠀⠀⠀⠀⠀⠠⠀⠀⠀⢹⠀ ]],
			[[ ⠀⠀⣠⣾⣿⣿⣷⡾⢠⠀⣰⣿⡇⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠠ ]],
			[[ ⠀⢸⣿⣿⣿⣿⣿⣇⡜⠀⠿⢿⡇⠀⠀⠀⠀⠀⠀⢸⢿⣿⣿⣿⡄⠀⢀⣴⡦⠀⠀⠀⠀⠀⠀⢀⠠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣣⠈ ]],
			[[ ⠀⠈⠻⣿⣿⡿⣻⡋⠀⢤⠀⠈⣣⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⡿⣿⣿⡿⠛⠁⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣭⠍ ]],
		}

		dashboard.section.header.val = logo

		vim.api.nvim_set_hl(0, "I2A0", { fg = "#d7c7d1" })
		vim.api.nvim_set_hl(0, "I2A1", { fg = "#d5c8d1" })
		vim.api.nvim_set_hl(0, "I2A2", { fg = "#d3c9d1" })
		vim.api.nvim_set_hl(0, "I2A3", { fg = "#d5c9d1" })
		vim.api.nvim_set_hl(0, "I2A4", { fg = "#c5b8bd" })
		vim.api.nvim_set_hl(0, "I2A5", { fg = "#d5c9cf" })
		vim.api.nvim_set_hl(0, "I2A6", { fg = "#d1cad1" })
		vim.api.nvim_set_hl(0, "I2A7", { fg = "#d2c9d1" })
		vim.api.nvim_set_hl(0, "I2A8", { fg = "#d2cad1" })
		vim.api.nvim_set_hl(0, "I2A9", { fg = "#d1cad0" })
		vim.api.nvim_set_hl(0, "I2A10", { fg = "#d6c8ce" })
		vim.api.nvim_set_hl(0, "I2A11", { fg = "#b29d9f" })
		vim.api.nvim_set_hl(0, "I2A12", { fg = "#a28783" })
		vim.api.nvim_set_hl(0, "I2A13", { fg = "#aa8686" })
		vim.api.nvim_set_hl(0, "I2A14", { fg = "#9f7c7c" })
		vim.api.nvim_set_hl(0, "I2A15", { fg = "#ae8c8b" })
		vim.api.nvim_set_hl(0, "I2A16", { fg = "#ae8b8a" })
		vim.api.nvim_set_hl(0, "I2A17", { fg = "#ad8889" })
		vim.api.nvim_set_hl(0, "I2A18", { fg = "#a98384" })
		vim.api.nvim_set_hl(0, "I2A19", { fg = "#aa8586" })
		vim.api.nvim_set_hl(0, "I2A20", { fg = "#ac8788" })
		vim.api.nvim_set_hl(0, "I2A21", { fg = "#ac8789" })
		vim.api.nvim_set_hl(0, "I2A22", { fg = "#926e6f" })
		vim.api.nvim_set_hl(0, "I2A23", { fg = "#947071" })
		vim.api.nvim_set_hl(0, "I2A24", { fg = "#a98586" })
		vim.api.nvim_set_hl(0, "I2A25", { fg = "#9d797b" })
		vim.api.nvim_set_hl(0, "I2A26", { fg = "#927173" })
		vim.api.nvim_set_hl(0, "I2A27", { fg = "#8d6d72" })
		vim.api.nvim_set_hl(0, "I2A28", { fg = "#5c3c40" })
		vim.api.nvim_set_hl(0, "I2A29", { fg = "#654148" })
		vim.api.nvim_set_hl(0, "I2A30", { fg = "#663e44" })
		vim.api.nvim_set_hl(0, "I2A31", { fg = "#623e43" })
		vim.api.nvim_set_hl(0, "I2A32", { fg = "#603e44" })
		vim.api.nvim_set_hl(0, "I2A33", { fg = "#ccb9be" })
		vim.api.nvim_set_hl(0, "I2A34", { fg = "#d0cbd0" })
		vim.api.nvim_set_hl(0, "I2A35", { fg = "#d3c8d0" })
		vim.api.nvim_set_hl(0, "I2A36", { fg = "#d2c8d0" })
		vim.api.nvim_set_hl(0, "I2A37", { fg = "#d0c9d0" })
		vim.api.nvim_set_hl(0, "I2A38", { fg = "#d1c8d1" })
		vim.api.nvim_set_hl(0, "I2A39", { fg = "#d4c8cc" })
		vim.api.nvim_set_hl(0, "I2A40", { fg = "#c2b1b4" })
		vim.api.nvim_set_hl(0, "I2A41", { fg = "#d4c8d0" })
		vim.api.nvim_set_hl(0, "I2A42", { fg = "#cfbdc7" })
		vim.api.nvim_set_hl(0, "I2A43", { fg = "#b9abb1" })
		vim.api.nvim_set_hl(0, "I2A44", { fg = "#dfcfd3" })
		vim.api.nvim_set_hl(0, "I2A45", { fg = "#8d7479" })
		vim.api.nvim_set_hl(0, "I2A46", { fg = "#896c71" })
		vim.api.nvim_set_hl(0, "I2A47", { fg = "#a07f86" })
		vim.api.nvim_set_hl(0, "I2A48", { fg = "#a9888a" })
		vim.api.nvim_set_hl(0, "I2A49", { fg = "#ae8c8a" })
		vim.api.nvim_set_hl(0, "I2A50", { fg = "#b08e8d" })
		vim.api.nvim_set_hl(0, "I2A51", { fg = "#9a7676" })
		vim.api.nvim_set_hl(0, "I2A52", { fg = "#a28081" })
		vim.api.nvim_set_hl(0, "I2A53", { fg = "#916f70" })
		vim.api.nvim_set_hl(0, "I2A54", { fg = "#ad8a8a" })
		vim.api.nvim_set_hl(0, "I2A55", { fg = "#aa8786" })
		vim.api.nvim_set_hl(0, "I2A56", { fg = "#8d6c6e" })
		vim.api.nvim_set_hl(0, "I2A57", { fg = "#997a7c" })
		vim.api.nvim_set_hl(0, "I2A58", { fg = "#836364" })
		vim.api.nvim_set_hl(0, "I2A59", { fg = "#7a5c60" })
		vim.api.nvim_set_hl(0, "I2A60", { fg = "#836569" })
		vim.api.nvim_set_hl(0, "I2A61", { fg = "#8f6e73" })
		vim.api.nvim_set_hl(0, "I2A62", { fg = "#88646b" })
		vim.api.nvim_set_hl(0, "I2A63", { fg = "#937479" })
		vim.api.nvim_set_hl(0, "I2A64", { fg = "#785e61" })
		vim.api.nvim_set_hl(0, "I2A65", { fg = "#7b6264" })
		vim.api.nvim_set_hl(0, "I2A66", { fg = "#9e8082" })
		vim.api.nvim_set_hl(0, "I2A67", { fg = "#a68284" })
		vim.api.nvim_set_hl(0, "I2A68", { fg = "#6f4e53" })
		vim.api.nvim_set_hl(0, "I2A69", { fg = "#512c33" })
		vim.api.nvim_set_hl(0, "I2A70", { fg = "#937071" })
		vim.api.nvim_set_hl(0, "I2A71", { fg = "#6f4c4f" })
		vim.api.nvim_set_hl(0, "I2A72", { fg = "#4a2c31" })
		vim.api.nvim_set_hl(0, "I2A73", { fg = "#59383d" })
		vim.api.nvim_set_hl(0, "I2A74", { fg = "#684447" })
		vim.api.nvim_set_hl(0, "I2A75", { fg = "#623d45" })
		vim.api.nvim_set_hl(0, "I2A76", { fg = "#866e74" })
		vim.api.nvim_set_hl(0, "I2A77", { fg = "#99888d" })
		vim.api.nvim_set_hl(0, "I2A78", { fg = "#cfc6ca" })
		vim.api.nvim_set_hl(0, "I2A79", { fg = "#d7cad3" })
		vim.api.nvim_set_hl(0, "I2A80", { fg = "#cac2c6" })
		vim.api.nvim_set_hl(0, "I2A81", { fg = "#f3f5fb" })
		vim.api.nvim_set_hl(0, "I2A82", { fg = "#ddd1d8" })
		vim.api.nvim_set_hl(0, "I2A83", { fg = "#c7b3ba" })
		vim.api.nvim_set_hl(0, "I2A84", { fg = "#9e8589" })
		vim.api.nvim_set_hl(0, "I2A85", { fg = "#664144" })
		vim.api.nvim_set_hl(0, "I2A86", { fg = "#684645" })
		vim.api.nvim_set_hl(0, "I2A87", { fg = "#b18d8c" })
		vim.api.nvim_set_hl(0, "I2A88", { fg = "#b48c8d" })
		vim.api.nvim_set_hl(0, "I2A89", { fg = "#b28c8c" })
		vim.api.nvim_set_hl(0, "I2A90", { fg = "#b08c8c" })
		vim.api.nvim_set_hl(0, "I2A91", { fg = "#9d7e7c" })
		vim.api.nvim_set_hl(0, "I2A92", { fg = "#8e706e" })
		vim.api.nvim_set_hl(0, "I2A93", { fg = "#ac8c8d" })
		vim.api.nvim_set_hl(0, "I2A94", { fg = "#846565" })
		vim.api.nvim_set_hl(0, "I2A95", { fg = "#86696a" })
		vim.api.nvim_set_hl(0, "I2A96", { fg = "#7b6063" })
		vim.api.nvim_set_hl(0, "I2A97", { fg = "#796062" })
		vim.api.nvim_set_hl(0, "I2A98", { fg = "#7a5e63" })
		vim.api.nvim_set_hl(0, "I2A99", { fg = "#73585d" })
		vim.api.nvim_set_hl(0, "I2A100", { fg = "#785d61" })
		vim.api.nvim_set_hl(0, "I2A101", { fg = "#785b61" })
		vim.api.nvim_set_hl(0, "I2A102", { fg = "#775b60" })
		vim.api.nvim_set_hl(0, "I2A103", { fg = "#765b5f" })
		vim.api.nvim_set_hl(0, "I2A104", { fg = "#664f52" })
		vim.api.nvim_set_hl(0, "I2A105", { fg = "#675254" })
		vim.api.nvim_set_hl(0, "I2A106", { fg = "#715b5e" })
		vim.api.nvim_set_hl(0, "I2A107", { fg = "#735b5f" })
		vim.api.nvim_set_hl(0, "I2A108", { fg = "#694b51" })
		vim.api.nvim_set_hl(0, "I2A109", { fg = "#663f46" })
		vim.api.nvim_set_hl(0, "I2A110", { fg = "#6b454c" })
		vim.api.nvim_set_hl(0, "I2A111", { fg = "#6e4e4f" })
		vim.api.nvim_set_hl(0, "I2A112", { fg = "#6e4d4d" })
		vim.api.nvim_set_hl(0, "I2A113", { fg = "#967171" })
		vim.api.nvim_set_hl(0, "I2A114", { fg = "#a27c7e" })
		vim.api.nvim_set_hl(0, "I2A115", { fg = "#845e61" })
		vim.api.nvim_set_hl(0, "I2A116", { fg = "#93696b" })
		vim.api.nvim_set_hl(0, "I2A117", { fg = "#836264" })
		vim.api.nvim_set_hl(0, "I2A118", { fg = "#5f3e41" })
		vim.api.nvim_set_hl(0, "I2A119", { fg = "#735156" })
		vim.api.nvim_set_hl(0, "I2A120", { fg = "#a07e7d" })
		vim.api.nvim_set_hl(0, "I2A121", { fg = "#a49097" })
		vim.api.nvim_set_hl(0, "I2A122", { fg = "#d1c9d0" })
		vim.api.nvim_set_hl(0, "I2A123", { fg = "#d1c8d0" })
		vim.api.nvim_set_hl(0, "I2A124", { fg = "#d1c9cf" })
		vim.api.nvim_set_hl(0, "I2A125", { fg = "#c4b5b9" })
		vim.api.nvim_set_hl(0, "I2A126", { fg = "#f2f5f7" })
		vim.api.nvim_set_hl(0, "I2A127", { fg = "#f1f5fe" })
		vim.api.nvim_set_hl(0, "I2A128", { fg = "#a28a91" })
		vim.api.nvim_set_hl(0, "I2A129", { fg = "#6b4650" })
		vim.api.nvim_set_hl(0, "I2A130", { fg = "#724f54" })
		vim.api.nvim_set_hl(0, "I2A131", { fg = "#735252" })
		vim.api.nvim_set_hl(0, "I2A132", { fg = "#a2817f" })
		vim.api.nvim_set_hl(0, "I2A133", { fg = "#af8b8b" })
		vim.api.nvim_set_hl(0, "I2A134", { fg = "#af8d8c" })
		vim.api.nvim_set_hl(0, "I2A135", { fg = "#a78785" })
		vim.api.nvim_set_hl(0, "I2A136", { fg = "#8e7171" })
		vim.api.nvim_set_hl(0, "I2A137", { fg = "#715458" })
		vim.api.nvim_set_hl(0, "I2A138", { fg = "#6e5155" })
		vim.api.nvim_set_hl(0, "I2A139", { fg = "#7c6065" })
		vim.api.nvim_set_hl(0, "I2A140", { fg = "#644a4e" })
		vim.api.nvim_set_hl(0, "I2A141", { fg = "#60484b" })
		vim.api.nvim_set_hl(0, "I2A142", { fg = "#765f61" })
		vim.api.nvim_set_hl(0, "I2A143", { fg = "#775c61" })
		vim.api.nvim_set_hl(0, "I2A144", { fg = "#755a5f" })
		vim.api.nvim_set_hl(0, "I2A145", { fg = "#6f565a" })
		vim.api.nvim_set_hl(0, "I2A146", { fg = "#72595d" })
		vim.api.nvim_set_hl(0, "I2A147", { fg = "#72585d" })
		vim.api.nvim_set_hl(0, "I2A148", { fg = "#72585c" })
		vim.api.nvim_set_hl(0, "I2A149", { fg = "#6f585b" })
		vim.api.nvim_set_hl(0, "I2A150", { fg = "#6c5659" })
		vim.api.nvim_set_hl(0, "I2A151", { fg = "#5f494b" })
		vim.api.nvim_set_hl(0, "I2A152", { fg = "#6f575c" })
		vim.api.nvim_set_hl(0, "I2A153", { fg = "#6f555b" })
		vim.api.nvim_set_hl(0, "I2A154", { fg = "#503437" })
		vim.api.nvim_set_hl(0, "I2A155", { fg = "#59383a" })
		vim.api.nvim_set_hl(0, "I2A156", { fg = "#5a3c3e" })
		vim.api.nvim_set_hl(0, "I2A157", { fg = "#533435" })
		vim.api.nvim_set_hl(0, "I2A158", { fg = "#6d4c4d" })
		vim.api.nvim_set_hl(0, "I2A159", { fg = "#6a4546" })
		vim.api.nvim_set_hl(0, "I2A160", { fg = "#84605f" })
		vim.api.nvim_set_hl(0, "I2A161", { fg = "#502f34" })
		vim.api.nvim_set_hl(0, "I2A162", { fg = "#492830" })
		vim.api.nvim_set_hl(0, "I2A163", { fg = "#412a2f" })
		vim.api.nvim_set_hl(0, "I2A164", { fg = "#3e3735" })
		vim.api.nvim_set_hl(0, "I2A165", { fg = "#6e5658" })
		vim.api.nvim_set_hl(0, "I2A166", { fg = "#927475" })
		vim.api.nvim_set_hl(0, "I2A167", { fg = "#dbc9d4" })
		vim.api.nvim_set_hl(0, "I2A168", { fg = "#d2c7d1" })
		vim.api.nvim_set_hl(0, "I2A169", { fg = "#bdaab2" })
		vim.api.nvim_set_hl(0, "I2A170", { fg = "#f4f3fa" })
		vim.api.nvim_set_hl(0, "I2A171", { fg = "#f4f3f9" })
		vim.api.nvim_set_hl(0, "I2A172", { fg = "#d3c9d0" })
		vim.api.nvim_set_hl(0, "I2A173", { fg = "#baa8ad" })
		vim.api.nvim_set_hl(0, "I2A174", { fg = "#6e4a4c" })
		vim.api.nvim_set_hl(0, "I2A175", { fg = "#7b5859" })
		vim.api.nvim_set_hl(0, "I2A176", { fg = "#7e5b5d" })
		vim.api.nvim_set_hl(0, "I2A177", { fg = "#9d7a79" })
		vim.api.nvim_set_hl(0, "I2A178", { fg = "#af8c8a" })
		vim.api.nvim_set_hl(0, "I2A179", { fg = "#ae8a8a" })
		vim.api.nvim_set_hl(0, "I2A180", { fg = "#977575" })
		vim.api.nvim_set_hl(0, "I2A181", { fg = "#6f5253" })
		vim.api.nvim_set_hl(0, "I2A182", { fg = "#695053" })
		vim.api.nvim_set_hl(0, "I2A183", { fg = "#5d4448" })
		vim.api.nvim_set_hl(0, "I2A184", { fg = "#7a5d62" })
		vim.api.nvim_set_hl(0, "I2A185", { fg = "#755b60" })
		vim.api.nvim_set_hl(0, "I2A186", { fg = "#553f42" })
		vim.api.nvim_set_hl(0, "I2A187", { fg = "#6e585b" })
		vim.api.nvim_set_hl(0, "I2A188", { fg = "#6d5458" })
		vim.api.nvim_set_hl(0, "I2A189", { fg = "#73595e" })
		vim.api.nvim_set_hl(0, "I2A190", { fg = "#70595d" })
		vim.api.nvim_set_hl(0, "I2A191", { fg = "#6e575a" })
		vim.api.nvim_set_hl(0, "I2A192", { fg = "#695356" })
		vim.api.nvim_set_hl(0, "I2A193", { fg = "#6b5559" })
		vim.api.nvim_set_hl(0, "I2A194", { fg = "#6c555b" })
		vim.api.nvim_set_hl(0, "I2A195", { fg = "#6d555b" })
		vim.api.nvim_set_hl(0, "I2A196", { fg = "#695459" })
		vim.api.nvim_set_hl(0, "I2A197", { fg = "#5f494e" })
		vim.api.nvim_set_hl(0, "I2A198", { fg = "#6e595e" })
		vim.api.nvim_set_hl(0, "I2A199", { fg = "#454141" })
		vim.api.nvim_set_hl(0, "I2A200", { fg = "#392c30" })
		vim.api.nvim_set_hl(0, "I2A201", { fg = "#42262c" })
		vim.api.nvim_set_hl(0, "I2A202", { fg = "#6c4e52" })
		vim.api.nvim_set_hl(0, "I2A203", { fg = "#6f5156" })
		vim.api.nvim_set_hl(0, "I2A204", { fg = "#563a3f" })
		vim.api.nvim_set_hl(0, "I2A205", { fg = "#482e32" })
		vim.api.nvim_set_hl(0, "I2A206", { fg = "#4a3037" })
		vim.api.nvim_set_hl(0, "I2A207", { fg = "#452f36" })
		vim.api.nvim_set_hl(0, "I2A208", { fg = "#422e34" })
		vim.api.nvim_set_hl(0, "I2A209", { fg = "#46383c" })
		vim.api.nvim_set_hl(0, "I2A210", { fg = "#383332" })
		vim.api.nvim_set_hl(0, "I2A211", { fg = "#9e7c7e" })
		vim.api.nvim_set_hl(0, "I2A212", { fg = "#977c7f" })
		vim.api.nvim_set_hl(0, "I2A213", { fg = "#d4c5c9" })
		vim.api.nvim_set_hl(0, "I2A214", { fg = "#d2c8d1" })
		vim.api.nvim_set_hl(0, "I2A215", { fg = "#d7c9d1" })
		vim.api.nvim_set_hl(0, "I2A216", { fg = "#c0b3b7" })
		vim.api.nvim_set_hl(0, "I2A217", { fg = "#f2f3f8" })
		vim.api.nvim_set_hl(0, "I2A218", { fg = "#d2c7ce" })
		vim.api.nvim_set_hl(0, "I2A219", { fg = "#dbcad0" })
		vim.api.nvim_set_hl(0, "I2A220", { fg = "#bfabb0" })
		vim.api.nvim_set_hl(0, "I2A221", { fg = "#614444" })
		vim.api.nvim_set_hl(0, "I2A222", { fg = "#a38384" })
		vim.api.nvim_set_hl(0, "I2A223", { fg = "#8b696a" })
		vim.api.nvim_set_hl(0, "I2A224", { fg = "#ac8a8b" })
		vim.api.nvim_set_hl(0, "I2A225", { fg = "#a88687" })
		vim.api.nvim_set_hl(0, "I2A226", { fg = "#957377" })
		vim.api.nvim_set_hl(0, "I2A227", { fg = "#8f7173" })
		vim.api.nvim_set_hl(0, "I2A228", { fg = "#6b5154" })
		vim.api.nvim_set_hl(0, "I2A229", { fg = "#664e51" })
		vim.api.nvim_set_hl(0, "I2A230", { fg = "#5f494c" })
		vim.api.nvim_set_hl(0, "I2A231", { fg = "#755f62" })
		vim.api.nvim_set_hl(0, "I2A232", { fg = "#765b60" })
		vim.api.nvim_set_hl(0, "I2A233", { fg = "#6f575b" })
		vim.api.nvim_set_hl(0, "I2A234", { fg = "#4f393c" })
		vim.api.nvim_set_hl(0, "I2A235", { fg = "#685255" })
		vim.api.nvim_set_hl(0, "I2A236", { fg = "#705a5d" })
		vim.api.nvim_set_hl(0, "I2A237", { fg = "#6e5559" })
		vim.api.nvim_set_hl(0, "I2A238", { fg = "#5b4449" })
		vim.api.nvim_set_hl(0, "I2A239", { fg = "#6d565c" })
		vim.api.nvim_set_hl(0, "I2A240", { fg = "#6c5257" })
		vim.api.nvim_set_hl(0, "I2A241", { fg = "#8a6f75" })
		vim.api.nvim_set_hl(0, "I2A242", { fg = "#7f6469" })
		vim.api.nvim_set_hl(0, "I2A243", { fg = "#6e5b5e" })
		vim.api.nvim_set_hl(0, "I2A244", { fg = "#433c3e" })
		vim.api.nvim_set_hl(0, "I2A245", { fg = "#63565a" })
		vim.api.nvim_set_hl(0, "I2A246", { fg = "#4e3c3e" })
		vim.api.nvim_set_hl(0, "I2A247", { fg = "#3b2528" })
		vim.api.nvim_set_hl(0, "I2A248", { fg = "#3e3034" })
		vim.api.nvim_set_hl(0, "I2A249", { fg = "#362a2e" })
		vim.api.nvim_set_hl(0, "I2A250", { fg = "#554349" })
		vim.api.nvim_set_hl(0, "I2A251", { fg = "#553e46" })
		vim.api.nvim_set_hl(0, "I2A252", { fg = "#2d2829" })
		vim.api.nvim_set_hl(0, "I2A253", { fg = "#353334" })
		vim.api.nvim_set_hl(0, "I2A254", { fg = "#3a3434" })
		vim.api.nvim_set_hl(0, "I2A255", { fg = "#745c60" })
		vim.api.nvim_set_hl(0, "I2A256", { fg = "#9a7879" })
		vim.api.nvim_set_hl(0, "I2A257", { fg = "#6d4f53" })
		vim.api.nvim_set_hl(0, "I2A258", { fg = "#c1afb4" })
		vim.api.nvim_set_hl(0, "I2A259", { fg = "#d5c6cd" })
		vim.api.nvim_set_hl(0, "I2A260", { fg = "#d2c6cf" })
		vim.api.nvim_set_hl(0, "I2A261", { fg = "#d5c6ce" })
		vim.api.nvim_set_hl(0, "I2A262", { fg = "#a8979f" })
		vim.api.nvim_set_hl(0, "I2A263", { fg = "#d3cbcf" })
		vim.api.nvim_set_hl(0, "I2A264", { fg = "#bfaeb5" })
		vim.api.nvim_set_hl(0, "I2A265", { fg = "#dccdd3" })
		vim.api.nvim_set_hl(0, "I2A266", { fg = "#bfa6ab" })
		vim.api.nvim_set_hl(0, "I2A267", { fg = "#846164" })
		vim.api.nvim_set_hl(0, "I2A268", { fg = "#937172" })
		vim.api.nvim_set_hl(0, "I2A269", { fg = "#ac8988" })
		vim.api.nvim_set_hl(0, "I2A270", { fg = "#a78586" })
		vim.api.nvim_set_hl(0, "I2A271", { fg = "#7e6062" })
		vim.api.nvim_set_hl(0, "I2A272", { fg = "#7c5f63" })
		vim.api.nvim_set_hl(0, "I2A273", { fg = "#62484d" })
		vim.api.nvim_set_hl(0, "I2A274", { fg = "#594245" })
		vim.api.nvim_set_hl(0, "I2A275", { fg = "#7b5c61" })
		vim.api.nvim_set_hl(0, "I2A276", { fg = "#513a3e" })
		vim.api.nvim_set_hl(0, "I2A277", { fg = "#907679" })
		vim.api.nvim_set_hl(0, "I2A278", { fg = "#987e81" })
		vim.api.nvim_set_hl(0, "I2A279", { fg = "#72575b" })
		vim.api.nvim_set_hl(0, "I2A280", { fg = "#766063" })
		vim.api.nvim_set_hl(0, "I2A281", { fg = "#4f383e" })
		vim.api.nvim_set_hl(0, "I2A282", { fg = "#6b545a" })
		vim.api.nvim_set_hl(0, "I2A283", { fg = "#785a5f" })
		vim.api.nvim_set_hl(0, "I2A284", { fg = "#8c6d72" })
		vim.api.nvim_set_hl(0, "I2A285", { fg = "#8d7175" })
		vim.api.nvim_set_hl(0, "I2A286", { fg = "#7b6065" })
		vim.api.nvim_set_hl(0, "I2A287", { fg = "#71565b" })
		vim.api.nvim_set_hl(0, "I2A288", { fg = "#6b5055" })
		vim.api.nvim_set_hl(0, "I2A289", { fg = "#654f54" })
		vim.api.nvim_set_hl(0, "I2A290", { fg = "#6c595d" })
		vim.api.nvim_set_hl(0, "I2A291", { fg = "#55444a" })
		vim.api.nvim_set_hl(0, "I2A292", { fg = "#342a2d" })
		vim.api.nvim_set_hl(0, "I2A293", { fg = "#5e585a" })
		vim.api.nvim_set_hl(0, "I2A294", { fg = "#393939" })
		vim.api.nvim_set_hl(0, "I2A295", { fg = "#2d2c2d" })
		vim.api.nvim_set_hl(0, "I2A296", { fg = "#56454a" })
		vim.api.nvim_set_hl(0, "I2A297", { fg = "#675355" })
		vim.api.nvim_set_hl(0, "I2A298", { fg = "#604b50" })
		vim.api.nvim_set_hl(0, "I2A299", { fg = "#5a464b" })
		vim.api.nvim_set_hl(0, "I2A300", { fg = "#5b484a" })
		vim.api.nvim_set_hl(0, "I2A301", { fg = "#5f474c" })
		vim.api.nvim_set_hl(0, "I2A302", { fg = "#9d7f7f" })
		vim.api.nvim_set_hl(0, "I2A303", { fg = "#9a7c7b" })
		vim.api.nvim_set_hl(0, "I2A304", { fg = "#8a7a79" })
		vim.api.nvim_set_hl(0, "I2A305", { fg = "#b7a6ac" })
		vim.api.nvim_set_hl(0, "I2A306", { fg = "#d1c6cd" })
		vim.api.nvim_set_hl(0, "I2A307", { fg = "#d2c9ce" })
		vim.api.nvim_set_hl(0, "I2A308", { fg = "#d4c9d1" })
		vim.api.nvim_set_hl(0, "I2A309", { fg = "#b7a7ad" })
		vim.api.nvim_set_hl(0, "I2A310", { fg = "#d8c9d1" })
		vim.api.nvim_set_hl(0, "I2A311", { fg = "#9d8a8d" })
		vim.api.nvim_set_hl(0, "I2A312", { fg = "#937373" })
		vim.api.nvim_set_hl(0, "I2A313", { fg = "#795758" })
		vim.api.nvim_set_hl(0, "I2A314", { fg = "#ab898a" })
		vim.api.nvim_set_hl(0, "I2A315", { fg = "#907172" })
		vim.api.nvim_set_hl(0, "I2A316", { fg = "#765e61" })
		vim.api.nvim_set_hl(0, "I2A317", { fg = "#6d5257" })
		vim.api.nvim_set_hl(0, "I2A318", { fg = "#5e4549" })
		vim.api.nvim_set_hl(0, "I2A319", { fg = "#755556" })
		vim.api.nvim_set_hl(0, "I2A320", { fg = "#c19c9d" })
		vim.api.nvim_set_hl(0, "I2A321", { fg = "#7e5e62" })
		vim.api.nvim_set_hl(0, "I2A322", { fg = "#594346" })
		vim.api.nvim_set_hl(0, "I2A323", { fg = "#6e5759" })
		vim.api.nvim_set_hl(0, "I2A324", { fg = "#72585b" })
		vim.api.nvim_set_hl(0, "I2A325", { fg = "#5c444a" })
		vim.api.nvim_set_hl(0, "I2A326", { fg = "#5a464a" })
		vim.api.nvim_set_hl(0, "I2A327", { fg = "#6a5157" })
		vim.api.nvim_set_hl(0, "I2A328", { fg = "#644d53" })
		vim.api.nvim_set_hl(0, "I2A329", { fg = "#675056" })
		vim.api.nvim_set_hl(0, "I2A330", { fg = "#715a60" })
		vim.api.nvim_set_hl(0, "I2A331", { fg = "#634c52" })
		vim.api.nvim_set_hl(0, "I2A332", { fg = "#624b4f" })
		vim.api.nvim_set_hl(0, "I2A333", { fg = "#70585c" })
		vim.api.nvim_set_hl(0, "I2A334", { fg = "#543b3f" })
		vim.api.nvim_set_hl(0, "I2A335", { fg = "#6f585e" })
		vim.api.nvim_set_hl(0, "I2A336", { fg = "#70575d" })
		vim.api.nvim_set_hl(0, "I2A337", { fg = "#564549" })
		vim.api.nvim_set_hl(0, "I2A338", { fg = "#383333" })
		vim.api.nvim_set_hl(0, "I2A339", { fg = "#5f4d51" })
		vim.api.nvim_set_hl(0, "I2A340", { fg = "#5d474c" })
		vim.api.nvim_set_hl(0, "I2A341", { fg = "#473237" })
		vim.api.nvim_set_hl(0, "I2A342", { fg = "#5d474b" })
		vim.api.nvim_set_hl(0, "I2A343", { fg = "#4b3538" })
		vim.api.nvim_set_hl(0, "I2A344", { fg = "#70585b" })
		vim.api.nvim_set_hl(0, "I2A345", { fg = "#a18181" })
		vim.api.nvim_set_hl(0, "I2A346", { fg = "#674d50" })
		vim.api.nvim_set_hl(0, "I2A347", { fg = "#d8cbd2" })
		vim.api.nvim_set_hl(0, "I2A348", { fg = "#d1bec0" })
		vim.api.nvim_set_hl(0, "I2A349", { fg = "#d7c7cd" })
		vim.api.nvim_set_hl(0, "I2A350", { fg = "#b7a7aa" })
		vim.api.nvim_set_hl(0, "I2A351", { fg = "#d4c9d3" })
		vim.api.nvim_set_hl(0, "I2A352", { fg = "#9f8a8f" })
		vim.api.nvim_set_hl(0, "I2A353", { fg = "#9d7e81" })
		vim.api.nvim_set_hl(0, "I2A354", { fg = "#a28084" })
		vim.api.nvim_set_hl(0, "I2A355", { fg = "#997a7d" })
		vim.api.nvim_set_hl(0, "I2A356", { fg = "#7b5d5f" })
		vim.api.nvim_set_hl(0, "I2A357", { fg = "#795c60" })
		vim.api.nvim_set_hl(0, "I2A358", { fg = "#795b61" })
		vim.api.nvim_set_hl(0, "I2A359", { fg = "#513e3f" })
		vim.api.nvim_set_hl(0, "I2A360", { fg = "#7b5b5e" })
		vim.api.nvim_set_hl(0, "I2A361", { fg = "#c29ca1" })
		vim.api.nvim_set_hl(0, "I2A362", { fg = "#d8babc" })
		vim.api.nvim_set_hl(0, "I2A363", { fg = "#be9d9c" })
		vim.api.nvim_set_hl(0, "I2A364", { fg = "#6b5256" })
		vim.api.nvim_set_hl(0, "I2A365", { fg = "#564144" })
		vim.api.nvim_set_hl(0, "I2A366", { fg = "#6b5658" })
		vim.api.nvim_set_hl(0, "I2A367", { fg = "#6d5659" })
		vim.api.nvim_set_hl(0, "I2A368", { fg = "#543e41" })
		vim.api.nvim_set_hl(0, "I2A369", { fg = "#5e424a" })
		vim.api.nvim_set_hl(0, "I2A370", { fg = "#7d5d64" })
		vim.api.nvim_set_hl(0, "I2A371", { fg = "#5f4749" })
		vim.api.nvim_set_hl(0, "I2A372", { fg = "#63494d" })
		vim.api.nvim_set_hl(0, "I2A373", { fg = "#6b5157" })
		vim.api.nvim_set_hl(0, "I2A374", { fg = "#634a50" })
		vim.api.nvim_set_hl(0, "I2A375", { fg = "#584247" })
		vim.api.nvim_set_hl(0, "I2A376", { fg = "#5e434a" })
		vim.api.nvim_set_hl(0, "I2A377", { fg = "#50353c" })
		vim.api.nvim_set_hl(0, "I2A378", { fg = "#452c32" })
		vim.api.nvim_set_hl(0, "I2A379", { fg = "#341b21" })
		vim.api.nvim_set_hl(0, "I2A380", { fg = "#301a1d" })
		vim.api.nvim_set_hl(0, "I2A381", { fg = "#6f595c" })
		vim.api.nvim_set_hl(0, "I2A382", { fg = "#725b5e" })
		vim.api.nvim_set_hl(0, "I2A383", { fg = "#625558" })
		vim.api.nvim_set_hl(0, "I2A384", { fg = "#332d2f" })
		vim.api.nvim_set_hl(0, "I2A385", { fg = "#47353b" })
		vim.api.nvim_set_hl(0, "I2A386", { fg = "#5e4a50" })
		vim.api.nvim_set_hl(0, "I2A387", { fg = "#483338" })
		vim.api.nvim_set_hl(0, "I2A388", { fg = "#6d585d" })
		vim.api.nvim_set_hl(0, "I2A389", { fg = "#5b444a" })
		vim.api.nvim_set_hl(0, "I2A390", { fg = "#584046" })
		vim.api.nvim_set_hl(0, "I2A391", { fg = "#634e53" })
		vim.api.nvim_set_hl(0, "I2A392", { fg = "#81666b" })
		vim.api.nvim_set_hl(0, "I2A393", { fg = "#795a5f" })
		vim.api.nvim_set_hl(0, "I2A394", { fg = "#cec6ca" })
		vim.api.nvim_set_hl(0, "I2A395", { fg = "#d4c4cc" })
		vim.api.nvim_set_hl(0, "I2A396", { fg = "#b3a1a3" })
		vim.api.nvim_set_hl(0, "I2A397", { fg = "#d3c7cf" })
		vim.api.nvim_set_hl(0, "I2A398", { fg = "#d9c8cf" })
		vim.api.nvim_set_hl(0, "I2A399", { fg = "#bbaaae" })
		vim.api.nvim_set_hl(0, "I2A400", { fg = "#d4c9d2" })
		vim.api.nvim_set_hl(0, "I2A401", { fg = "#af9a9f" })
		vim.api.nvim_set_hl(0, "I2A402", { fg = "#836466" })
		vim.api.nvim_set_hl(0, "I2A403", { fg = "#8d7073" })
		vim.api.nvim_set_hl(0, "I2A404", { fg = "#5c4143" })
		vim.api.nvim_set_hl(0, "I2A405", { fg = "#755c5f" })
		vim.api.nvim_set_hl(0, "I2A406", { fg = "#765d5e" })
		vim.api.nvim_set_hl(0, "I2A407", { fg = "#755a5e" })
		vim.api.nvim_set_hl(0, "I2A408", { fg = "#45292e" })
		vim.api.nvim_set_hl(0, "I2A409", { fg = "#b88f95" })
		vim.api.nvim_set_hl(0, "I2A410", { fg = "#d7b9bc" })
		vim.api.nvim_set_hl(0, "I2A411", { fg = "#d5b9ba" })
		vim.api.nvim_set_hl(0, "I2A412", { fg = "#d7b8b6" })
		vim.api.nvim_set_hl(0, "I2A413", { fg = "#a5878a" })
		vim.api.nvim_set_hl(0, "I2A414", { fg = "#66484e" })
		vim.api.nvim_set_hl(0, "I2A415", { fg = "#6b5156" })
		vim.api.nvim_set_hl(0, "I2A416", { fg = "#60484c" })
		vim.api.nvim_set_hl(0, "I2A417", { fg = "#6b5558" })
		vim.api.nvim_set_hl(0, "I2A418", { fg = "#493434" })
		vim.api.nvim_set_hl(0, "I2A419", { fg = "#604747" })
		vim.api.nvim_set_hl(0, "I2A420", { fg = "#b18c8e" })
		vim.api.nvim_set_hl(0, "I2A421", { fg = "#b89699" })
		vim.api.nvim_set_hl(0, "I2A422", { fg = "#634548" })
		vim.api.nvim_set_hl(0, "I2A423", { fg = "#593e44" })
		vim.api.nvim_set_hl(0, "I2A424", { fg = "#412b30" })
		vim.api.nvim_set_hl(0, "I2A425", { fg = "#331c21" })
		vim.api.nvim_set_hl(0, "I2A426", { fg = "#59464a" })
		vim.api.nvim_set_hl(0, "I2A427", { fg = "#362629" })
		vim.api.nvim_set_hl(0, "I2A428", { fg = "#342527" })
		vim.api.nvim_set_hl(0, "I2A429", { fg = "#504043" })
		vim.api.nvim_set_hl(0, "I2A430", { fg = "#6f585c" })
		vim.api.nvim_set_hl(0, "I2A431", { fg = "#6f575a" })
		vim.api.nvim_set_hl(0, "I2A432", { fg = "#2c2528" })
		vim.api.nvim_set_hl(0, "I2A433", { fg = "#564349" })
		vim.api.nvim_set_hl(0, "I2A434", { fg = "#5f4c52" })
		vim.api.nvim_set_hl(0, "I2A435", { fg = "#4b363c" })
		vim.api.nvim_set_hl(0, "I2A436", { fg = "#5b464b" })
		vim.api.nvim_set_hl(0, "I2A437", { fg = "#614a4f" })
		vim.api.nvim_set_hl(0, "I2A438", { fg = "#51393f" })
		vim.api.nvim_set_hl(0, "I2A439", { fg = "#5e494e" })
		vim.api.nvim_set_hl(0, "I2A440", { fg = "#91737a" })
		vim.api.nvim_set_hl(0, "I2A441", { fg = "#928083" })
		vim.api.nvim_set_hl(0, "I2A442", { fg = "#d0c5cd" })
		vim.api.nvim_set_hl(0, "I2A443", { fg = "#b7a3aa" })
		vim.api.nvim_set_hl(0, "I2A444", { fg = "#d2c3cd" })
		vim.api.nvim_set_hl(0, "I2A445", { fg = "#d3c8cf" })
		vim.api.nvim_set_hl(0, "I2A446", { fg = "#d7c8cd" })
		vim.api.nvim_set_hl(0, "I2A447", { fg = "#cebdc0" })
		vim.api.nvim_set_hl(0, "I2A448", { fg = "#c6b4b5" })
		vim.api.nvim_set_hl(0, "I2A449", { fg = "#816a6c" })
		vim.api.nvim_set_hl(0, "I2A450", { fg = "#5f464a" })
		vim.api.nvim_set_hl(0, "I2A451", { fg = "#674e51" })
		vim.api.nvim_set_hl(0, "I2A452", { fg = "#775e61" })
		vim.api.nvim_set_hl(0, "I2A453", { fg = "#50373a" })
		vim.api.nvim_set_hl(0, "I2A454", { fg = "#755b5f" })
		vim.api.nvim_set_hl(0, "I2A455", { fg = "#76595e" })
		vim.api.nvim_set_hl(0, "I2A456", { fg = "#76585e" })
		vim.api.nvim_set_hl(0, "I2A457", { fg = "#624546" })
		vim.api.nvim_set_hl(0, "I2A458", { fg = "#835253" })
		vim.api.nvim_set_hl(0, "I2A459", { fg = "#986c6b" })
		vim.api.nvim_set_hl(0, "I2A460", { fg = "#947673" })
		vim.api.nvim_set_hl(0, "I2A461", { fg = "#9e7d7b" })
		vim.api.nvim_set_hl(0, "I2A462", { fg = "#a97f80" })
		vim.api.nvim_set_hl(0, "I2A463", { fg = "#8c6a6c" })
		vim.api.nvim_set_hl(0, "I2A464", { fg = "#634d4f" })
		vim.api.nvim_set_hl(0, "I2A465", { fg = "#64484d" })
		vim.api.nvim_set_hl(0, "I2A466", { fg = "#674b51" })
		vim.api.nvim_set_hl(0, "I2A467", { fg = "#61484f" })
		vim.api.nvim_set_hl(0, "I2A468", { fg = "#937878" })
		vim.api.nvim_set_hl(0, "I2A469", { fg = "#ceaeae" })
		vim.api.nvim_set_hl(0, "I2A470", { fg = "#6f524f" })
		vim.api.nvim_set_hl(0, "I2A471", { fg = "#321814" })
		vim.api.nvim_set_hl(0, "I2A472", { fg = "#351d1b" })
		vim.api.nvim_set_hl(0, "I2A473", { fg = "#482f31" })
		vim.api.nvim_set_hl(0, "I2A474", { fg = "#4d3938" })
		vim.api.nvim_set_hl(0, "I2A475", { fg = "#624b47" })
		vim.api.nvim_set_hl(0, "I2A476", { fg = "#5b3a37" })
		vim.api.nvim_set_hl(0, "I2A477", { fg = "#603f41" })
		vim.api.nvim_set_hl(0, "I2A478", { fg = "#6e585f" })
		vim.api.nvim_set_hl(0, "I2A479", { fg = "#72575c" })
		vim.api.nvim_set_hl(0, "I2A480", { fg = "#655b60" })
		vim.api.nvim_set_hl(0, "I2A481", { fg = "#535255" })
		vim.api.nvim_set_hl(0, "I2A482", { fg = "#392e32" })
		vim.api.nvim_set_hl(0, "I2A483", { fg = "#412f35" })
		vim.api.nvim_set_hl(0, "I2A484", { fg = "#463339" })
		vim.api.nvim_set_hl(0, "I2A485", { fg = "#4b393c" })
		vim.api.nvim_set_hl(0, "I2A486", { fg = "#6a565a" })
		vim.api.nvim_set_hl(0, "I2A487", { fg = "#523b41" })
		vim.api.nvim_set_hl(0, "I2A488", { fg = "#553d43" })
		vim.api.nvim_set_hl(0, "I2A489", { fg = "#654c53" })
		vim.api.nvim_set_hl(0, "I2A490", { fg = "#60474e" })
		vim.api.nvim_set_hl(0, "I2A491", { fg = "#9c7d80" })
		vim.api.nvim_set_hl(0, "I2A492", { fg = "#aa989f" })
		vim.api.nvim_set_hl(0, "I2A493", { fg = "#d8c8cf" })
		vim.api.nvim_set_hl(0, "I2A494", { fg = "#d0c3c6" })
		vim.api.nvim_set_hl(0, "I2A495", { fg = "#d5c8ce" })
		vim.api.nvim_set_hl(0, "I2A496", { fg = "#d9c9cd" })
		vim.api.nvim_set_hl(0, "I2A497", { fg = "#b6a3a6" })
		vim.api.nvim_set_hl(0, "I2A498", { fg = "#85696e" })
		vim.api.nvim_set_hl(0, "I2A499", { fg = "#62494e" })
		vim.api.nvim_set_hl(0, "I2A500", { fg = "#634d50" })
		vim.api.nvim_set_hl(0, "I2A501", { fg = "#5b4447" })
		vim.api.nvim_set_hl(0, "I2A502", { fg = "#725a5e" })
		vim.api.nvim_set_hl(0, "I2A503", { fg = "#6d5056" })
		vim.api.nvim_set_hl(0, "I2A504", { fg = "#3e2526" })
		vim.api.nvim_set_hl(0, "I2A505", { fg = "#5c3d3b" })
		vim.api.nvim_set_hl(0, "I2A506", { fg = "#b99a9a" })
		vim.api.nvim_set_hl(0, "I2A507", { fg = "#765b5e" })
		vim.api.nvim_set_hl(0, "I2A508", { fg = "#4f3e40" })
		vim.api.nvim_set_hl(0, "I2A509", { fg = "#88797b" })
		vim.api.nvim_set_hl(0, "I2A510", { fg = "#5c4547" })
		vim.api.nvim_set_hl(0, "I2A511", { fg = "#aa8d8f" })
		vim.api.nvim_set_hl(0, "I2A512", { fg = "#6d5052" })
		vim.api.nvim_set_hl(0, "I2A513", { fg = "#715658" })
		vim.api.nvim_set_hl(0, "I2A514", { fg = "#63484a" })
		vim.api.nvim_set_hl(0, "I2A515", { fg = "#543a3e" })
		vim.api.nvim_set_hl(0, "I2A516", { fg = "#5b4346" })
		vim.api.nvim_set_hl(0, "I2A517", { fg = "#796261" })
		vim.api.nvim_set_hl(0, "I2A518", { fg = "#d3b9b8" })
		vim.api.nvim_set_hl(0, "I2A519", { fg = "#755859" })
		vim.api.nvim_set_hl(0, "I2A520", { fg = "#4f373a" })
		vim.api.nvim_set_hl(0, "I2A521", { fg = "#9f9293" })
		vim.api.nvim_set_hl(0, "I2A522", { fg = "#3f2d30" })
		vim.api.nvim_set_hl(0, "I2A523", { fg = "#5b4745" })
		vim.api.nvim_set_hl(0, "I2A524", { fg = "#593338" })
		vim.api.nvim_set_hl(0, "I2A525", { fg = "#43282c" })
		vim.api.nvim_set_hl(0, "I2A526", { fg = "#654a4f" })
		vim.api.nvim_set_hl(0, "I2A527", { fg = "#6e575d" })
		vim.api.nvim_set_hl(0, "I2A528", { fg = "#6a5458" })
		vim.api.nvim_set_hl(0, "I2A529", { fg = "#685357" })
		vim.api.nvim_set_hl(0, "I2A530", { fg = "#6e5d61" })
		vim.api.nvim_set_hl(0, "I2A531", { fg = "#6e5860" })
		vim.api.nvim_set_hl(0, "I2A532", { fg = "#58454c" })
		vim.api.nvim_set_hl(0, "I2A533", { fg = "#4e383f" })
		vim.api.nvim_set_hl(0, "I2A534", { fg = "#4c363a" })
		vim.api.nvim_set_hl(0, "I2A535", { fg = "#4d363c" })
		vim.api.nvim_set_hl(0, "I2A536", { fg = "#573f46" })
		vim.api.nvim_set_hl(0, "I2A537", { fg = "#574046" })
		vim.api.nvim_set_hl(0, "I2A538", { fg = "#695557" })
		vim.api.nvim_set_hl(0, "I2A539", { fg = "#8c7377" })
		vim.api.nvim_set_hl(0, "I2A540", { fg = "#b8a3a7" })
		vim.api.nvim_set_hl(0, "I2A541", { fg = "#b6a7ab" })
		vim.api.nvim_set_hl(0, "I2A542", { fg = "#d3c9ce" })
		vim.api.nvim_set_hl(0, "I2A543", { fg = "#d5c8cf" })
		vim.api.nvim_set_hl(0, "I2A544", { fg = "#d9cbd2" })
		vim.api.nvim_set_hl(0, "I2A545", { fg = "#7a6567" })
		vim.api.nvim_set_hl(0, "I2A546", { fg = "#422b32" })
		vim.api.nvim_set_hl(0, "I2A547", { fg = "#513a40" })
		vim.api.nvim_set_hl(0, "I2A548", { fg = "#5f484e" })
		vim.api.nvim_set_hl(0, "I2A549", { fg = "#5c464b" })
		vim.api.nvim_set_hl(0, "I2A550", { fg = "#5b4549" })
		vim.api.nvim_set_hl(0, "I2A551", { fg = "#7b595a" })
		vim.api.nvim_set_hl(0, "I2A552", { fg = "#c5a8aa" })
		vim.api.nvim_set_hl(0, "I2A553", { fg = "#d7d1d6" })
		vim.api.nvim_set_hl(0, "I2A554", { fg = "#96757d" })
		vim.api.nvim_set_hl(0, "I2A555", { fg = "#845d5e" })
		vim.api.nvim_set_hl(0, "I2A556", { fg = "#87595a" })
		vim.api.nvim_set_hl(0, "I2A557", { fg = "#a68987" })
		vim.api.nvim_set_hl(0, "I2A558", { fg = "#d3b6b8" })
		vim.api.nvim_set_hl(0, "I2A559", { fg = "#e1c7ca" })
		vim.api.nvim_set_hl(0, "I2A560", { fg = "#d8bec1" })
		vim.api.nvim_set_hl(0, "I2A561", { fg = "#d5bdbf" })
		vim.api.nvim_set_hl(0, "I2A562", { fg = "#d1bcbc" })
		vim.api.nvim_set_hl(0, "I2A563", { fg = "#d5bfbd" })
		vim.api.nvim_set_hl(0, "I2A564", { fg = "#cfb0af" })
		vim.api.nvim_set_hl(0, "I2A565", { fg = "#a98080" })
		vim.api.nvim_set_hl(0, "I2A566", { fg = "#9c6d6d" })
		vim.api.nvim_set_hl(0, "I2A567", { fg = "#b68a8c" })
		vim.api.nvim_set_hl(0, "I2A568", { fg = "#7b5256" })
		vim.api.nvim_set_hl(0, "I2A569", { fg = "#e4c9cb" })
		vim.api.nvim_set_hl(0, "I2A570", { fg = "#6a4548" })
		vim.api.nvim_set_hl(0, "I2A571", { fg = "#5a4445" })
		vim.api.nvim_set_hl(0, "I2A572", { fg = "#6d5359" })
		vim.api.nvim_set_hl(0, "I2A573", { fg = "#685157" })
		vim.api.nvim_set_hl(0, "I2A574", { fg = "#60494f" })
		vim.api.nvim_set_hl(0, "I2A575", { fg = "#624e52" })
		vim.api.nvim_set_hl(0, "I2A576", { fg = "#8c7779" })
		vim.api.nvim_set_hl(0, "I2A577", { fg = "#896e73" })
		vim.api.nvim_set_hl(0, "I2A578", { fg = "#564347" })
		vim.api.nvim_set_hl(0, "I2A579", { fg = "#513c41" })
		vim.api.nvim_set_hl(0, "I2A580", { fg = "#50393f" })
		vim.api.nvim_set_hl(0, "I2A581", { fg = "#624b51" })
		vim.api.nvim_set_hl(0, "I2A582", { fg = "#6a5457" })
		vim.api.nvim_set_hl(0, "I2A583", { fg = "#93767a" })
		vim.api.nvim_set_hl(0, "I2A584", { fg = "#aa9596" })
		vim.api.nvim_set_hl(0, "I2A585", { fg = "#b69fa5" })
		vim.api.nvim_set_hl(0, "I2A586", { fg = "#735a60" })
		vim.api.nvim_set_hl(0, "I2A587", { fg = "#6a5359" })
		vim.api.nvim_set_hl(0, "I2A588", { fg = "#695056" })
		vim.api.nvim_set_hl(0, "I2A589", { fg = "#584147" })
		vim.api.nvim_set_hl(0, "I2A590", { fg = "#5a4349" })
		vim.api.nvim_set_hl(0, "I2A591", { fg = "#523c3f" })
		vim.api.nvim_set_hl(0, "I2A592", { fg = "#bb9791" })
		vim.api.nvim_set_hl(0, "I2A593", { fg = "#c89a98" })
		vim.api.nvim_set_hl(0, "I2A594", { fg = "#ce9c99" })
		vim.api.nvim_set_hl(0, "I2A595", { fg = "#d0a49e" })
		vim.api.nvim_set_hl(0, "I2A596", { fg = "#d1a7a3" })
		vim.api.nvim_set_hl(0, "I2A597", { fg = "#d2aeab" })
		vim.api.nvim_set_hl(0, "I2A598", { fg = "#c0a09f" })
		vim.api.nvim_set_hl(0, "I2A599", { fg = "#d6b8b8" })
		vim.api.nvim_set_hl(0, "I2A600", { fg = "#d5b7b8" })
		vim.api.nvim_set_hl(0, "I2A601", { fg = "#d4b8bb" })
		vim.api.nvim_set_hl(0, "I2A602", { fg = "#d2b6b7" })
		vim.api.nvim_set_hl(0, "I2A603", { fg = "#d2b3b1" })
		vim.api.nvim_set_hl(0, "I2A604", { fg = "#cba19d" })
		vim.api.nvim_set_hl(0, "I2A605", { fg = "#cfa49d" })
		vim.api.nvim_set_hl(0, "I2A606", { fg = "#c99d98" })
		vim.api.nvim_set_hl(0, "I2A607", { fg = "#cfa19c" })
		vim.api.nvim_set_hl(0, "I2A608", { fg = "#cfa4a1" })
		vim.api.nvim_set_hl(0, "I2A609", { fg = "#5c3f3c" })
		vim.api.nvim_set_hl(0, "I2A610", { fg = "#5c4545" })
		vim.api.nvim_set_hl(0, "I2A611", { fg = "#644e51" })
		vim.api.nvim_set_hl(0, "I2A612", { fg = "#543d43" })
		vim.api.nvim_set_hl(0, "I2A613", { fg = "#6d575c" })
		vim.api.nvim_set_hl(0, "I2A614", { fg = "#543f44" })
		vim.api.nvim_set_hl(0, "I2A615", { fg = "#5b454b" })
		vim.api.nvim_set_hl(0, "I2A616", { fg = "#4b3339" })
		vim.api.nvim_set_hl(0, "I2A617", { fg = "#544242" })
		vim.api.nvim_set_hl(0, "I2A618", { fg = "#634e50" })
		vim.api.nvim_set_hl(0, "I2A619", { fg = "#7e666a" })
		vim.api.nvim_set_hl(0, "I2A620", { fg = "#614b51" })
		vim.api.nvim_set_hl(0, "I2A621", { fg = "#4e3b3e" })
		vim.api.nvim_set_hl(0, "I2A622", { fg = "#543c42" })
		vim.api.nvim_set_hl(0, "I2A623", { fg = "#6b565a" })
		vim.api.nvim_set_hl(0, "I2A624", { fg = "#8f7177" })
		vim.api.nvim_set_hl(0, "I2A625", { fg = "#a5888f" })
		vim.api.nvim_set_hl(0, "I2A626", { fg = "#9f8c8f" })
		vim.api.nvim_set_hl(0, "I2A627", { fg = "#836d6a" })
		vim.api.nvim_set_hl(0, "I2A628", { fg = "#6a555c" })
		vim.api.nvim_set_hl(0, "I2A629", { fg = "#5b444b" })
		vim.api.nvim_set_hl(0, "I2A630", { fg = "#5b444c" })
		vim.api.nvim_set_hl(0, "I2A631", { fg = "#5a434b" })
		vim.api.nvim_set_hl(0, "I2A632", { fg = "#5a4248" })
		vim.api.nvim_set_hl(0, "I2A633", { fg = "#654d53" })
		vim.api.nvim_set_hl(0, "I2A634", { fg = "#705756" })
		vim.api.nvim_set_hl(0, "I2A635", { fg = "#caa1a0" })
		vim.api.nvim_set_hl(0, "I2A636", { fg = "#cfa09e" })
		vim.api.nvim_set_hl(0, "I2A637", { fg = "#cd9f9c" })
		vim.api.nvim_set_hl(0, "I2A638", { fg = "#cca3a1" })
		vim.api.nvim_set_hl(0, "I2A639", { fg = "#d1aeac" })
		vim.api.nvim_set_hl(0, "I2A640", { fg = "#d4b4b5" })
		vim.api.nvim_set_hl(0, "I2A641", { fg = "#d6b6ba" })
		vim.api.nvim_set_hl(0, "I2A642", { fg = "#d7b6ba" })
		vim.api.nvim_set_hl(0, "I2A643", { fg = "#d6b7bb" })
		vim.api.nvim_set_hl(0, "I2A644", { fg = "#d5b7b7" })
		vim.api.nvim_set_hl(0, "I2A645", { fg = "#d3b5b2" })
		vim.api.nvim_set_hl(0, "I2A646", { fg = "#d1aaa7" })
		vim.api.nvim_set_hl(0, "I2A647", { fg = "#d0a3a0" })
		vim.api.nvim_set_hl(0, "I2A648", { fg = "#cea4a0" })
		vim.api.nvim_set_hl(0, "I2A649", { fg = "#c69f9a" })
		vim.api.nvim_set_hl(0, "I2A650", { fg = "#b99594" })
		vim.api.nvim_set_hl(0, "I2A651", { fg = "#624344" })
		vim.api.nvim_set_hl(0, "I2A652", { fg = "#91797a" })
		vim.api.nvim_set_hl(0, "I2A653", { fg = "#7f6669" })
		vim.api.nvim_set_hl(0, "I2A654", { fg = "#654a50" })
		vim.api.nvim_set_hl(0, "I2A655", { fg = "#614950" })
		vim.api.nvim_set_hl(0, "I2A656", { fg = "#453136" })
		vim.api.nvim_set_hl(0, "I2A657", { fg = "#604a50" })
		vim.api.nvim_set_hl(0, "I2A658", { fg = "#4b373a" })
		vim.api.nvim_set_hl(0, "I2A659", { fg = "#544143" })
		vim.api.nvim_set_hl(0, "I2A660", { fg = "#6c595b" })
		vim.api.nvim_set_hl(0, "I2A661", { fg = "#d2c3c9" })
		vim.api.nvim_set_hl(0, "I2A662", { fg = "#97878a" })
		vim.api.nvim_set_hl(0, "I2A663", { fg = "#99797b" })
		vim.api.nvim_set_hl(0, "I2A664", { fg = "#5c454b" })
		vim.api.nvim_set_hl(0, "I2A665", { fg = "#473036" })
		vim.api.nvim_set_hl(0, "I2A666", { fg = "#5e474d" })
		vim.api.nvim_set_hl(0, "I2A667", { fg = "#604a4e" })
		vim.api.nvim_set_hl(0, "I2A668", { fg = "#6b5357" })
		vim.api.nvim_set_hl(0, "I2A669", { fg = "#947077" })
		vim.api.nvim_set_hl(0, "I2A670", { fg = "#6c5357" })
		vim.api.nvim_set_hl(0, "I2A671", { fg = "#644b50" })
		vim.api.nvim_set_hl(0, "I2A672", { fg = "#4f383c" })
		vim.api.nvim_set_hl(0, "I2A673", { fg = "#584346" })
		vim.api.nvim_set_hl(0, "I2A674", { fg = "#655154" })
		vim.api.nvim_set_hl(0, "I2A675", { fg = "#4f3b3d" })
		vim.api.nvim_set_hl(0, "I2A676", { fg = "#463136" })
		vim.api.nvim_set_hl(0, "I2A677", { fg = "#453137" })
		vim.api.nvim_set_hl(0, "I2A678", { fg = "#38282b" })
		vim.api.nvim_set_hl(0, "I2A679", { fg = "#412d30" })
		vim.api.nvim_set_hl(0, "I2A680", { fg = "#4e3837" })
		vim.api.nvim_set_hl(0, "I2A681", { fg = "#644b48" })
		vim.api.nvim_set_hl(0, "I2A682", { fg = "#bd9e9e" })
		vim.api.nvim_set_hl(0, "I2A683", { fg = "#d3b3b2" })
		vim.api.nvim_set_hl(0, "I2A684", { fg = "#d4b6b5" })
		vim.api.nvim_set_hl(0, "I2A685", { fg = "#bf9c9c" })
		vim.api.nvim_set_hl(0, "I2A686", { fg = "#a77c77" })
		vim.api.nvim_set_hl(0, "I2A687", { fg = "#bf9c9b" })
		vim.api.nvim_set_hl(0, "I2A688", { fg = "#d6b8b9" })
		vim.api.nvim_set_hl(0, "I2A689", { fg = "#d6b8ba" })
		vim.api.nvim_set_hl(0, "I2A690", { fg = "#d2b6b5" })
		vim.api.nvim_set_hl(0, "I2A691", { fg = "#d2b6b4" })
		vim.api.nvim_set_hl(0, "I2A692", { fg = "#d1b4b2" })
		vim.api.nvim_set_hl(0, "I2A693", { fg = "#795e5e" })
		vim.api.nvim_set_hl(0, "I2A694", { fg = "#816868" })
		vim.api.nvim_set_hl(0, "I2A695", { fg = "#988080" })
		vim.api.nvim_set_hl(0, "I2A696", { fg = "#c4a9ab" })
		vim.api.nvim_set_hl(0, "I2A697", { fg = "#95777b" })
		vim.api.nvim_set_hl(0, "I2A698", { fg = "#aa9092" })
		vim.api.nvim_set_hl(0, "I2A699", { fg = "#a4908f" })
		vim.api.nvim_set_hl(0, "I2A700", { fg = "#544344" })
		vim.api.nvim_set_hl(0, "I2A701", { fg = "#4a383b" })
		vim.api.nvim_set_hl(0, "I2A702", { fg = "#4b383d" })
		vim.api.nvim_set_hl(0, "I2A703", { fg = "#86737a" })
		vim.api.nvim_set_hl(0, "I2A704", { fg = "#c8b8bd" })
		vim.api.nvim_set_hl(0, "I2A705", { fg = "#c0b1b9" })
		vim.api.nvim_set_hl(0, "I2A706", { fg = "#a27f83" })
		vim.api.nvim_set_hl(0, "I2A707", { fg = "#a28085" })
		vim.api.nvim_set_hl(0, "I2A708", { fg = "#4b3638" })
		vim.api.nvim_set_hl(0, "I2A709", { fg = "#584446" })
		vim.api.nvim_set_hl(0, "I2A710", { fg = "#533d42" })
		vim.api.nvim_set_hl(0, "I2A711", { fg = "#493338" })
		vim.api.nvim_set_hl(0, "I2A712", { fg = "#695358" })
		vim.api.nvim_set_hl(0, "I2A713", { fg = "#685356" })
		vim.api.nvim_set_hl(0, "I2A714", { fg = "#654b4f" })
		vim.api.nvim_set_hl(0, "I2A715", { fg = "#614a4e" })
		vim.api.nvim_set_hl(0, "I2A716", { fg = "#553e41" })
		vim.api.nvim_set_hl(0, "I2A717", { fg = "#7e6569" })
		vim.api.nvim_set_hl(0, "I2A718", { fg = "#664e52" })
		vim.api.nvim_set_hl(0, "I2A719", { fg = "#543d42" })
		vim.api.nvim_set_hl(0, "I2A720", { fg = "#a38788" })
		vim.api.nvim_set_hl(0, "I2A721", { fg = "#7e5e5f" })
		vim.api.nvim_set_hl(0, "I2A722", { fg = "#896766" })
		vim.api.nvim_set_hl(0, "I2A723", { fg = "#775453" })
		vim.api.nvim_set_hl(0, "I2A724", { fg = "#977878" })
		vim.api.nvim_set_hl(0, "I2A725", { fg = "#d6b7bc" })
		vim.api.nvim_set_hl(0, "I2A726", { fg = "#d5b8bb" })
		vim.api.nvim_set_hl(0, "I2A727", { fg = "#d6b7ba" })
		vim.api.nvim_set_hl(0, "I2A728", { fg = "#d9bbbb" })
		vim.api.nvim_set_hl(0, "I2A729", { fg = "#886c6b" })
		vim.api.nvim_set_hl(0, "I2A730", { fg = "#b19494" })
		vim.api.nvim_set_hl(0, "I2A731", { fg = "#927171" })
		vim.api.nvim_set_hl(0, "I2A732", { fg = "#977677" })
		vim.api.nvim_set_hl(0, "I2A733", { fg = "#9c7e7e" })
		vim.api.nvim_set_hl(0, "I2A734", { fg = "#d8baba" })
		vim.api.nvim_set_hl(0, "I2A735", { fg = "#b39798" })
		vim.api.nvim_set_hl(0, "I2A736", { fg = "#5e4747" })
		vim.api.nvim_set_hl(0, "I2A737", { fg = "#5b4a48" })
		vim.api.nvim_set_hl(0, "I2A738", { fg = "#604848" })
		vim.api.nvim_set_hl(0, "I2A739", { fg = "#bb9399" })
		vim.api.nvim_set_hl(0, "I2A740", { fg = "#533b3d" })
		vim.api.nvim_set_hl(0, "I2A741", { fg = "#543e43" })
		vim.api.nvim_set_hl(0, "I2A742", { fg = "#6d5b5f" })
		vim.api.nvim_set_hl(0, "I2A743", { fg = "#d6c6d0" })
		vim.api.nvim_set_hl(0, "I2A744", { fg = "#d4c8ce" })
		vim.api.nvim_set_hl(0, "I2A745", { fg = "#785f65" })
		vim.api.nvim_set_hl(0, "I2A746", { fg = "#8e7275" })
		vim.api.nvim_set_hl(0, "I2A747", { fg = "#a08083" })
		vim.api.nvim_set_hl(0, "I2A748", { fg = "#795e62" })
		vim.api.nvim_set_hl(0, "I2A749", { fg = "#483436" })
		vim.api.nvim_set_hl(0, "I2A750", { fg = "#503b40" })
		vim.api.nvim_set_hl(0, "I2A751", { fg = "#5f4a4f" })
		vim.api.nvim_set_hl(0, "I2A752", { fg = "#665056" })
		vim.api.nvim_set_hl(0, "I2A753", { fg = "#4c353b" })
		vim.api.nvim_set_hl(0, "I2A754", { fg = "#563e42" })
		vim.api.nvim_set_hl(0, "I2A755", { fg = "#614c4f" })
		vim.api.nvim_set_hl(0, "I2A756", { fg = "#503b3e" })
		vim.api.nvim_set_hl(0, "I2A757", { fg = "#493336" })
		vim.api.nvim_set_hl(0, "I2A758", { fg = "#564043" })
		vim.api.nvim_set_hl(0, "I2A759", { fg = "#5b4347" })
		vim.api.nvim_set_hl(0, "I2A760", { fg = "#584145" })
		vim.api.nvim_set_hl(0, "I2A761", { fg = "#7e6167" })
		vim.api.nvim_set_hl(0, "I2A762", { fg = "#694f53" })
		vim.api.nvim_set_hl(0, "I2A763", { fg = "#644f51" })
		vim.api.nvim_set_hl(0, "I2A764", { fg = "#50393d" })
		vim.api.nvim_set_hl(0, "I2A765", { fg = "#87686b" })
		vim.api.nvim_set_hl(0, "I2A766", { fg = "#5a4142" })
		vim.api.nvim_set_hl(0, "I2A767", { fg = "#8e7174" })
		vim.api.nvim_set_hl(0, "I2A768", { fg = "#8d6c70" })
		vim.api.nvim_set_hl(0, "I2A769", { fg = "#7d5f61" })
		vim.api.nvim_set_hl(0, "I2A770", { fg = "#8f6f74" })
		vim.api.nvim_set_hl(0, "I2A771", { fg = "#715152" })
		vim.api.nvim_set_hl(0, "I2A772", { fg = "#957776" })
		vim.api.nvim_set_hl(0, "I2A773", { fg = "#d6b9b8" })
		vim.api.nvim_set_hl(0, "I2A774", { fg = "#d3bcbe" })
		vim.api.nvim_set_hl(0, "I2A775", { fg = "#8b7376" })
		vim.api.nvim_set_hl(0, "I2A776", { fg = "#a88b8c" })
		vim.api.nvim_set_hl(0, "I2A777", { fg = "#a98b8b" })
		vim.api.nvim_set_hl(0, "I2A778", { fg = "#8b6c6d" })
		vim.api.nvim_set_hl(0, "I2A779", { fg = "#8a6a6d" })
		vim.api.nvim_set_hl(0, "I2A780", { fg = "#8d6d70" })
		vim.api.nvim_set_hl(0, "I2A781", { fg = "#8e6e71" })
		vim.api.nvim_set_hl(0, "I2A782", { fg = "#97777a" })
		vim.api.nvim_set_hl(0, "I2A783", { fg = "#856568" })
		vim.api.nvim_set_hl(0, "I2A784", { fg = "#89696b" })
		vim.api.nvim_set_hl(0, "I2A785", { fg = "#7d5d5f" })
		vim.api.nvim_set_hl(0, "I2A786", { fg = "#816368" })
		vim.api.nvim_set_hl(0, "I2A787", { fg = "#82686b" })
		vim.api.nvim_set_hl(0, "I2A788", { fg = "#766062" })
		vim.api.nvim_set_hl(0, "I2A789", { fg = "#47373b" })
		vim.api.nvim_set_hl(0, "I2A790", { fg = "#3b3339" })
		vim.api.nvim_set_hl(0, "I2A791", { fg = "#5a4d55" })
		vim.api.nvim_set_hl(0, "I2A792", { fg = "#a39097" })
		vim.api.nvim_set_hl(0, "I2A793", { fg = "#cabfc0" })
		vim.api.nvim_set_hl(0, "I2A794", { fg = "#9a8080" })
		vim.api.nvim_set_hl(0, "I2A795", { fg = "#5f4347" })
		vim.api.nvim_set_hl(0, "I2A796", { fg = "#564243" })
		vim.api.nvim_set_hl(0, "I2A797", { fg = "#584248" })
		vim.api.nvim_set_hl(0, "I2A798", { fg = "#594248" })
		vim.api.nvim_set_hl(0, "I2A799", { fg = "#543b41" })
		vim.api.nvim_set_hl(0, "I2A800", { fg = "#5d464c" })
		vim.api.nvim_set_hl(0, "I2A801", { fg = "#422b31" })
		vim.api.nvim_set_hl(0, "I2A802", { fg = "#594145" })
		vim.api.nvim_set_hl(0, "I2A803", { fg = "#9a797f" })
		vim.api.nvim_set_hl(0, "I2A804", { fg = "#543c41" })
		vim.api.nvim_set_hl(0, "I2A805", { fg = "#634b51" })
		vim.api.nvim_set_hl(0, "I2A806", { fg = "#5b4248" })
		vim.api.nvim_set_hl(0, "I2A807", { fg = "#523c40" })
		vim.api.nvim_set_hl(0, "I2A808", { fg = "#846e71" })
		vim.api.nvim_set_hl(0, "I2A809", { fg = "#9f898f" })
		vim.api.nvim_set_hl(0, "I2A810", { fg = "#897d81" })
		vim.api.nvim_set_hl(0, "I2A811", { fg = "#413035" })
		vim.api.nvim_set_hl(0, "I2A812", { fg = "#7a5b60" })
		vim.api.nvim_set_hl(0, "I2A813", { fg = "#8d6e73" })
		vim.api.nvim_set_hl(0, "I2A814", { fg = "#8b6c71" })
		vim.api.nvim_set_hl(0, "I2A815", { fg = "#816e6f" })
		vim.api.nvim_set_hl(0, "I2A816", { fg = "#2b191a" })
		vim.api.nvim_set_hl(0, "I2A817", { fg = "#917679" })
		vim.api.nvim_set_hl(0, "I2A818", { fg = "#a7888d" })
		vim.api.nvim_set_hl(0, "I2A819", { fg = "#997a7f" })
		vim.api.nvim_set_hl(0, "I2A820", { fg = "#816267" })
		vim.api.nvim_set_hl(0, "I2A821", { fg = "#8c6c71" })
		vim.api.nvim_set_hl(0, "I2A822", { fg = "#826368" })
		vim.api.nvim_set_hl(0, "I2A823", { fg = "#8f7075" })
		vim.api.nvim_set_hl(0, "I2A824", { fg = "#76585c" })
		vim.api.nvim_set_hl(0, "I2A825", { fg = "#917177" })
		vim.api.nvim_set_hl(0, "I2A826", { fg = "#6b4c52" })
		vim.api.nvim_set_hl(0, "I2A827", { fg = "#685355" })
		vim.api.nvim_set_hl(0, "I2A828", { fg = "#38282d" })
		vim.api.nvim_set_hl(0, "I2A829", { fg = "#523e42" })
		vim.api.nvim_set_hl(0, "I2A830", { fg = "#715a5e" })
		vim.api.nvim_set_hl(0, "I2A831", { fg = "#413233" })
		vim.api.nvim_set_hl(0, "I2A832", { fg = "#2e282a" })
		vim.api.nvim_set_hl(0, "I2A833", { fg = "#2f292b" })
		vim.api.nvim_set_hl(0, "I2A834", { fg = "#443e41" })
		vim.api.nvim_set_hl(0, "I2A835", { fg = "#453e41" })
		vim.api.nvim_set_hl(0, "I2A836", { fg = "#463d3d" })
		vim.api.nvim_set_hl(0, "I2A837", { fg = "#4a383c" })
		vim.api.nvim_set_hl(0, "I2A838", { fg = "#645457" })
		vim.api.nvim_set_hl(0, "I2A839", { fg = "#5c4c4f" })
		vim.api.nvim_set_hl(0, "I2A840", { fg = "#372429" })
		vim.api.nvim_set_hl(0, "I2A841", { fg = "#6c555a" })
		vim.api.nvim_set_hl(0, "I2A842", { fg = "#614e4f" })
		vim.api.nvim_set_hl(0, "I2A843", { fg = "#402b30" })
		vim.api.nvim_set_hl(0, "I2A844", { fg = "#564146" })
		vim.api.nvim_set_hl(0, "I2A845", { fg = "#553f47" })
		vim.api.nvim_set_hl(0, "I2A846", { fg = "#5a3e44" })
		vim.api.nvim_set_hl(0, "I2A847", { fg = "#a28488" })
		vim.api.nvim_set_hl(0, "I2A848", { fg = "#553e44" })
		vim.api.nvim_set_hl(0, "I2A849", { fg = "#493034" })
		vim.api.nvim_set_hl(0, "I2A850", { fg = "#3f2e2f" })
		vim.api.nvim_set_hl(0, "I2A851", { fg = "#7d7375" })
		vim.api.nvim_set_hl(0, "I2A852", { fg = "#211a1c" })
		vim.api.nvim_set_hl(0, "I2A853", { fg = "#3f2f32" })
		vim.api.nvim_set_hl(0, "I2A854", { fg = "#86696d" })
		vim.api.nvim_set_hl(0, "I2A855", { fg = "#806468" })
		vim.api.nvim_set_hl(0, "I2A856", { fg = "#8a6b70" })
		vim.api.nvim_set_hl(0, "I2A857", { fg = "#88696e" })
		vim.api.nvim_set_hl(0, "I2A858", { fg = "#8d6f73" })
		vim.api.nvim_set_hl(0, "I2A859", { fg = "#523b3c" })
		vim.api.nvim_set_hl(0, "I2A860", { fg = "#93757a" })
		vim.api.nvim_set_hl(0, "I2A861", { fg = "#b29398" })
		vim.api.nvim_set_hl(0, "I2A862", { fg = "#725358" })
		vim.api.nvim_set_hl(0, "I2A863", { fg = "#896a6f" })
		vim.api.nvim_set_hl(0, "I2A864", { fg = "#76595d" })
		vim.api.nvim_set_hl(0, "I2A865", { fg = "#88686c" })
		vim.api.nvim_set_hl(0, "I2A866", { fg = "#82696b" })
		vim.api.nvim_set_hl(0, "I2A867", { fg = "#291f1f" })
		vim.api.nvim_set_hl(0, "I2A868", { fg = "#2a2929" })
		vim.api.nvim_set_hl(0, "I2A869", { fg = "#2c2426" })
		vim.api.nvim_set_hl(0, "I2A870", { fg = "#382427" })
		vim.api.nvim_set_hl(0, "I2A871", { fg = "#4b3337" })
		vim.api.nvim_set_hl(0, "I2A872", { fg = "#63494e" })
		vim.api.nvim_set_hl(0, "I2A873", { fg = "#423436" })
		vim.api.nvim_set_hl(0, "I2A874", { fg = "#2c2a2b" })
		vim.api.nvim_set_hl(0, "I2A875", { fg = "#2d2a2b" })
		vim.api.nvim_set_hl(0, "I2A876", { fg = "#2e2c2c" })
		vim.api.nvim_set_hl(0, "I2A877", { fg = "#342b2d" })
		vim.api.nvim_set_hl(0, "I2A878", { fg = "#7b696d" })
		vim.api.nvim_set_hl(0, "I2A879", { fg = "#ae9a9e" })
		vim.api.nvim_set_hl(0, "I2A880", { fg = "#413537" })
		vim.api.nvim_set_hl(0, "I2A881", { fg = "#2c2525" })
		vim.api.nvim_set_hl(0, "I2A882", { fg = "#241e1f" })
		vim.api.nvim_set_hl(0, "I2A883", { fg = "#35292b" })
		vim.api.nvim_set_hl(0, "I2A884", { fg = "#4b3a3d" })
		vim.api.nvim_set_hl(0, "I2A885", { fg = "#5d484d" })
		vim.api.nvim_set_hl(0, "I2A886", { fg = "#6a5258" })
		vim.api.nvim_set_hl(0, "I2A887", { fg = "#544349" })
		vim.api.nvim_set_hl(0, "I2A888", { fg = "#412c33" })
		vim.api.nvim_set_hl(0, "I2A889", { fg = "#544044" })
		vim.api.nvim_set_hl(0, "I2A890", { fg = "#573f41" })
		vim.api.nvim_set_hl(0, "I2A891", { fg = "#99797e" })
		vim.api.nvim_set_hl(0, "I2A892", { fg = "#72535b" })
		vim.api.nvim_set_hl(0, "I2A893", { fg = "#9d878d" })
		vim.api.nvim_set_hl(0, "I2A894", { fg = "#573d43" })
		vim.api.nvim_set_hl(0, "I2A895", { fg = "#523d42" })
		vim.api.nvim_set_hl(0, "I2A896", { fg = "#5a4a4a" })
		vim.api.nvim_set_hl(0, "I2A897", { fg = "#947f83" })
		vim.api.nvim_set_hl(0, "I2A898", { fg = "#ae8f94" })
		vim.api.nvim_set_hl(0, "I2A899", { fg = "#8a6e70" })
		vim.api.nvim_set_hl(0, "I2A900", { fg = "#583e42" })
		vim.api.nvim_set_hl(0, "I2A901", { fg = "#83696c" })
		vim.api.nvim_set_hl(0, "I2A902", { fg = "#85676b" })
		vim.api.nvim_set_hl(0, "I2A903", { fg = "#8b6e70" })
		vim.api.nvim_set_hl(0, "I2A904", { fg = "#a78b8e" })
		vim.api.nvim_set_hl(0, "I2A905", { fg = "#ae8f95" })
		vim.api.nvim_set_hl(0, "I2A906", { fg = "#8b6d71" })
		vim.api.nvim_set_hl(0, "I2A907", { fg = "#76575c" })
		vim.api.nvim_set_hl(0, "I2A908", { fg = "#84686c" })
		vim.api.nvim_set_hl(0, "I2A909", { fg = "#7f6568" })
		vim.api.nvim_set_hl(0, "I2A910", { fg = "#7e6467" })
		vim.api.nvim_set_hl(0, "I2A911", { fg = "#896f72" })
		vim.api.nvim_set_hl(0, "I2A912", { fg = "#321e20" })
		vim.api.nvim_set_hl(0, "I2A913", { fg = "#2b2624" })
		vim.api.nvim_set_hl(0, "I2A914", { fg = "#2b2829" })
		vim.api.nvim_set_hl(0, "I2A915", { fg = "#2f272a" })
		vim.api.nvim_set_hl(0, "I2A916", { fg = "#3a292d" })
		vim.api.nvim_set_hl(0, "I2A917", { fg = "#63454c" })
		vim.api.nvim_set_hl(0, "I2A918", { fg = "#5e4048" })
		vim.api.nvim_set_hl(0, "I2A919", { fg = "#52363d" })
		vim.api.nvim_set_hl(0, "I2A920", { fg = "#332b2b" })
		vim.api.nvim_set_hl(0, "I2A921", { fg = "#2b2827" })
		vim.api.nvim_set_hl(0, "I2A922", { fg = "#22201e" })
		vim.api.nvim_set_hl(0, "I2A923", { fg = "#615252" })
		vim.api.nvim_set_hl(0, "I2A924", { fg = "#685657" })
		vim.api.nvim_set_hl(0, "I2A925", { fg = "#2c2422" })
		vim.api.nvim_set_hl(0, "I2A926", { fg = "#392a2b" })
		vim.api.nvim_set_hl(0, "I2A927", { fg = "#876e72" })
		vim.api.nvim_set_hl(0, "I2A928", { fg = "#896d70" })
		vim.api.nvim_set_hl(0, "I2A929", { fg = "#88686d" })
		vim.api.nvim_set_hl(0, "I2A930", { fg = "#9a7d81" })
		vim.api.nvim_set_hl(0, "I2A931", { fg = "#9f888b" })
		vim.api.nvim_set_hl(0, "I2A932", { fg = "#453236" })
		vim.api.nvim_set_hl(0, "I2A933", { fg = "#533942" })
		vim.api.nvim_set_hl(0, "I2A934", { fg = "#543d41" })
		vim.api.nvim_set_hl(0, "I2A935", { fg = "#6d5055" })
		vim.api.nvim_set_hl(0, "I2A936", { fg = "#917075" })
		vim.api.nvim_set_hl(0, "I2A937", { fg = "#8c6d73" })
		vim.api.nvim_set_hl(0, "I2A938", { fg = "#d7c7cf" })
		vim.api.nvim_set_hl(0, "I2A939", { fg = "#635156" })
		vim.api.nvim_set_hl(0, "I2A940", { fg = "#453032" })
		vim.api.nvim_set_hl(0, "I2A941", { fg = "#5c4247" })
		vim.api.nvim_set_hl(0, "I2A942", { fg = "#412d31" })
		vim.api.nvim_set_hl(0, "I2A943", { fg = "#695255" })
		vim.api.nvim_set_hl(0, "I2A944", { fg = "#9e7f84" })
		vim.api.nvim_set_hl(0, "I2A945", { fg = "#85696d" })
		vim.api.nvim_set_hl(0, "I2A946", { fg = "#81686a" })
		vim.api.nvim_set_hl(0, "I2A947", { fg = "#6a5252" })
		vim.api.nvim_set_hl(0, "I2A948", { fg = "#7d6468" })
		vim.api.nvim_set_hl(0, "I2A949", { fg = "#80656b" })
		vim.api.nvim_set_hl(0, "I2A950", { fg = "#71575a" })
		vim.api.nvim_set_hl(0, "I2A951", { fg = "#aa8d91" })
		vim.api.nvim_set_hl(0, "I2A952", { fg = "#a9888f" })
		vim.api.nvim_set_hl(0, "I2A953", { fg = "#a98990" })
		vim.api.nvim_set_hl(0, "I2A954", { fg = "#96797d" })
		vim.api.nvim_set_hl(0, "I2A955", { fg = "#85686c" })
		vim.api.nvim_set_hl(0, "I2A956", { fg = "#826869" })
		vim.api.nvim_set_hl(0, "I2A957", { fg = "#81696c" })
		vim.api.nvim_set_hl(0, "I2A958", { fg = "#5f474a" })
		vim.api.nvim_set_hl(0, "I2A959", { fg = "#7c6166" })
		vim.api.nvim_set_hl(0, "I2A960", { fg = "#71565d" })
		vim.api.nvim_set_hl(0, "I2A961", { fg = "#7d6267" })
		vim.api.nvim_set_hl(0, "I2A962", { fg = "#7d6365" })
		vim.api.nvim_set_hl(0, "I2A963", { fg = "#85666c" })
		vim.api.nvim_set_hl(0, "I2A964", { fg = "#554648" })
		vim.api.nvim_set_hl(0, "I2A965", { fg = "#332727" })
		vim.api.nvim_set_hl(0, "I2A966", { fg = "#5f4449" })
		vim.api.nvim_set_hl(0, "I2A967", { fg = "#5e4146" })
		vim.api.nvim_set_hl(0, "I2A968", { fg = "#422b2e" })
		vim.api.nvim_set_hl(0, "I2A969", { fg = "#483538" })
		vim.api.nvim_set_hl(0, "I2A970", { fg = "#2a2a2a" })
		vim.api.nvim_set_hl(0, "I2A971", { fg = "#282121" })
		vim.api.nvim_set_hl(0, "I2A972", { fg = "#9c888c" })
		vim.api.nvim_set_hl(0, "I2A973", { fg = "#241c1a" })
		vim.api.nvim_set_hl(0, "I2A974", { fg = "#433534" })
		vim.api.nvim_set_hl(0, "I2A975", { fg = "#88696d" })
		vim.api.nvim_set_hl(0, "I2A976", { fg = "#86686c" })
		vim.api.nvim_set_hl(0, "I2A977", { fg = "#795f5f" })
		vim.api.nvim_set_hl(0, "I2A978", { fg = "#83696b" })
		vim.api.nvim_set_hl(0, "I2A979", { fg = "#816569" })
		vim.api.nvim_set_hl(0, "I2A980", { fg = "#997e81" })
		vim.api.nvim_set_hl(0, "I2A981", { fg = "#5a434a" })
		vim.api.nvim_set_hl(0, "I2A982", { fg = "#60464c" })
		vim.api.nvim_set_hl(0, "I2A983", { fg = "#8c676f" })
		vim.api.nvim_set_hl(0, "I2A984", { fg = "#a58d93" })
		vim.api.nvim_set_hl(0, "I2A985", { fg = "#d4c5cb" })
		vim.api.nvim_set_hl(0, "I2A986", { fg = "#d4c5cc" })
		vim.api.nvim_set_hl(0, "I2A987", { fg = "#726166" })
		vim.api.nvim_set_hl(0, "I2A988", { fg = "#948185" })
		vim.api.nvim_set_hl(0, "I2A989", { fg = "#554044" })
		vim.api.nvim_set_hl(0, "I2A990", { fg = "#50373b" })
		vim.api.nvim_set_hl(0, "I2A991", { fg = "#4c373a" })
		vim.api.nvim_set_hl(0, "I2A992", { fg = "#816a6d" })
		vim.api.nvim_set_hl(0, "I2A993", { fg = "#927479" })
		vim.api.nvim_set_hl(0, "I2A994", { fg = "#7e6367" })
		vim.api.nvim_set_hl(0, "I2A995", { fg = "#7b6165" })
		vim.api.nvim_set_hl(0, "I2A996", { fg = "#664c4f" })
		vim.api.nvim_set_hl(0, "I2A997", { fg = "#a18689" })
		vim.api.nvim_set_hl(0, "I2A998", { fg = "#a28587" })
		vim.api.nvim_set_hl(0, "I2A999", { fg = "#a38588" })
		vim.api.nvim_set_hl(0, "I2A1000", { fg = "#a5858a" })
		vim.api.nvim_set_hl(0, "I2A1001", { fg = "#856b6e" })
		vim.api.nvim_set_hl(0, "I2A1002", { fg = "#806267" })
		vim.api.nvim_set_hl(0, "I2A1003", { fg = "#7d6167" })
		vim.api.nvim_set_hl(0, "I2A1004", { fg = "#7e6368" })
		vim.api.nvim_set_hl(0, "I2A1005", { fg = "#806669" })
		vim.api.nvim_set_hl(0, "I2A1006", { fg = "#7b6163" })
		vim.api.nvim_set_hl(0, "I2A1007", { fg = "#7e6466" })
		vim.api.nvim_set_hl(0, "I2A1008", { fg = "#816268" })
		vim.api.nvim_set_hl(0, "I2A1009", { fg = "#3f2c2f" })
		vim.api.nvim_set_hl(0, "I2A1010", { fg = "#53373b" })
		vim.api.nvim_set_hl(0, "I2A1011", { fg = "#382628" })
		vim.api.nvim_set_hl(0, "I2A1012", { fg = "#423233" })
		vim.api.nvim_set_hl(0, "I2A1013", { fg = "#251f1d" })
		vim.api.nvim_set_hl(0, "I2A1014", { fg = "#846f72" })
		vim.api.nvim_set_hl(0, "I2A1015", { fg = "#4c4040" })
		vim.api.nvim_set_hl(0, "I2A1016", { fg = "#211e1d" })
		vim.api.nvim_set_hl(0, "I2A1017", { fg = "#766365" })
		vim.api.nvim_set_hl(0, "I2A1018", { fg = "#8a6a6f" })
		vim.api.nvim_set_hl(0, "I2A1019", { fg = "#82666a" })
		vim.api.nvim_set_hl(0, "I2A1020", { fg = "#745a5d" })
		vim.api.nvim_set_hl(0, "I2A1021", { fg = "#765d60" })
		vim.api.nvim_set_hl(0, "I2A1022", { fg = "#73595d" })
		vim.api.nvim_set_hl(0, "I2A1023", { fg = "#81656b" })
		vim.api.nvim_set_hl(0, "I2A1024", { fg = "#7b6162" })
		vim.api.nvim_set_hl(0, "I2A1025", { fg = "#7e6363" })
		vim.api.nvim_set_hl(0, "I2A1026", { fg = "#9b8084" })
		vim.api.nvim_set_hl(0, "I2A1027", { fg = "#4c3134" })
		vim.api.nvim_set_hl(0, "I2A1028", { fg = "#7f636a" })
		vim.api.nvim_set_hl(0, "I2A1029", { fg = "#d4c3c8" })
		vim.api.nvim_set_hl(0, "I2A1030", { fg = "#d0c6c9" })
		vim.api.nvim_set_hl(0, "I2A1031", { fg = "#d3c6ca" })
		vim.api.nvim_set_hl(0, "I2A1032", { fg = "#d6c6cb" })
		vim.api.nvim_set_hl(0, "I2A1033", { fg = "#928084" })
		vim.api.nvim_set_hl(0, "I2A1034", { fg = "#796365" })
		vim.api.nvim_set_hl(0, "I2A1035", { fg = "#705959" })
		vim.api.nvim_set_hl(0, "I2A1036", { fg = "#9c7e83" })
		vim.api.nvim_set_hl(0, "I2A1037", { fg = "#8a7074" })
		vim.api.nvim_set_hl(0, "I2A1038", { fg = "#785f62" })
		vim.api.nvim_set_hl(0, "I2A1039", { fg = "#785b60" })
		vim.api.nvim_set_hl(0, "I2A1040", { fg = "#9d8184" })
		vim.api.nvim_set_hl(0, "I2A1041", { fg = "#9d7f83" })
		vim.api.nvim_set_hl(0, "I2A1042", { fg = "#997c80" })
		vim.api.nvim_set_hl(0, "I2A1043", { fg = "#7a6064" })
		vim.api.nvim_set_hl(0, "I2A1044", { fg = "#785e63" })
		vim.api.nvim_set_hl(0, "I2A1045", { fg = "#7c5f64" })
		vim.api.nvim_set_hl(0, "I2A1046", { fg = "#7b5d63" })
		vim.api.nvim_set_hl(0, "I2A1047", { fg = "#795d62" })
		vim.api.nvim_set_hl(0, "I2A1048", { fg = "#7d5f65" })
		vim.api.nvim_set_hl(0, "I2A1049", { fg = "#33282b" })
		vim.api.nvim_set_hl(0, "I2A1050", { fg = "#292224" })
		vim.api.nvim_set_hl(0, "I2A1051", { fg = "#282020" })
		vim.api.nvim_set_hl(0, "I2A1052", { fg = "#7e6c70" })
		vim.api.nvim_set_hl(0, "I2A1053", { fg = "#75696a" })
		vim.api.nvim_set_hl(0, "I2A1054", { fg = "#282522" })
		vim.api.nvim_set_hl(0, "I2A1055", { fg = "#26201e" })
		vim.api.nvim_set_hl(0, "I2A1056", { fg = "#82666c" })
		vim.api.nvim_set_hl(0, "I2A1057", { fg = "#7d6066" })
		vim.api.nvim_set_hl(0, "I2A1058", { fg = "#6b4f54" })
		vim.api.nvim_set_hl(0, "I2A1059", { fg = "#7d6166" })
		vim.api.nvim_set_hl(0, "I2A1060", { fg = "#7a5e61" })
		vim.api.nvim_set_hl(0, "I2A1061", { fg = "#775a5e" })
		vim.api.nvim_set_hl(0, "I2A1062", { fg = "#7b5e62" })
		vim.api.nvim_set_hl(0, "I2A1063", { fg = "#927579" })
		vim.api.nvim_set_hl(0, "I2A1064", { fg = "#50373d" })
		vim.api.nvim_set_hl(0, "I2A1065", { fg = "#8a777e" })
		vim.api.nvim_set_hl(0, "I2A1066", { fg = "#d2c3cc" })
		vim.api.nvim_set_hl(0, "I2A1067", { fg = "#d0c3cc" })
		vim.api.nvim_set_hl(0, "I2A1068", { fg = "#d1c4cd" })
		vim.api.nvim_set_hl(0, "I2A1069", { fg = "#d2c7cf" })
		vim.api.nvim_set_hl(0, "I2A1070", { fg = "#d4c6cc" })
		vim.api.nvim_set_hl(0, "I2A1071", { fg = "#b3a2a4" })
		vim.api.nvim_set_hl(0, "I2A1072", { fg = "#7d6568" })
		vim.api.nvim_set_hl(0, "I2A1073", { fg = "#695054" })
		vim.api.nvim_set_hl(0, "I2A1074", { fg = "#8a7375" })
		vim.api.nvim_set_hl(0, "I2A1075", { fg = "#92787b" })
		vim.api.nvim_set_hl(0, "I2A1076", { fg = "#8d7075" })
		vim.api.nvim_set_hl(0, "I2A1077", { fg = "#775d61" })
		vim.api.nvim_set_hl(0, "I2A1078", { fg = "#745a5e" })
		vim.api.nvim_set_hl(0, "I2A1079", { fg = "#705c5e" })
		vim.api.nvim_set_hl(0, "I2A1080", { fg = "#725d5f" })
		vim.api.nvim_set_hl(0, "I2A1081", { fg = "#6e595c" })
		vim.api.nvim_set_hl(0, "I2A1082", { fg = "#6f5659" })
		vim.api.nvim_set_hl(0, "I2A1083", { fg = "#977a7e" })
		vim.api.nvim_set_hl(0, "I2A1084", { fg = "#98787e" })
		vim.api.nvim_set_hl(0, "I2A1085", { fg = "#97787d" })
		vim.api.nvim_set_hl(0, "I2A1086", { fg = "#94787d" })
		vim.api.nvim_set_hl(0, "I2A1087", { fg = "#876c71" })
		vim.api.nvim_set_hl(0, "I2A1088", { fg = "#967a7f" })
		vim.api.nvim_set_hl(0, "I2A1089", { fg = "#9b7e83" })
		vim.api.nvim_set_hl(0, "I2A1090", { fg = "#75595e" })
		vim.api.nvim_set_hl(0, "I2A1091", { fg = "#745c5f" })
		vim.api.nvim_set_hl(0, "I2A1092", { fg = "#201a1a" })
		vim.api.nvim_set_hl(0, "I2A1093", { fg = "#3c3434" })
		vim.api.nvim_set_hl(0, "I2A1094", { fg = "#5c5052" })
		vim.api.nvim_set_hl(0, "I2A1095", { fg = "#201d20" })
		vim.api.nvim_set_hl(0, "I2A1096", { fg = "#272427" })
		vim.api.nvim_set_hl(0, "I2A1097", { fg = "#242123" })
		vim.api.nvim_set_hl(0, "I2A1098", { fg = "#5c4a4e" })
		vim.api.nvim_set_hl(0, "I2A1099", { fg = "#6b5057" })
		vim.api.nvim_set_hl(0, "I2A1100", { fg = "#765e64" })
		vim.api.nvim_set_hl(0, "I2A1101", { fg = "#765c62" })
		vim.api.nvim_set_hl(0, "I2A1102", { fg = "#74595e" })
		vim.api.nvim_set_hl(0, "I2A1103", { fg = "#765a60" })
		vim.api.nvim_set_hl(0, "I2A1104", { fg = "#765c60" })
		vim.api.nvim_set_hl(0, "I2A1105", { fg = "#74585d" })
		vim.api.nvim_set_hl(0, "I2A1106", { fg = "#977a7f" })
		vim.api.nvim_set_hl(0, "I2A1107", { fg = "#8e7176" })
		vim.api.nvim_set_hl(0, "I2A1108", { fg = "#493439" })
		vim.api.nvim_set_hl(0, "I2A1109", { fg = "#573e44" })
		vim.api.nvim_set_hl(0, "I2A1110", { fg = "#563b42" })
		vim.api.nvim_set_hl(0, "I2A1111", { fg = "#c6b5b9" })
		vim.api.nvim_set_hl(0, "I2A1112", { fg = "#d3c3c7" })
		vim.api.nvim_set_hl(0, "I2A1113", { fg = "#918088" })
		vim.api.nvim_set_hl(0, "I2A1114", { fg = "#907980" })
		vim.api.nvim_set_hl(0, "I2A1115", { fg = "#8e767b" })
		vim.api.nvim_set_hl(0, "I2A1116", { fg = "#735d60" })
		vim.api.nvim_set_hl(0, "I2A1117", { fg = "#8d777a" })
		vim.api.nvim_set_hl(0, "I2A1118", { fg = "#7b646a" })
		vim.api.nvim_set_hl(0, "I2A1119", { fg = "#937b7e" })
		vim.api.nvim_set_hl(0, "I2A1120", { fg = "#826a6f" })
		vim.api.nvim_set_hl(0, "I2A1121", { fg = "#6d575d" })
		vim.api.nvim_set_hl(0, "I2A1122", { fg = "#715b60" })
		vim.api.nvim_set_hl(0, "I2A1123", { fg = "#594448" })
		vim.api.nvim_set_hl(0, "I2A1124", { fg = "#8e7579" })
		vim.api.nvim_set_hl(0, "I2A1125", { fg = "#91787c" })
		vim.api.nvim_set_hl(0, "I2A1126", { fg = "#91777b" })
		vim.api.nvim_set_hl(0, "I2A1127", { fg = "#92787c" })
		vim.api.nvim_set_hl(0, "I2A1128", { fg = "#937a7d" })
		vim.api.nvim_set_hl(0, "I2A1129", { fg = "#8b7175" })
		vim.api.nvim_set_hl(0, "I2A1130", { fg = "#70595c" })
		vim.api.nvim_set_hl(0, "I2A1131", { fg = "#705a5c" })
		vim.api.nvim_set_hl(0, "I2A1132", { fg = "#6f595d" })
		vim.api.nvim_set_hl(0, "I2A1133", { fg = "#725b60" })
		vim.api.nvim_set_hl(0, "I2A1134", { fg = "#1c1717" })
		vim.api.nvim_set_hl(0, "I2A1135", { fg = "#262221" })
		vim.api.nvim_set_hl(0, "I2A1136", { fg = "#2a2225" })
		vim.api.nvim_set_hl(0, "I2A1137", { fg = "#38262c" })
		vim.api.nvim_set_hl(0, "I2A1138", { fg = "#6f575e" })
		vim.api.nvim_set_hl(0, "I2A1139", { fg = "#685154" })
		vim.api.nvim_set_hl(0, "I2A1140", { fg = "#745e61" })
		vim.api.nvim_set_hl(0, "I2A1141", { fg = "#745b5f" })
		vim.api.nvim_set_hl(0, "I2A1142", { fg = "#735a5e" })
		vim.api.nvim_set_hl(0, "I2A1143", { fg = "#987b80" })
		vim.api.nvim_set_hl(0, "I2A1144", { fg = "#7f676a" })
		dashboard.section.header.opts.hl = {
			{
				{ "I2A0", 0, 3 },
				{ "I2A1", 3, 6 },
				{ "I2A2", 6, 9 },
				{ "I2A2", 9, 12 },
				{ "I2A2", 12, 15 },
				{ "I2A3", 15, 18 },
				{ "I2A4", 18, 21 },
				{ "I2A5", 21, 24 },
				{ "I2A2", 24, 27 },
				{ "I2A6", 27, 30 },
				{ "I2A7", 30, 33 },
				{ "I2A7", 33, 36 },
				{ "I2A8", 36, 39 },
				{ "I2A9", 39, 42 },
				{ "I2A10", 42, 45 },
				{ "I2A11", 45, 48 },
				{ "I2A12", 48, 51 },
				{ "I2A13", 51, 54 },
				{ "I2A14", 54, 57 },
				{ "I2A15", 57, 60 },
				{ "I2A16", 60, 63 },
				{ "I2A17", 63, 66 },
				{ "I2A18", 66, 69 },
				{ "I2A17", 69, 72 },
				{ "I2A19", 72, 75 },
				{ "I2A20", 75, 78 },
				{ "I2A21", 78, 81 },
				{ "I2A22", 81, 84 },
				{ "I2A23", 84, 87 },
				{ "I2A19", 87, 90 },
				{ "I2A24", 90, 93 },
				{ "I2A25", 93, 96 },
				{ "I2A26", 96, 99 },
				{ "I2A27", 99, 102 },
				{ "I2A28", 102, 105 },
				{ "I2A29", 105, 108 },
				{ "I2A30", 108, 111 },
				{ "I2A31", 111, 114 },
				{ "I2A32", 114, 117 },
				{ "I2A33", 117, 120 },
				{ "I2A2", 120, 123 },
				{ "I2A34", 123, 126 },
				{ "I2A34", 126, 129 },
				{ "I2A35", 129, 132 },
				{ "I2A36", 132, 135 },
				{ "I2A37", 135, 138 },
				{ "I2A36", 138, 141 },
				{ "I2A36", 141, 144 },
				{ "I2A36", 144, 147 },
				{ "I2A36", 147, 150 },
				{ "I2A38", 150, 153 },
				{ "I2A39", 153, 156 },
				{ "I2A40", 156, 159 },
			},
			{
				{ "I2A2", 0, 3 },
				{ "I2A2", 3, 6 },
				{ "I2A2", 6, 9 },
				{ "I2A2", 9, 12 },
				{ "I2A2", 12, 15 },
				{ "I2A7", 15, 18 },
				{ "I2A41", 18, 21 },
				{ "I2A42", 21, 24 },
				{ "I2A43", 24, 27 },
				{ "I2A44", 27, 30 },
				{ "I2A45", 30, 33 },
				{ "I2A46", 33, 36 },
				{ "I2A47", 36, 39 },
				{ "I2A48", 39, 42 },
				{ "I2A49", 42, 45 },
				{ "I2A50", 45, 48 },
				{ "I2A51", 48, 51 },
				{ "I2A52", 51, 54 },
				{ "I2A53", 54, 57 },
				{ "I2A54", 57, 60 },
				{ "I2A54", 60, 63 },
				{ "I2A55", 63, 66 },
				{ "I2A56", 66, 69 },
				{ "I2A57", 69, 72 },
				{ "I2A58", 72, 75 },
				{ "I2A59", 75, 78 },
				{ "I2A60", 78, 81 },
				{ "I2A61", 81, 84 },
				{ "I2A62", 84, 87 },
				{ "I2A63", 87, 90 },
				{ "I2A64", 90, 93 },
				{ "I2A65", 93, 96 },
				{ "I2A66", 96, 99 },
				{ "I2A67", 99, 102 },
				{ "I2A68", 102, 105 },
				{ "I2A69", 105, 108 },
				{ "I2A70", 108, 111 },
				{ "I2A71", 111, 114 },
				{ "I2A72", 114, 117 },
				{ "I2A73", 117, 120 },
				{ "I2A74", 120, 123 },
				{ "I2A75", 123, 126 },
				{ "I2A76", 126, 129 },
				{ "I2A77", 129, 132 },
				{ "I2A78", 132, 135 },
				{ "I2A2", 135, 138 },
				{ "I2A36", 138, 141 },
				{ "I2A36", 141, 144 },
				{ "I2A37", 144, 147 },
				{ "I2A36", 147, 150 },
				{ "I2A79", 150, 153 },
				{ "I2A80", 153, 156 },
				{ "I2A81", 156, 159 },
			},
			{
				{ "I2A2", 0, 3 },
				{ "I2A2", 3, 6 },
				{ "I2A2", 6, 9 },
				{ "I2A2", 9, 12 },
				{ "I2A2", 12, 15 },
				{ "I2A7", 15, 18 },
				{ "I2A82", 18, 21 },
				{ "I2A83", 21, 24 },
				{ "I2A84", 24, 27 },
				{ "I2A85", 27, 30 },
				{ "I2A86", 30, 33 },
				{ "I2A87", 33, 36 },
				{ "I2A88", 36, 39 },
				{ "I2A89", 39, 42 },
				{ "I2A90", 42, 45 },
				{ "I2A91", 45, 48 },
				{ "I2A92", 48, 51 },
				{ "I2A93", 51, 54 },
				{ "I2A94", 54, 57 },
				{ "I2A95", 57, 60 },
				{ "I2A96", 60, 63 },
				{ "I2A97", 63, 66 },
				{ "I2A98", 66, 69 },
				{ "I2A99", 69, 72 },
				{ "I2A100", 72, 75 },
				{ "I2A101", 75, 78 },
				{ "I2A102", 78, 81 },
				{ "I2A103", 81, 84 },
				{ "I2A104", 84, 87 },
				{ "I2A105", 87, 90 },
				{ "I2A106", 90, 93 },
				{ "I2A107", 93, 96 },
				{ "I2A108", 96, 99 },
				{ "I2A109", 99, 102 },
				{ "I2A110", 102, 105 },
				{ "I2A111", 105, 108 },
				{ "I2A112", 108, 111 },
				{ "I2A113", 111, 114 },
				{ "I2A114", 114, 117 },
				{ "I2A115", 117, 120 },
				{ "I2A116", 120, 123 },
				{ "I2A117", 123, 126 },
				{ "I2A118", 126, 129 },
				{ "I2A119", 129, 132 },
				{ "I2A120", 132, 135 },
				{ "I2A121", 135, 138 },
				{ "I2A36", 138, 141 },
				{ "I2A122", 141, 144 },
				{ "I2A123", 144, 147 },
				{ "I2A124", 147, 150 },
				{ "I2A125", 150, 153 },
				{ "I2A126", 153, 156 },
				{ "I2A127", 156, 159 },
			},
			{
				{ "I2A2", 0, 3 },
				{ "I2A2", 3, 6 },
				{ "I2A2", 6, 9 },
				{ "I2A2", 9, 12 },
				{ "I2A2", 12, 15 },
				{ "I2A128", 15, 18 },
				{ "I2A129", 18, 21 },
				{ "I2A130", 21, 24 },
				{ "I2A131", 24, 27 },
				{ "I2A132", 27, 30 },
				{ "I2A90", 30, 33 },
				{ "I2A133", 33, 36 },
				{ "I2A134", 36, 39 },
				{ "I2A135", 39, 42 },
				{ "I2A136", 42, 45 },
				{ "I2A137", 45, 48 },
				{ "I2A138", 48, 51 },
				{ "I2A139", 51, 54 },
				{ "I2A140", 54, 57 },
				{ "I2A141", 57, 60 },
				{ "I2A142", 60, 63 },
				{ "I2A142", 63, 66 },
				{ "I2A143", 66, 69 },
				{ "I2A144", 69, 72 },
				{ "I2A145", 72, 75 },
				{ "I2A146", 75, 78 },
				{ "I2A147", 78, 81 },
				{ "I2A148", 81, 84 },
				{ "I2A149", 84, 87 },
				{ "I2A150", 87, 90 },
				{ "I2A151", 90, 93 },
				{ "I2A152", 93, 96 },
				{ "I2A153", 96, 99 },
				{ "I2A154", 99, 102 },
				{ "I2A155", 102, 105 },
				{ "I2A156", 105, 108 },
				{ "I2A157", 108, 111 },
				{ "I2A158", 111, 114 },
				{ "I2A159", 114, 117 },
				{ "I2A160", 117, 120 },
				{ "I2A161", 120, 123 },
				{ "I2A162", 123, 126 },
				{ "I2A163", 126, 129 },
				{ "I2A164", 129, 132 },
				{ "I2A165", 132, 135 },
				{ "I2A166", 135, 138 },
				{ "I2A167", 138, 141 },
				{ "I2A7", 141, 144 },
				{ "I2A168", 144, 147 },
				{ "I2A124", 147, 150 },
				{ "I2A169", 150, 153 },
				{ "I2A170", 153, 156 },
				{ "I2A171", 156, 159 },
			},
			{
				{ "I2A2", 0, 3 },
				{ "I2A2", 3, 6 },
				{ "I2A172", 6, 9 },
				{ "I2A8", 9, 12 },
				{ "I2A173", 12, 15 },
				{ "I2A174", 15, 18 },
				{ "I2A175", 18, 21 },
				{ "I2A176", 21, 24 },
				{ "I2A177", 24, 27 },
				{ "I2A178", 27, 30 },
				{ "I2A179", 30, 33 },
				{ "I2A179", 33, 36 },
				{ "I2A180", 36, 39 },
				{ "I2A181", 39, 42 },
				{ "I2A182", 42, 45 },
				{ "I2A183", 45, 48 },
				{ "I2A146", 48, 51 },
				{ "I2A184", 51, 54 },
				{ "I2A185", 54, 57 },
				{ "I2A186", 57, 60 },
				{ "I2A187", 60, 63 },
				{ "I2A188", 63, 66 },
				{ "I2A189", 66, 69 },
				{ "I2A190", 69, 72 },
				{ "I2A191", 72, 75 },
				{ "I2A192", 75, 78 },
				{ "I2A193", 78, 81 },
				{ "I2A194", 81, 84 },
				{ "I2A194", 84, 87 },
				{ "I2A195", 87, 90 },
				{ "I2A196", 90, 93 },
				{ "I2A197", 93, 96 },
				{ "I2A198", 96, 99 },
				{ "I2A199", 99, 102 },
				{ "I2A200", 102, 105 },
				{ "I2A201", 105, 108 },
				{ "I2A202", 108, 111 },
				{ "I2A203", 111, 114 },
				{ "I2A204", 114, 117 },
				{ "I2A205", 117, 120 },
				{ "I2A206", 120, 123 },
				{ "I2A207", 123, 126 },
				{ "I2A208", 126, 129 },
				{ "I2A209", 129, 132 },
				{ "I2A210", 132, 135 },
				{ "I2A211", 135, 138 },
				{ "I2A212", 138, 141 },
				{ "I2A213", 141, 144 },
				{ "I2A36", 144, 147 },
				{ "I2A214", 147, 150 },
				{ "I2A215", 150, 153 },
				{ "I2A216", 153, 156 },
				{ "I2A217", 156, 159 },
			},
			{
				{ "I2A2", 0, 3 },
				{ "I2A2", 3, 6 },
				{ "I2A218", 6, 9 },
				{ "I2A219", 9, 12 },
				{ "I2A220", 12, 15 },
				{ "I2A221", 15, 18 },
				{ "I2A222", 18, 21 },
				{ "I2A223", 21, 24 },
				{ "I2A224", 24, 27 },
				{ "I2A225", 27, 30 },
				{ "I2A226", 30, 33 },
				{ "I2A227", 33, 36 },
				{ "I2A228", 36, 39 },
				{ "I2A229", 39, 42 },
				{ "I2A186", 42, 45 },
				{ "I2A230", 45, 48 },
				{ "I2A231", 48, 51 },
				{ "I2A232", 51, 54 },
				{ "I2A99", 54, 57 },
				{ "I2A233", 57, 60 },
				{ "I2A234", 60, 63 },
				{ "I2A235", 63, 66 },
				{ "I2A236", 66, 69 },
				{ "I2A187", 69, 72 },
				{ "I2A145", 72, 75 },
				{ "I2A237", 75, 78 },
				{ "I2A238", 78, 81 },
				{ "I2A239", 81, 84 },
				{ "I2A239", 84, 87 },
				{ "I2A240", 87, 90 },
				{ "I2A241", 90, 93 },
				{ "I2A242", 93, 96 },
				{ "I2A243", 96, 99 },
				{ "I2A244", 99, 102 },
				{ "I2A245", 102, 105 },
				{ "I2A246", 105, 108 },
				{ "I2A247", 108, 111 },
				{ "I2A248", 111, 114 },
				{ "I2A249", 114, 117 },
				{ "I2A250", 117, 120 },
				{ "I2A251", 120, 123 },
				{ "I2A252", 123, 126 },
				{ "I2A253", 126, 129 },
				{ "I2A254", 129, 132 },
				{ "I2A255", 132, 135 },
				{ "I2A256", 135, 138 },
				{ "I2A257", 138, 141 },
				{ "I2A258", 141, 144 },
				{ "I2A259", 144, 147 },
				{ "I2A260", 147, 150 },
				{ "I2A36", 150, 153 },
				{ "I2A261", 153, 156 },
				{ "I2A262", 156, 159 },
			},
			{
				{ "I2A2", 0, 3 },
				{ "I2A263", 3, 6 },
				{ "I2A264", 6, 9 },
				{ "I2A265", 9, 12 },
				{ "I2A266", 12, 15 },
				{ "I2A267", 15, 18 },
				{ "I2A268", 18, 21 },
				{ "I2A269", 21, 24 },
				{ "I2A270", 24, 27 },
				{ "I2A271", 27, 30 },
				{ "I2A272", 30, 33 },
				{ "I2A64", 33, 36 },
				{ "I2A273", 36, 39 },
				{ "I2A274", 39, 42 },
				{ "I2A275", 42, 45 },
				{ "I2A182", 45, 48 },
				{ "I2A276", 48, 51 },
				{ "I2A277", 51, 54 },
				{ "I2A278", 54, 57 },
				{ "I2A279", 57, 60 },
				{ "I2A185", 60, 63 },
				{ "I2A280", 63, 66 },
				{ "I2A281", 66, 69 },
				{ "I2A282", 69, 72 },
				{ "I2A283", 72, 75 },
				{ "I2A284", 75, 78 },
				{ "I2A285", 78, 81 },
				{ "I2A183", 81, 84 },
				{ "I2A286", 84, 87 },
				{ "I2A287", 87, 90 },
				{ "I2A288", 90, 93 },
				{ "I2A240", 93, 96 },
				{ "I2A289", 96, 99 },
				{ "I2A290", 99, 102 },
				{ "I2A291", 102, 105 },
				{ "I2A292", 105, 108 },
				{ "I2A293", 108, 111 },
				{ "I2A294", 111, 114 },
				{ "I2A295", 114, 117 },
				{ "I2A296", 117, 120 },
				{ "I2A297", 120, 123 },
				{ "I2A298", 123, 126 },
				{ "I2A299", 126, 129 },
				{ "I2A300", 129, 132 },
				{ "I2A301", 132, 135 },
				{ "I2A302", 135, 138 },
				{ "I2A303", 138, 141 },
				{ "I2A304", 141, 144 },
				{ "I2A305", 144, 147 },
				{ "I2A306", 147, 150 },
				{ "I2A214", 150, 153 },
				{ "I2A36", 153, 156 },
				{ "I2A307", 156, 159 },
			},
			{
				{ "I2A308", 0, 3 },
				{ "I2A309", 3, 6 },
				{ "I2A310", 6, 9 },
				{ "I2A311", 9, 12 },
				{ "I2A312", 12, 15 },
				{ "I2A313", 15, 18 },
				{ "I2A224", 18, 21 },
				{ "I2A314", 21, 24 },
				{ "I2A315", 24, 27 },
				{ "I2A316", 27, 30 },
				{ "I2A143", 30, 33 },
				{ "I2A317", 33, 36 },
				{ "I2A318", 36, 39 },
				{ "I2A319", 39, 42 },
				{ "I2A320", 42, 45 },
				{ "I2A321", 45, 48 },
				{ "I2A322", 48, 51 },
				{ "I2A323", 51, 54 },
				{ "I2A324", 54, 57 },
				{ "I2A145", 57, 60 },
				{ "I2A325", 60, 63 },
				{ "I2A326", 63, 66 },
				{ "I2A301", 66, 69 },
				{ "I2A327", 69, 72 },
				{ "I2A328", 72, 75 },
				{ "I2A329", 75, 78 },
				{ "I2A330", 78, 81 },
				{ "I2A331", 81, 84 },
				{ "I2A194", 84, 87 },
				{ "I2A239", 87, 90 },
				{ "I2A194", 90, 93 },
				{ "I2A332", 93, 96 },
				{ "I2A333", 96, 99 },
				{ "I2A334", 99, 102 },
				{ "I2A194", 102, 105 },
				{ "I2A335", 105, 108 },
				{ "I2A336", 108, 111 },
				{ "I2A337", 111, 114 },
				{ "I2A338", 114, 117 },
				{ "I2A339", 117, 120 },
				{ "I2A340", 120, 123 },
				{ "I2A341", 123, 126 },
				{ "I2A196", 126, 129 },
				{ "I2A342", 129, 132 },
				{ "I2A343", 132, 135 },
				{ "I2A344", 135, 138 },
				{ "I2A345", 138, 141 },
				{ "I2A346", 141, 144 },
				{ "I2A347", 144, 147 },
				{ "I2A348", 147, 150 },
				{ "I2A2", 150, 153 },
				{ "I2A36", 153, 156 },
				{ "I2A36", 156, 159 },
			},
			{
				{ "I2A349", 0, 3 },
				{ "I2A350", 3, 6 },
				{ "I2A351", 6, 9 },
				{ "I2A352", 9, 12 },
				{ "I2A353", 12, 15 },
				{ "I2A354", 15, 18 },
				{ "I2A355", 18, 21 },
				{ "I2A356", 21, 24 },
				{ "I2A357", 24, 27 },
				{ "I2A358", 27, 30 },
				{ "I2A103", 30, 33 },
				{ "I2A359", 33, 36 },
				{ "I2A360", 36, 39 },
				{ "I2A361", 39, 42 },
				{ "I2A362", 42, 45 },
				{ "I2A363", 45, 48 },
				{ "I2A202", 48, 51 },
				{ "I2A364", 51, 54 },
				{ "I2A365", 54, 57 },
				{ "I2A366", 57, 60 },
				{ "I2A367", 60, 63 },
				{ "I2A368", 63, 66 },
				{ "I2A369", 66, 69 },
				{ "I2A370", 69, 72 },
				{ "I2A371", 72, 75 },
				{ "I2A372", 75, 78 },
				{ "I2A373", 78, 81 },
				{ "I2A374", 81, 84 },
				{ "I2A328", 84, 87 },
				{ "I2A375", 87, 90 },
				{ "I2A376", 90, 93 },
				{ "I2A377", 93, 96 },
				{ "I2A378", 96, 99 },
				{ "I2A379", 99, 102 },
				{ "I2A380", 102, 105 },
				{ "I2A381", 105, 108 },
				{ "I2A382", 108, 111 },
				{ "I2A383", 111, 114 },
				{ "I2A384", 114, 117 },
				{ "I2A385", 117, 120 },
				{ "I2A386", 120, 123 },
				{ "I2A387", 123, 126 },
				{ "I2A388", 126, 129 },
				{ "I2A389", 129, 132 },
				{ "I2A390", 132, 135 },
				{ "I2A391", 135, 138 },
				{ "I2A392", 138, 141 },
				{ "I2A393", 141, 144 },
				{ "I2A394", 144, 147 },
				{ "I2A395", 147, 150 },
				{ "I2A396", 150, 153 },
				{ "I2A37", 153, 156 },
				{ "I2A397", 156, 159 },
			},
			{
				{ "I2A398", 0, 3 },
				{ "I2A399", 3, 6 },
				{ "I2A400", 6, 9 },
				{ "I2A401", 9, 12 },
				{ "I2A402", 12, 15 },
				{ "I2A403", 15, 18 },
				{ "I2A404", 18, 21 },
				{ "I2A182", 21, 24 },
				{ "I2A405", 24, 27 },
				{ "I2A406", 27, 30 },
				{ "I2A407", 30, 33 },
				{ "I2A408", 33, 36 },
				{ "I2A409", 36, 39 },
				{ "I2A410", 39, 42 },
				{ "I2A411", 42, 45 },
				{ "I2A412", 45, 48 },
				{ "I2A413", 48, 51 },
				{ "I2A414", 51, 54 },
				{ "I2A415", 54, 57 },
				{ "I2A416", 57, 60 },
				{ "I2A417", 60, 63 },
				{ "I2A191", 63, 66 },
				{ "I2A418", 66, 69 },
				{ "I2A419", 69, 72 },
				{ "I2A420", 72, 75 },
				{ "I2A421", 75, 78 },
				{ "I2A422", 78, 81 },
				{ "I2A423", 81, 84 },
				{ "I2A424", 84, 87 },
				{ "I2A425", 87, 90 },
				{ "I2A426", 90, 93 },
				{ "I2A427", 93, 96 },
				{ "I2A428", 96, 99 },
				{ "I2A429", 99, 102 },
				{ "I2A430", 102, 105 },
				{ "I2A430", 105, 108 },
				{ "I2A431", 108, 111 },
				{ "I2A249", 111, 114 },
				{ "I2A432", 114, 117 },
				{ "I2A433", 117, 120 },
				{ "I2A434", 120, 123 },
				{ "I2A435", 123, 126 },
				{ "I2A436", 126, 129 },
				{ "I2A437", 129, 132 },
				{ "I2A438", 132, 135 },
				{ "I2A439", 135, 138 },
				{ "I2A240", 138, 141 },
				{ "I2A440", 141, 144 },
				{ "I2A441", 144, 147 },
				{ "I2A442", 147, 150 },
				{ "I2A443", 150, 153 },
				{ "I2A444", 153, 156 },
				{ "I2A445", 156, 159 },
			},
			{
				{ "I2A446", 0, 3 },
				{ "I2A447", 3, 6 },
				{ "I2A448", 6, 9 },
				{ "I2A449", 9, 12 },
				{ "I2A450", 12, 15 },
				{ "I2A451", 15, 18 },
				{ "I2A452", 18, 21 },
				{ "I2A453", 21, 24 },
				{ "I2A454", 24, 27 },
				{ "I2A455", 27, 30 },
				{ "I2A456", 30, 33 },
				{ "I2A457", 33, 36 },
				{ "I2A458", 36, 39 },
				{ "I2A459", 39, 42 },
				{ "I2A460", 42, 45 },
				{ "I2A461", 45, 48 },
				{ "I2A462", 48, 51 },
				{ "I2A463", 51, 54 },
				{ "I2A464", 54, 57 },
				{ "I2A274", 57, 60 },
				{ "I2A465", 60, 63 },
				{ "I2A466", 63, 66 },
				{ "I2A467", 66, 69 },
				{ "I2A468", 69, 72 },
				{ "I2A469", 72, 75 },
				{ "I2A470", 75, 78 },
				{ "I2A471", 78, 81 },
				{ "I2A472", 81, 84 },
				{ "I2A473", 84, 87 },
				{ "I2A474", 87, 90 },
				{ "I2A475", 90, 93 },
				{ "I2A476", 93, 96 },
				{ "I2A477", 96, 99 },
				{ "I2A478", 99, 102 },
				{ "I2A239", 102, 105 },
				{ "I2A239", 105, 108 },
				{ "I2A479", 108, 111 },
				{ "I2A480", 111, 114 },
				{ "I2A481", 114, 117 },
				{ "I2A482", 117, 120 },
				{ "I2A483", 120, 123 },
				{ "I2A484", 123, 126 },
				{ "I2A485", 126, 129 },
				{ "I2A486", 129, 132 },
				{ "I2A487", 132, 135 },
				{ "I2A488", 135, 138 },
				{ "I2A489", 138, 141 },
				{ "I2A490", 141, 144 },
				{ "I2A491", 144, 147 },
				{ "I2A492", 147, 150 },
				{ "I2A493", 150, 153 },
				{ "I2A494", 153, 156 },
				{ "I2A2", 156, 159 },
			},
			{
				{ "I2A495", 0, 3 },
				{ "I2A496", 3, 6 },
				{ "I2A497", 6, 9 },
				{ "I2A498", 9, 12 },
				{ "I2A499", 12, 15 },
				{ "I2A186", 15, 18 },
				{ "I2A500", 18, 21 },
				{ "I2A501", 21, 24 },
				{ "I2A502", 24, 27 },
				{ "I2A273", 27, 30 },
				{ "I2A503", 30, 33 },
				{ "I2A504", 33, 36 },
				{ "I2A505", 36, 39 },
				{ "I2A506", 39, 42 },
				{ "I2A507", 42, 45 },
				{ "I2A508", 45, 48 },
				{ "I2A509", 48, 51 },
				{ "I2A510", 51, 54 },
				{ "I2A511", 54, 57 },
				{ "I2A512", 57, 60 },
				{ "I2A513", 60, 63 },
				{ "I2A514", 63, 66 },
				{ "I2A515", 66, 69 },
				{ "I2A516", 69, 72 },
				{ "I2A517", 72, 75 },
				{ "I2A518", 75, 78 },
				{ "I2A519", 78, 81 },
				{ "I2A520", 81, 84 },
				{ "I2A521", 84, 87 },
				{ "I2A522", 87, 90 },
				{ "I2A523", 90, 93 },
				{ "I2A524", 93, 96 },
				{ "I2A525", 96, 99 },
				{ "I2A526", 99, 102 },
				{ "I2A335", 102, 105 },
				{ "I2A527", 105, 108 },
				{ "I2A528", 108, 111 },
				{ "I2A529", 111, 114 },
				{ "I2A530", 114, 117 },
				{ "I2A531", 117, 120 },
				{ "I2A532", 120, 123 },
				{ "I2A533", 123, 126 },
				{ "I2A534", 126, 129 },
				{ "I2A342", 129, 132 },
				{ "I2A535", 132, 135 },
				{ "I2A536", 135, 138 },
				{ "I2A328", 138, 141 },
				{ "I2A537", 141, 144 },
				{ "I2A538", 144, 147 },
				{ "I2A539", 147, 150 },
				{ "I2A540", 150, 153 },
				{ "I2A541", 153, 156 },
				{ "I2A542", 156, 159 },
			},
			{
				{ "I2A543", 0, 3 },
				{ "I2A544", 3, 6 },
				{ "I2A545", 6, 9 },
				{ "I2A236", 9, 12 },
				{ "I2A236", 12, 15 },
				{ "I2A546", 15, 18 },
				{ "I2A547", 18, 21 },
				{ "I2A239", 21, 24 },
				{ "I2A527", 24, 27 },
				{ "I2A548", 27, 30 },
				{ "I2A549", 30, 33 },
				{ "I2A550", 33, 36 },
				{ "I2A551", 36, 39 },
				{ "I2A552", 39, 42 },
				{ "I2A553", 42, 45 },
				{ "I2A554", 45, 48 },
				{ "I2A555", 48, 51 },
				{ "I2A556", 51, 54 },
				{ "I2A557", 54, 57 },
				{ "I2A558", 57, 60 },
				{ "I2A559", 60, 63 },
				{ "I2A560", 63, 66 },
				{ "I2A561", 66, 69 },
				{ "I2A562", 69, 72 },
				{ "I2A563", 72, 75 },
				{ "I2A564", 75, 78 },
				{ "I2A565", 78, 81 },
				{ "I2A566", 81, 84 },
				{ "I2A567", 84, 87 },
				{ "I2A568", 87, 90 },
				{ "I2A569", 90, 93 },
				{ "I2A570", 93, 96 },
				{ "I2A571", 96, 99 },
				{ "I2A572", 99, 102 },
				{ "I2A573", 102, 105 },
				{ "I2A527", 105, 108 },
				{ "I2A527", 108, 111 },
				{ "I2A574", 111, 114 },
				{ "I2A390", 114, 117 },
				{ "I2A282", 117, 120 },
				{ "I2A575", 120, 123 },
				{ "I2A331", 123, 126 },
				{ "I2A576", 126, 129 },
				{ "I2A577", 129, 132 },
				{ "I2A578", 132, 135 },
				{ "I2A579", 135, 138 },
				{ "I2A580", 138, 141 },
				{ "I2A581", 141, 144 },
				{ "I2A582", 144, 147 },
				{ "I2A582", 147, 150 },
				{ "I2A583", 150, 153 },
				{ "I2A584", 153, 156 },
				{ "I2A542", 156, 159 },
			},
			{
				{ "I2A79", 0, 3 },
				{ "I2A585", 3, 6 },
				{ "I2A586", 6, 9 },
				{ "I2A282", 9, 12 },
				{ "I2A587", 12, 15 },
				{ "I2A487", 15, 18 },
				{ "I2A194", 18, 21 },
				{ "I2A588", 21, 24 },
				{ "I2A327", 24, 27 },
				{ "I2A589", 27, 30 },
				{ "I2A329", 30, 33 },
				{ "I2A590", 33, 36 },
				{ "I2A591", 36, 39 },
				{ "I2A592", 39, 42 },
				{ "I2A593", 42, 45 },
				{ "I2A594", 45, 48 },
				{ "I2A595", 48, 51 },
				{ "I2A596", 51, 54 },
				{ "I2A597", 54, 57 },
				{ "I2A598", 57, 60 },
				{ "I2A599", 60, 63 },
				{ "I2A600", 63, 66 },
				{ "I2A601", 66, 69 },
				{ "I2A602", 69, 72 },
				{ "I2A603", 72, 75 },
				{ "I2A604", 75, 78 },
				{ "I2A605", 78, 81 },
				{ "I2A606", 81, 84 },
				{ "I2A607", 84, 87 },
				{ "I2A608", 87, 90 },
				{ "I2A609", 90, 93 },
				{ "I2A610", 93, 96 },
				{ "I2A611", 96, 99 },
				{ "I2A612", 99, 102 },
				{ "I2A613", 102, 105 },
				{ "I2A329", 105, 108 },
				{ "I2A614", 108, 111 },
				{ "I2A615", 111, 114 },
				{ "I2A616", 114, 117 },
				{ "I2A574", 117, 120 },
				{ "I2A298", 120, 123 },
				{ "I2A617", 123, 126 },
				{ "I2A618", 126, 129 },
				{ "I2A619", 129, 132 },
				{ "I2A620", 132, 135 },
				{ "I2A621", 135, 138 },
				{ "I2A325", 138, 141 },
				{ "I2A574", 141, 144 },
				{ "I2A622", 144, 147 },
				{ "I2A194", 147, 150 },
				{ "I2A623", 150, 153 },
				{ "I2A624", 153, 156 },
				{ "I2A625", 156, 159 },
			},
			{
				{ "I2A626", 0, 3 },
				{ "I2A627", 3, 6 },
				{ "I2A628", 6, 9 },
				{ "I2A587", 9, 12 },
				{ "I2A331", 12, 15 },
				{ "I2A574", 15, 18 },
				{ "I2A389", 18, 21 },
				{ "I2A629", 21, 24 },
				{ "I2A630", 24, 27 },
				{ "I2A631", 27, 30 },
				{ "I2A632", 30, 33 },
				{ "I2A633", 33, 36 },
				{ "I2A365", 36, 39 },
				{ "I2A634", 39, 42 },
				{ "I2A635", 42, 45 },
				{ "I2A636", 45, 48 },
				{ "I2A637", 48, 51 },
				{ "I2A638", 51, 54 },
				{ "I2A639", 54, 57 },
				{ "I2A640", 57, 60 },
				{ "I2A641", 60, 63 },
				{ "I2A642", 63, 66 },
				{ "I2A643", 66, 69 },
				{ "I2A644", 69, 72 },
				{ "I2A645", 72, 75 },
				{ "I2A646", 75, 78 },
				{ "I2A647", 78, 81 },
				{ "I2A648", 81, 84 },
				{ "I2A649", 84, 87 },
				{ "I2A650", 87, 90 },
				{ "I2A651", 90, 93 },
				{ "I2A652", 93, 96 },
				{ "I2A653", 96, 99 },
				{ "I2A654", 99, 102 },
				{ "I2A655", 102, 105 },
				{ "I2A656", 105, 108 },
				{ "I2A657", 108, 111 },
				{ "I2A197", 111, 114 },
				{ "I2A658", 114, 117 },
				{ "I2A659", 117, 120 },
				{ "I2A660", 120, 123 },
				{ "I2A661", 123, 126 },
				{ "I2A662", 126, 129 },
				{ "I2A663", 129, 132 },
				{ "I2A405", 132, 135 },
				{ "I2A375", 135, 138 },
				{ "I2A589", 138, 141 },
				{ "I2A664", 141, 144 },
				{ "I2A665", 144, 147 },
				{ "I2A666", 147, 150 },
				{ "I2A667", 150, 153 },
				{ "I2A668", 153, 156 },
				{ "I2A139", 156, 159 },
			},
			{
				{ "I2A669", 0, 3 },
				{ "I2A670", 3, 6 },
				{ "I2A671", 6, 9 },
				{ "I2A239", 9, 12 },
				{ "I2A580", 12, 15 },
				{ "I2A535", 15, 18 },
				{ "I2A672", 18, 21 },
				{ "I2A673", 21, 24 },
				{ "I2A674", 24, 27 },
				{ "I2A675", 27, 30 },
				{ "I2A676", 30, 33 },
				{ "I2A677", 33, 36 },
				{ "I2A678", 36, 39 },
				{ "I2A679", 39, 42 },
				{ "I2A680", 42, 45 },
				{ "I2A681", 45, 48 },
				{ "I2A682", 48, 51 },
				{ "I2A683", 51, 54 },
				{ "I2A684", 54, 57 },
				{ "I2A685", 57, 60 },
				{ "I2A686", 60, 63 },
				{ "I2A687", 63, 66 },
				{ "I2A688", 66, 69 },
				{ "I2A689", 69, 72 },
				{ "I2A599", 72, 75 },
				{ "I2A690", 75, 78 },
				{ "I2A691", 78, 81 },
				{ "I2A691", 81, 84 },
				{ "I2A692", 84, 87 },
				{ "I2A693", 87, 90 },
				{ "I2A694", 90, 93 },
				{ "I2A695", 93, 96 },
				{ "I2A696", 96, 99 },
				{ "I2A697", 99, 102 },
				{ "I2A698", 102, 105 },
				{ "I2A699", 105, 108 },
				{ "I2A700", 108, 111 },
				{ "I2A701", 111, 114 },
				{ "I2A702", 114, 117 },
				{ "I2A703", 117, 120 },
				{ "I2A704", 120, 123 },
				{ "I2A705", 123, 126 },
				{ "I2A626", 126, 129 },
				{ "I2A706", 129, 132 },
				{ "I2A707", 132, 135 },
				{ "I2A611", 135, 138 },
				{ "I2A708", 138, 141 },
				{ "I2A709", 141, 144 },
				{ "I2A389", 144, 147 },
				{ "I2A328", 147, 150 },
				{ "I2A710", 150, 153 },
				{ "I2A711", 153, 156 },
				{ "I2A712", 156, 159 },
			},
			{
				{ "I2A713", 0, 3 },
				{ "I2A714", 3, 6 },
				{ "I2A715", 6, 9 },
				{ "I2A666", 9, 12 },
				{ "I2A238", 12, 15 },
				{ "I2A666", 15, 18 },
				{ "I2A673", 18, 21 },
				{ "I2A716", 21, 24 },
				{ "I2A717", 24, 27 },
				{ "I2A718", 27, 30 },
				{ "I2A719", 30, 33 },
				{ "I2A720", 33, 36 },
				{ "I2A721", 36, 39 },
				{ "I2A722", 39, 42 },
				{ "I2A723", 42, 45 },
				{ "I2A724", 45, 48 },
				{ "I2A600", 48, 51 },
				{ "I2A689", 51, 54 },
				{ "I2A725", 54, 57 },
				{ "I2A643", 57, 60 },
				{ "I2A726", 60, 63 },
				{ "I2A689", 63, 66 },
				{ "I2A689", 66, 69 },
				{ "I2A727", 69, 72 },
				{ "I2A728", 72, 75 },
				{ "I2A729", 75, 78 },
				{ "I2A730", 78, 81 },
				{ "I2A731", 81, 84 },
				{ "I2A732", 84, 87 },
				{ "I2A733", 87, 90 },
				{ "I2A734", 90, 93 },
				{ "I2A735", 93, 96 },
				{ "I2A736", 96, 99 },
				{ "I2A737", 99, 102 },
				{ "I2A738", 102, 105 },
				{ "I2A739", 105, 108 },
				{ "I2A740", 108, 111 },
				{ "I2A719", 111, 114 },
				{ "I2A741", 114, 117 },
				{ "I2A742", 117, 120 },
				{ "I2A743", 120, 123 },
				{ "I2A744", 123, 126 },
				{ "I2A745", 126, 129 },
				{ "I2A746", 129, 132 },
				{ "I2A747", 132, 135 },
				{ "I2A748", 135, 138 },
				{ "I2A709", 138, 141 },
				{ "I2A749", 141, 144 },
				{ "I2A750", 144, 147 },
				{ "I2A751", 147, 150 },
				{ "I2A298", 150, 153 },
				{ "I2A752", 153, 156 },
				{ "I2A753", 156, 159 },
			},
			{
				{ "I2A754", 0, 3 },
				{ "I2A755", 3, 6 },
				{ "I2A756", 6, 9 },
				{ "I2A757", 9, 12 },
				{ "I2A758", 12, 15 },
				{ "I2A759", 15, 18 },
				{ "I2A760", 18, 21 },
				{ "I2A761", 21, 24 },
				{ "I2A762", 24, 27 },
				{ "I2A763", 27, 30 },
				{ "I2A764", 30, 33 },
				{ "I2A765", 33, 36 },
				{ "I2A766", 36, 39 },
				{ "I2A767", 39, 42 },
				{ "I2A768", 42, 45 },
				{ "I2A769", 45, 48 },
				{ "I2A227", 48, 51 },
				{ "I2A770", 51, 54 },
				{ "I2A771", 54, 57 },
				{ "I2A772", 57, 60 },
				{ "I2A644", 60, 63 },
				{ "I2A773", 63, 66 },
				{ "I2A774", 66, 69 },
				{ "I2A775", 69, 72 },
				{ "I2A776", 72, 75 },
				{ "I2A777", 75, 78 },
				{ "I2A778", 78, 81 },
				{ "I2A779", 81, 84 },
				{ "I2A780", 84, 87 },
				{ "I2A781", 87, 90 },
				{ "I2A782", 90, 93 },
				{ "I2A783", 93, 96 },
				{ "I2A784", 96, 99 },
				{ "I2A785", 99, 102 },
				{ "I2A786", 102, 105 },
				{ "I2A787", 105, 108 },
				{ "I2A788", 108, 111 },
				{ "I2A534", 111, 114 },
				{ "I2A529", 114, 117 },
				{ "I2A789", 117, 120 },
				{ "I2A790", 120, 123 },
				{ "I2A791", 123, 126 },
				{ "I2A792", 126, 129 },
				{ "I2A793", 129, 132 },
				{ "I2A794", 132, 135 },
				{ "I2A707", 135, 138 },
				{ "I2A795", 138, 141 },
				{ "I2A796", 141, 144 },
				{ "I2A797", 144, 147 },
				{ "I2A798", 147, 150 },
				{ "I2A195", 150, 153 },
				{ "I2A374", 153, 156 },
				{ "I2A799", 156, 159 },
			},
			{
				{ "I2A800", 0, 3 },
				{ "I2A801", 3, 6 },
				{ "I2A487", 6, 9 },
				{ "I2A580", 9, 12 },
				{ "I2A798", 12, 15 },
				{ "I2A802", 15, 18 },
				{ "I2A803", 18, 21 },
				{ "I2A804", 21, 24 },
				{ "I2A805", 24, 27 },
				{ "I2A806", 27, 30 },
				{ "I2A807", 30, 33 },
				{ "I2A808", 33, 36 },
				{ "I2A809", 36, 39 },
				{ "I2A810", 39, 42 },
				{ "I2A811", 42, 45 },
				{ "I2A452", 45, 48 },
				{ "I2A812", 48, 51 },
				{ "I2A813", 51, 54 },
				{ "I2A284", 54, 57 },
				{ "I2A814", 57, 60 },
				{ "I2A815", 60, 63 },
				{ "I2A816", 63, 66 },
				{ "I2A817", 66, 69 },
				{ "I2A818", 69, 72 },
				{ "I2A819", 72, 75 },
				{ "I2A814", 75, 78 },
				{ "I2A820", 78, 81 },
				{ "I2A821", 81, 84 },
				{ "I2A821", 84, 87 },
				{ "I2A814", 87, 90 },
				{ "I2A822", 90, 93 },
				{ "I2A823", 93, 96 },
				{ "I2A824", 96, 99 },
				{ "I2A825", 99, 102 },
				{ "I2A826", 102, 105 },
				{ "I2A827", 105, 108 },
				{ "I2A828", 108, 111 },
				{ "I2A829", 111, 114 },
				{ "I2A830", 114, 117 },
				{ "I2A831", 117, 120 },
				{ "I2A832", 120, 123 },
				{ "I2A833", 123, 126 },
				{ "I2A384", 126, 129 },
				{ "I2A834", 129, 132 },
				{ "I2A835", 132, 135 },
				{ "I2A836", 135, 138 },
				{ "I2A837", 138, 141 },
				{ "I2A838", 141, 144 },
				{ "I2A839", 144, 147 },
				{ "I2A840", 147, 150 },
				{ "I2A666", 150, 153 },
				{ "I2A841", 153, 156 },
				{ "I2A842", 156, 159 },
			},
			{
				{ "I2A843", 0, 3 },
				{ "I2A844", 3, 6 },
				{ "I2A656", 6, 9 },
				{ "I2A845", 9, 12 },
				{ "I2A846", 12, 15 },
				{ "I2A847", 15, 18 },
				{ "I2A98", 18, 21 },
				{ "I2A439", 21, 24 },
				{ "I2A574", 24, 27 },
				{ "I2A848", 27, 30 },
				{ "I2A849", 30, 33 },
				{ "I2A850", 33, 36 },
				{ "I2A851", 36, 39 },
				{ "I2A852", 39, 42 },
				{ "I2A853", 42, 45 },
				{ "I2A854", 45, 48 },
				{ "I2A855", 48, 51 },
				{ "I2A856", 51, 54 },
				{ "I2A857", 54, 57 },
				{ "I2A858", 57, 60 },
				{ "I2A859", 60, 63 },
				{ "I2A860", 63, 66 },
				{ "I2A861", 66, 69 },
				{ "I2A856", 69, 72 },
				{ "I2A862", 72, 75 },
				{ "I2A823", 75, 78 },
				{ "I2A857", 78, 81 },
				{ "I2A856", 81, 84 },
				{ "I2A863", 84, 87 },
				{ "I2A864", 87, 90 },
				{ "I2A357", 90, 93 },
				{ "I2A865", 93, 96 },
				{ "I2A866", 96, 99 },
				{ "I2A867", 99, 102 },
				{ "I2A868", 102, 105 },
				{ "I2A869", 105, 108 },
				{ "I2A870", 108, 111 },
				{ "I2A871", 111, 114 },
				{ "I2A872", 114, 117 },
				{ "I2A873", 117, 120 },
				{ "I2A874", 120, 123 },
				{ "I2A875", 123, 126 },
				{ "I2A876", 126, 129 },
				{ "I2A877", 129, 132 },
				{ "I2A878", 132, 135 },
				{ "I2A879", 135, 138 },
				{ "I2A880", 138, 141 },
				{ "I2A881", 141, 144 },
				{ "I2A882", 144, 147 },
				{ "I2A883", 147, 150 },
				{ "I2A884", 150, 153 },
				{ "I2A885", 153, 156 },
				{ "I2A886", 156, 159 },
			},
			{
				{ "I2A887", 0, 3 },
				{ "I2A888", 3, 6 },
				{ "I2A889", 6, 9 },
				{ "I2A890", 9, 12 },
				{ "I2A891", 12, 15 },
				{ "I2A892", 15, 18 },
				{ "I2A751", 18, 21 },
				{ "I2A893", 21, 24 },
				{ "I2A488", 24, 27 },
				{ "I2A894", 27, 30 },
				{ "I2A895", 30, 33 },
				{ "I2A896", 33, 36 },
				{ "I2A897", 36, 39 },
				{ "I2A898", 39, 42 },
				{ "I2A899", 42, 45 },
				{ "I2A900", 45, 48 },
				{ "I2A901", 48, 51 },
				{ "I2A902", 51, 54 },
				{ "I2A59", 54, 57 },
				{ "I2A903", 57, 60 },
				{ "I2A904", 60, 63 },
				{ "I2A905", 63, 66 },
				{ "I2A906", 66, 69 },
				{ "I2A507", 69, 72 },
				{ "I2A907", 72, 75 },
				{ "I2A908", 75, 78 },
				{ "I2A901", 78, 81 },
				{ "I2A64", 81, 84 },
				{ "I2A909", 84, 87 },
				{ "I2A910", 87, 90 },
				{ "I2A911", 90, 93 },
				{ "I2A912", 93, 96 },
				{ "I2A913", 96, 99 },
				{ "I2A914", 99, 102 },
				{ "I2A915", 102, 105 },
				{ "I2A916", 105, 108 },
				{ "I2A917", 108, 111 },
				{ "I2A918", 111, 114 },
				{ "I2A919", 114, 117 },
				{ "I2A920", 117, 120 },
				{ "I2A921", 120, 123 },
				{ "I2A922", 123, 126 },
				{ "I2A923", 126, 129 },
				{ "I2A924", 129, 132 },
				{ "I2A925", 132, 135 },
				{ "I2A926", 135, 138 },
				{ "I2A927", 138, 141 },
				{ "I2A928", 141, 144 },
				{ "I2A929", 144, 147 },
				{ "I2A930", 147, 150 },
				{ "I2A931", 150, 153 },
				{ "I2A932", 153, 156 },
				{ "I2A488", 156, 159 },
			},
			{
				{ "I2A933", 0, 3 },
				{ "I2A934", 3, 6 },
				{ "I2A935", 6, 9 },
				{ "I2A936", 9, 12 },
				{ "I2A937", 12, 15 },
				{ "I2A938", 15, 18 },
				{ "I2A939", 18, 21 },
				{ "I2A243", 21, 24 },
				{ "I2A940", 24, 27 },
				{ "I2A941", 27, 30 },
				{ "I2A942", 30, 33 },
				{ "I2A943", 33, 36 },
				{ "I2A944", 36, 39 },
				{ "I2A945", 39, 42 },
				{ "I2A946", 42, 45 },
				{ "I2A947", 45, 48 },
				{ "I2A948", 48, 51 },
				{ "I2A949", 51, 54 },
				{ "I2A950", 54, 57 },
				{ "I2A951", 57, 60 },
				{ "I2A952", 60, 63 },
				{ "I2A953", 63, 66 },
				{ "I2A954", 66, 69 },
				{ "I2A955", 69, 72 },
				{ "I2A956", 72, 75 },
				{ "I2A957", 75, 78 },
				{ "I2A958", 78, 81 },
				{ "I2A959", 81, 84 },
				{ "I2A392", 84, 87 },
				{ "I2A960", 87, 90 },
				{ "I2A961", 90, 93 },
				{ "I2A962", 93, 96 },
				{ "I2A963", 96, 99 },
				{ "I2A964", 99, 102 },
				{ "I2A965", 102, 105 },
				{ "I2A966", 105, 108 },
				{ "I2A967", 108, 111 },
				{ "I2A968", 111, 114 },
				{ "I2A969", 114, 117 },
				{ "I2A970", 117, 120 },
				{ "I2A971", 120, 123 },
				{ "I2A972", 123, 126 },
				{ "I2A973", 126, 129 },
				{ "I2A974", 129, 132 },
				{ "I2A975", 132, 135 },
				{ "I2A976", 135, 138 },
				{ "I2A955", 138, 141 },
				{ "I2A955", 141, 144 },
				{ "I2A977", 144, 147 },
				{ "I2A978", 147, 150 },
				{ "I2A979", 150, 153 },
				{ "I2A980", 153, 156 },
				{ "I2A105", 156, 159 },
			},
			{
				{ "I2A981", 0, 3 },
				{ "I2A982", 3, 6 },
				{ "I2A983", 6, 9 },
				{ "I2A984", 9, 12 },
				{ "I2A985", 12, 15 },
				{ "I2A986", 15, 18 },
				{ "I2A987", 18, 21 },
				{ "I2A988", 21, 24 },
				{ "I2A989", 24, 27 },
				{ "I2A990", 27, 30 },
				{ "I2A991", 30, 33 },
				{ "I2A992", 33, 36 },
				{ "I2A993", 36, 39 },
				{ "I2A855", 39, 42 },
				{ "I2A994", 42, 45 },
				{ "I2A995", 45, 48 },
				{ "I2A960", 48, 51 },
				{ "I2A961", 51, 54 },
				{ "I2A996", 54, 57 },
				{ "I2A997", 57, 60 },
				{ "I2A998", 60, 63 },
				{ "I2A999", 63, 66 },
				{ "I2A1000", 66, 69 },
				{ "I2A1001", 69, 72 },
				{ "I2A822", 72, 75 },
				{ "I2A1002", 75, 78 },
				{ "I2A242", 78, 81 },
				{ "I2A1003", 81, 84 },
				{ "I2A1004", 84, 87 },
				{ "I2A1005", 87, 90 },
				{ "I2A1006", 90, 93 },
				{ "I2A1007", 93, 96 },
				{ "I2A1008", 96, 99 },
				{ "I2A1009", 99, 102 },
				{ "I2A186", 102, 105 },
				{ "I2A1010", 105, 108 },
				{ "I2A1011", 108, 111 },
				{ "I2A1012", 111, 114 },
				{ "I2A1013", 114, 117 },
				{ "I2A1014", 117, 120 },
				{ "I2A1015", 120, 123 },
				{ "I2A1016", 123, 126 },
				{ "I2A1017", 126, 129 },
				{ "I2A1018", 129, 132 },
				{ "I2A1019", 132, 135 },
				{ "I2A1020", 135, 138 },
				{ "I2A1021", 138, 141 },
				{ "I2A1022", 141, 144 },
				{ "I2A1023", 144, 147 },
				{ "I2A1024", 147, 150 },
				{ "I2A1025", 150, 153 },
				{ "I2A1026", 153, 156 },
				{ "I2A1027", 156, 159 },
			},
			{
				{ "I2A719", 0, 3 },
				{ "I2A1028", 3, 6 },
				{ "I2A1029", 6, 9 },
				{ "I2A1030", 9, 12 },
				{ "I2A1031", 12, 15 },
				{ "I2A395", 15, 18 },
				{ "I2A1032", 18, 21 },
				{ "I2A1033", 21, 24 },
				{ "I2A1034", 24, 27 },
				{ "I2A1035", 27, 30 },
				{ "I2A278", 30, 33 },
				{ "I2A1036", 33, 36 },
				{ "I2A1037", 36, 39 },
				{ "I2A1038", 39, 42 },
				{ "I2A143", 42, 45 },
				{ "I2A1039", 45, 48 },
				{ "I2A358", 48, 51 },
				{ "I2A454", 51, 54 },
				{ "I2A144", 54, 57 },
				{ "I2A184", 57, 60 },
				{ "I2A1036", 60, 63 },
				{ "I2A1040", 63, 66 },
				{ "I2A1041", 66, 69 },
				{ "I2A1042", 69, 72 },
				{ "I2A1043", 72, 75 },
				{ "I2A1044", 75, 78 },
				{ "I2A286", 78, 81 },
				{ "I2A1002", 81, 84 },
				{ "I2A1045", 84, 87 },
				{ "I2A1046", 87, 90 },
				{ "I2A184", 90, 93 },
				{ "I2A1047", 93, 96 },
				{ "I2A1048", 96, 99 },
				{ "I2A679", 99, 102 },
				{ "I2A1049", 102, 105 },
				{ "I2A1050", 105, 108 },
				{ "I2A1051", 108, 111 },
				{ "I2A1052", 111, 114 },
				{ "I2A1053", 114, 117 },
				{ "I2A1054", 117, 120 },
				{ "I2A1055", 120, 123 },
				{ "I2A1056", 123, 126 },
				{ "I2A1057", 126, 129 },
				{ "I2A415", 129, 132 },
				{ "I2A1058", 132, 135 },
				{ "I2A1059", 135, 138 },
				{ "I2A286", 138, 141 },
				{ "I2A959", 141, 144 },
				{ "I2A1060", 144, 147 },
				{ "I2A1061", 147, 150 },
				{ "I2A1062", 150, 153 },
				{ "I2A1063", 153, 156 },
				{ "I2A1063", 156, 159 },
			},
			{
				{ "I2A1064", 0, 3 },
				{ "I2A1065", 3, 6 },
				{ "I2A1066", 6, 9 },
				{ "I2A1067", 9, 12 },
				{ "I2A1068", 12, 15 },
				{ "I2A1069", 15, 18 },
				{ "I2A1070", 18, 21 },
				{ "I2A1071", 21, 24 },
				{ "I2A1072", 24, 27 },
				{ "I2A1073", 27, 30 },
				{ "I2A1074", 30, 33 },
				{ "I2A1075", 33, 36 },
				{ "I2A1076", 36, 39 },
				{ "I2A1077", 39, 42 },
				{ "I2A232", 42, 45 },
				{ "I2A1078", 45, 48 },
				{ "I2A1079", 48, 51 },
				{ "I2A1080", 51, 54 },
				{ "I2A1081", 54, 57 },
				{ "I2A1082", 57, 60 },
				{ "I2A1083", 60, 63 },
				{ "I2A1083", 63, 66 },
				{ "I2A1084", 66, 69 },
				{ "I2A1085", 69, 72 },
				{ "I2A1086", 72, 75 },
				{ "I2A1087", 75, 78 },
				{ "I2A1088", 78, 81 },
				{ "I2A1089", 81, 84 },
				{ "I2A46", 84, 87 },
				{ "I2A1090", 87, 90 },
				{ "I2A107", 90, 93 },
				{ "I2A1091", 93, 96 },
				{ "I2A106", 96, 99 },
				{ "I2A1092", 99, 102 },
				{ "I2A1093", 102, 105 },
				{ "I2A1094", 105, 108 },
				{ "I2A1095", 108, 111 },
				{ "I2A1096", 111, 114 },
				{ "I2A1097", 114, 117 },
				{ "I2A1098", 117, 120 },
				{ "I2A1099", 120, 123 },
				{ "I2A588", 123, 126 },
				{ "I2A1100", 126, 129 },
				{ "I2A1101", 129, 132 },
				{ "I2A232", 132, 135 },
				{ "I2A1102", 135, 138 },
				{ "I2A1103", 138, 141 },
				{ "I2A1104", 141, 144 },
				{ "I2A287", 144, 147 },
				{ "I2A144", 147, 150 },
				{ "I2A1105", 150, 153 },
				{ "I2A1106", 153, 156 },
				{ "I2A1107", 156, 159 },
			},
			{
				{ "I2A1108", 0, 3 },
				{ "I2A1109", 3, 6 },
				{ "I2A1110", 6, 9 },
				{ "I2A1111", 9, 12 },
				{ "I2A1112", 12, 15 },
				{ "I2A1113", 15, 18 },
				{ "I2A1114", 18, 21 },
				{ "I2A1115", 21, 24 },
				{ "I2A1116", 24, 27 },
				{ "I2A1117", 27, 30 },
				{ "I2A329", 30, 33 },
				{ "I2A1118", 33, 36 },
				{ "I2A1119", 36, 39 },
				{ "I2A948", 39, 42 },
				{ "I2A1120", 42, 45 },
				{ "I2A194", 45, 48 },
				{ "I2A1121", 48, 51 },
				{ "I2A327", 51, 54 },
				{ "I2A1122", 54, 57 },
				{ "I2A1123", 57, 60 },
				{ "I2A1124", 60, 63 },
				{ "I2A1075", 63, 66 },
				{ "I2A1125", 66, 69 },
				{ "I2A1126", 69, 72 },
				{ "I2A1127", 72, 75 },
				{ "I2A1128", 75, 78 },
				{ "I2A1129", 78, 81 },
				{ "I2A147", 81, 84 },
				{ "I2A1130", 84, 87 },
				{ "I2A1131", 87, 90 },
				{ "I2A417", 90, 93 },
				{ "I2A1132", 93, 96 },
				{ "I2A195", 96, 99 },
				{ "I2A1133", 99, 102 },
				{ "I2A1134", 102, 105 },
				{ "I2A1135", 105, 108 },
				{ "I2A1136", 108, 111 },
				{ "I2A1137", 111, 114 },
				{ "I2A1138", 114, 117 },
				{ "I2A1139", 117, 120 },
				{ "I2A1140", 120, 123 },
				{ "I2A189", 123, 126 },
				{ "I2A189", 126, 129 },
				{ "I2A99", 129, 132 },
				{ "I2A1141", 132, 135 },
				{ "I2A236", 135, 138 },
				{ "I2A144", 138, 141 },
				{ "I2A1102", 141, 144 },
				{ "I2A145", 144, 147 },
				{ "I2A1142", 147, 150 },
				{ "I2A286", 150, 153 },
				{ "I2A1143", 153, 156 },
				{ "I2A1144", 156, 159 },
			},
		}

		dashboard.section.buttons.val = {
			dashboard.button("n", "New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "Find file", ":Telescope find_files<CR>"),
			dashboard.button("w", "Find Word", ":Telescope live_grep <CR>"),
			dashboard.button("r", "Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "Quit", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
