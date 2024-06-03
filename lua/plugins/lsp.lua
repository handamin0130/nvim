local map_key = require("utils.key_mapper").map_key

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- lua

					"tsserver",
					"html", -- js, ts

					"cssls", --css
					"somesass_ls", --sass
					"tailwindcss", --tailwindcss

					"clangd", -- c, c++
					"rust_analyzer", -- rust

					"wgsl_analyzer", -- wgsl

					"markdown_oxide",
					"mdx_analyzer",
					-- md, mdx

					"taplo", --toml
					"yamlls", --yaml
					"jsonls", -- json
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			lspconfig.lua_ls.setup({})

			lspconfig.tsserver.setup({})
			lspconfig.html.setup({})

			lspconfig.clangd.setup({})
			lspconfig.rust_analyzer.setup({
				root_dir = util.root_pattern("Cargo.toml"),
				settings = {
					["rust-analyzer"] = {
						-- cargo = {
						-- 	allFeatures = true,
						-- },
					},
				},
			})

			lspconfig.wgsl_analyzer.setup({})

			lspconfig.markdown_oxide.setup({})
			lspconfig.mdx_analyzer.setup({})

			lspconfig.taplo.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.jsonls.setup({})

			map_key("K", vim.lsp.buf.hover)
			map_key("gd", vim.lsp.buf.definition)
			map_key("<leader>cc", vim.diagnostic.open_float)
			map_key("<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
