--[[ return {
	"nvimtools/none-ls.nvim", -- Null-LS mantenido por la comunidad
	dependencies = {
      "nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Formatter de Lua
				null_ls.builtins.formatting.prettier, -- Formatter de JavaScript
				null_ls.builtins.formatting.black, -- Formatter de Python
				null_ls.builtins.formatting.isort, -- Formatter de Python
				null_ls.builtins.formatting.prettier, -- Formatter de varios lenguajes
				null_ls.builtins.formatting.sqlfluff, -- Formatter de SQL
				--require("null_ls.builtins.formatting.latexindent"),


			--	null_ls.builtins.formatting.latexindent,
			},
		})
	end,
	keys = {
		{ "<leader>gf", vim.lsp.buf.format },
	},
} --]]

return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				python = { "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				-- javascript = { { "prettierd", "prettier" } },
				latex = { "latexindent" },
			},
		},
		keys = {
			{
				"<leader>gf",
				function()
					require("conform").format({ lsp_fallback = "always" })
					vim.cmd.update()
				end,
				mode = { "n", "x" },
				desc = "Formatea y guarda",
			},
		},
	},
	{ -- Permite instalar los formatters con Mason
		"zapling/mason-conform.nvim",
		opts = {},
	},
}
