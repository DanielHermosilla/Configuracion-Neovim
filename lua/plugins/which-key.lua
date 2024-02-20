return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		registers = true,
		presets = {
			operators = true,
			motions = true, -- Movimientos de Vim
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
}
