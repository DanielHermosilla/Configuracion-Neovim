return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cond = function()
		local ft = vim.bo.filetype
		return ft ~= "R" and ft ~= "Rmd"
	end,
	enabled = true,
	ft = { "python" },
	keys = {
		{ "<leader>rf", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal" },
	},
	config = function()
		require("toggleterm").setup({
			direction = "horizontal",
			close_on_exit = false,
			shade_terminals = true,
			start_in_insert = true,
			auto_scroll = true,
			persist_mode = false,
		})

		-- Keybind for sending current line or block in normal mode (IPython style)
		vim.keymap.set("n", "<leader>ll", function()
			require("toggleterm").send_lines_to_terminal("single_line", true, { args = { "-i" } })
		end, { desc = "Send line to terminal" })

		local trim_spaces = true
		vim.keymap.set("v", "<leader>ll", function()
			require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
		end)
	end,
}
--config = function()
--local toggleterm = require("toggleterm")
---- Function to disable toggleterm in R and Rmd files
--local function should_disable()
--local ft = vim.bo.filetype
--return ft == "r" or ft == "rmd"
--end
--
---- Setup ToggleTerm
--require("toggleterm").setup({
--size = 15, -- Open terminal at bottom with height of 15 rows
--open_mapping = [[<leader>rf]], -- Open terminal with <leader>rf
--hide_numbers = true,
--shade_terminals = true,
--shading_factor = 2,
--start_in_insert = true,
--persist_size = true,
--direction = "horizontal", -- Open terminal at the bottom
--close_on_exit = true,
--shell = vim.o.shell,
--autochdir = true, -- Change terminal directory to match Neovim
--on_open = function(term)
--if should_disable() then
--vim.cmd("ToggleTerm") -- Automatically close if .R or .Rmd
--print("ToggleTerm disabled for R files.")
--end
--end,
--})
--
---- Keybindings
--vim.keymap.set(
--"n",
--"<leader>rf",
--"<cmd>ToggleTerm direction=horizontal<CR>",
--{ desc = "Open terminal horizontally" }
--)
--vim.keymap.set("n", "<leader>rq", "<cmd>ToggleTermToggleAll<CR>", { desc = "Close terminal" })
--local trim_spaces = false
--
---- Send visual selection to terminal
--vim.keymap.set("v", "<leader>ll", function()
--toggleterm.send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
--end, { desc = "Send selection to terminal" })
--end,
--}
