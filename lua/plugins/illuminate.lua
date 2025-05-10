return {
	{ -- highlight occurences of current word
		"RRethy/vim-illuminate",
		enabled = true,
	},
	{
		"zbirenbaum/neodim",
		event = "LspAttach",
		config = function()
			require("neodim").setup()
		end,
	},
}
