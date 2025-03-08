return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		notify = false,
		registers = true,
		presets = {
			windows = true,
			nav = true,
			z = false,
			g = false,
		},
		spec = {
			{ "<S-h>", desc = "Switch to the left buffer" },
			{ "<S-l>", desc = "Switch to the right buffer" },
			{ "<leader>b", desc = "Buffers" },
			{ "<leader>ca", desc = "Warnings" },
			{ "<leader>f", desc = "Search files" },
			{ "<leader>gf", desc = "Format" },
			{ "<leader>rn", desc = "Change the name of SOME variables" },
			{ "<leader>rp", desc = "Change the name of ALL variables" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts) -- Initializes `which-key` with Lazy.nvim's `opts`
		wk.add(opts.spec) -- Registers the key mappings with `wk.add()`
	end,
}
