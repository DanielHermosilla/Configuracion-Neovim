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
				timeout_ms = 20000, -- 20 seconds
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
				-- latex = { "latexindent" },
				--r = { "r" },
				r = { "my_styler" },
				tex = { "latexindent" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			formatters = {
				my_styler = {
					command = "R",
					-- A list of strings, or a function that returns a list of strings
					-- Return a single string instead of a list to run the command in a shell
					args = {
						"-s",
						"-e",
						"styler::style_file(commandArgs(TRUE)[1], indent_by = 4)",
						"--args",
						"$FILENAME",
					},
					--	args = { "-e", "styler::style_file('$FILENAME')" },
					stdin = false,
					async = true,
				},
			},
			latexindent = {
				prepend_args = {
					"--logfile=/tmp/indent.log", -- Don't generate indent.log in project
				},
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
