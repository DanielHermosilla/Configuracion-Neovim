return {
	"nvimtools/none-ls.nvim", -- Null-LS mantenido por la comunidad
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Formatter de Lua
				null_ls.builtins.formatting.prettier, -- Formatter de JavaScript
				null_ls.builtins.diagnostics.eslint_d, -- Linter de JavaScript
				null_ls.builtins.formatting.black, -- Formatter de Python
				null_ls.builtins.formatting.isort, -- Formatter de Python
			},
		})
	end,
	keys = {
		{ "<leader>gf", vim.lsp.buf.format },
	},
}
