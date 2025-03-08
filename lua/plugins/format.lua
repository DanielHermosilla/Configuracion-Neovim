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
				desc = "Format and save",
			},
		},
	},
	{ -- Permite instalar los formatters con Mason
		"zapling/mason-conform.nvim",
		opts = {},
	},
}
