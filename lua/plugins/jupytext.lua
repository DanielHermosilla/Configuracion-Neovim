return {
	"GCBallesteros/jupytext.nvim",
	config = true,
	opts = {
		custom_language_formatting = {
			python = {
				extension = "qmd",
				style = "quarto",
				force_ft = "quarto", -- you can set whatever filetype you want here
			},
		},
	},
}
