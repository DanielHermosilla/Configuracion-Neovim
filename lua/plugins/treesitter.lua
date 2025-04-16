return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true, -- Instala cada vez que encuentra un lenguaje nuevo
				highlight = {
					enable = true,
					disable = {},
				},
				ensure_installed = { "markdown", "markdown_inline", "r", "rnoweb", "yaml", "csv" },
				indent = { enable = true },
				ignore_install = {},
				vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#F2EFE7", bold = true }),
				vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#9ACBD0", bold = true }),
				vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#48A6A7", bold = true }),
				vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#006A71", bold = true }),
			})
		end,
	},
}
-- Todo lo que tiene que ver con LaTex se encargará el plugin Vimtex --
