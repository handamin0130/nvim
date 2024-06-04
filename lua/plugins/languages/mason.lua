return {
    {
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					check_outdated_packages_on_open = true,
					border = "none",
					width = 0.8,
					height = 0.9,
					icons = {
					  -- ✓ ➜ ✗ ◍
					  package_installed = "◍",
					  package_pending = "➜",
					  package_uninstalled = "◍",
					},
				  },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- rust
					"rust_analyzer",

					-- docs
				},
			})
		end,
	},
}