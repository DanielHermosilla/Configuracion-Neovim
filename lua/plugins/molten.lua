return {
	"benlubas/molten-nvim",
	ft = { "quarto", "qmd", "ipynb" },
	keys = {
		{
			"<leader>rf",
			":MoltenInit<CR>",
			mode = "n",
			desc = "Initialize Molten",
			ft = { "quarto", "qmd", "ipynb" },
		},
		{
			"<leader>ll",
			":<C-u>MoltenEvaluateVisual<CR>gv",
			mode = "v",
			desc = "Evaluate Selection",
			ft = { "quarto", "qmd", "ipynb" },
		},
		{
			"<leader>lc",
			":MoltenReevaluateCell<CR>",
			mode = "n",
			desc = "Re-evaluate Cell",
			ft = { "quarto", "qmd", "ipynb" },
		},
	},
}
