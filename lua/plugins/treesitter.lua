return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true, -- Instala cada vez que encuentra un lenguaje nuevo
				highlight = {
					enable = true,
					disable = { "latex", "markdown" },
				},
				indent = { enable = true },
				ignore_install = { "latex" },
			})
		end,
	},
}
-- Todo lo que tiene que ver con LaTex se encargará el plugin Vimtex --
