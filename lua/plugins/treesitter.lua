return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#ff0000" })
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
