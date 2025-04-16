return {
	{
		"geg2102/nvim-python-repl",
		dependencies = { "nvim-treesitter" },
		ft = { "python" },
		enabled = false,

		opts = {
			execute_on_send = true, -- Automatically execute after sending?
			vsplit = false, -- False = horizontal split
		},
		keys = {
			{
				"<leader>ll",
				function()
					require("nvim-python-repl").send_visual_to_repl()
				end,
				mode = "v",
				desc = "Send visual selection to REPL",
				ft = "python",
			},
			{
				"<leader>sf",
				function()
					require("nvim-python-repl").send_buffer_to_repl()
				end,
				mode = "n",
				desc = "Send file to REPL",
				ft = "python",
			},
			{
				"<leader>rf",
				function()
					require("nvim-python-repl").open_repl()
				end,
				mode = "n",
				desc = "Open REPL in a split",
				ft = "python",
			},
		},
		config = function(_, opts) -- In case the plugin doesn't support automatic load
			require("nvim-python-repl").setup(opts)
		end,
	},
}
