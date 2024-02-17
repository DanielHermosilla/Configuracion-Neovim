return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true, -- Instala cada vez que encuentra un lenguaje nuevo
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
