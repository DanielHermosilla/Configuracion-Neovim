return {
	"benlubas/molten-nvim",
	version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
	ft = { "quarto", "qmd", "ipynb", "md" },
	enabled = false,
	lazy = false,
	keys = {
		{
			"<leader>rf",
			":MoltenInit<CR>",
			mode = "n",
			desc = "Initialize Molten",
			ft = { "quarto", "qmd", "ipynb", "md" },
		},
		{
			"<leader>ll",
			":<C-u>MoltenEvaluateVisual<CR>gv",
			mode = "v",
			desc = "Evaluate Selection",
			ft = { "quarto", "qmd", "ipynb", "md" },
		},
		{
			"<leader>lc",
			":MoltenReevaluateCell<CR>",
			mode = "n",
			desc = "Re-evaluate Cell",
			ft = { "quarto", "qmd", "ipynb", "md" },
		},
		{
			"<localleader>E",
			":MoltenEvaluateOperator<CR>",
			mode = "n",
			desc = "Evaluate operator",
			ft = { "quarto, qmd, ipynb, markdown" },
		},
		{
			"<localleader>EO",
			":MoltenEnterOutput<CR>",
			mode = "n",
			desc = "Open output window",
			ft = { "quarto, qmd, ipynb, markdown" },
		},
	},
	init = function()
		-- these are examples, not defaults. Please see the readme
		-- vim.g.molten_image_provider = "wezterm"
		vim.g.molten_output_win_max_height = 40
		-- I find auto open annoying, keep in mind setting this option will require setting
		-- vim.g.molten_auto_open_output = true

		-- this guide will be using image.nvim
		-- Don't forget to setup and install the plugin if you want to view image outputs

		-- optional, I like wrapping. works for virt text and the output window
		-- vim.g.molten_wrap_output = true

		-- Output as virtual text. Allows outputs to always be shown, works with images, but can
		-- be buggy with longer images
		-- vim.g.molten_virt_text_output = true

		-- this will make it so the output shows up below the \`\`\` cell delimiter
		vim.g.molten_virt_lines_off_by_1 = true
		-- I find auto open annoying, keep in mind setting this option will require setting
		-- Output as virtual text. Allows outputs to always be shown, works with images, but can
		-- be buggy with longer images
		vim.g.molten_virt_text_output = false
	end,
}
