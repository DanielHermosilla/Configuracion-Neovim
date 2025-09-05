return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
		},
		ft = { "quarto", "qmd", "ipynb" },
		enabled = false,
		dev = false,
		opts = {
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
			completion = {
				enabled = true,
			},
		},
		keys = {
			{
				"<leader>lc",
				function()
					require("quarto.runner").run_cell()
				end,
				mode = "n",
				desc = "Run cell",
				silent = true,
				ft = { "quarto", "qmd", "ipynb" },
			},
			{
				"<leader>ll",
				function()
					require("quarto.runner").run_range()
				end,
				mode = "v",
				desc = "Run visual range",
				silent = true,
				ft = { "quarto", "qmd", "ipynb" },
			},
			{
				"<leader>sf",
				function()
					require("quarto.runner").run_all(true)
				end,
				mode = "n",
				desc = "Run all cells",
				silent = true,
				ft = { "quarto", "qmd", "ipynb" },
			},
		},
	},
	{ --- Otter is used for having customized LSP and CMP for code chunks!
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
}
