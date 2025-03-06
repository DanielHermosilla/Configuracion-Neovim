return {
	"geg2102/nvim-python-repl",
	dependencies = "nvim-treesitter",
	ft = { "python" },
	config = function()
		local repl = require("nvim-python-repl")

		-- Set up the plugin
		repl.setup({
			execute_on_send = true, -- Automatically execute after sending?
			vsplit = false, -- False = horizontal split
		})

		-- Define keybindings
		vim.keymap.set("n", "<leader>rs", function()
			repl.send_statement_definition()
		end, { desc = "Send semantic unit to REPL" })
		vim.keymap.set("v", "<leader>ll", function()
			repl.send_visual_to_repl()
		end, { desc = "Send visual selection to REPL" })
		vim.keymap.set("n", "<leader>rb", function()
			repl.send_buffer_to_repl()
		end, { desc = "Send entire buffer to REPL" })
		vim.keymap.set("n", "<leader>re", function()
			repl.toggle_execute()
		end, { desc = "Toggle auto-execute after sending" })
		vim.keymap.set("n", "<leader>rt", function()
			repl.toggle_vertical()
		end, { desc = "Toggle REPL split orientation" })
		vim.keymap.set("n", "<leader>rf", function()
			repl.open_repl()
		end, { desc = "Open REPL in a split" })
	end,
}
