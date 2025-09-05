return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		dependencies = {
			"OXY2DEV/markview.nvim",
		},
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
			})
		end,
	},
}
-- Todo lo que tiene que ver con LaTex se encargará el plugin Vimtex --
