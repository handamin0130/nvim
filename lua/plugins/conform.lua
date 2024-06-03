return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },

				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				sass = { { "prettierd", "prettier" } },
				scss = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },

				c = { "ast-grep" },
				cpp = { "ast-grep" },
				rust = { "rust-analyzer" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
