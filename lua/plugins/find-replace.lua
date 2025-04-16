return {
	"MagicDuck/grug-far.nvim",
	keys = {
		{ "<leader>sw", "<cmd>GrugFar<cr>", desc = "Search word" },
	},
	config = function()
		-- optional setup call to override plugin options
		-- alternatively you can set options with vim.g.grug_far = { ... }
		require("grug-far").setup({
			-- options, see Configuration section below
			-- there are no required options atm
			-- engine = 'ripgrep' is default, but 'astgrep' or 'astgrep-rules' can
			-- be specified
		})
	end,
}
