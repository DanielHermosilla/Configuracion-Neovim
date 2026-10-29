return {
	{
		"sindrets/diffview.nvim",

		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
			"DiffviewFileHistory",
		},

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			enhanced_diff_hl = true,

			view = {
				default = {
					layout = "diff2_horizontal",
					winbar_info = true,
				},
				file_history = {
					layout = "diff2_horizontal",
					winbar_info = true,
				},
				merge_tool = {
					layout = "diff3_horizontal",
					disable_diagnostics = true,
					winbar_info = true,
				},
			},

			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 35,
				},
			},

			default_args = {
				DiffviewOpen = { "--imply-local" },
			},
		},

		keys = {
			{
				"<leader>gd",
				"<cmd>DiffviewOpen<cr>",
				desc = "Git Diffview",
			},
			{
				"<leader>gh",
				"<cmd>DiffviewFileHistory %<cr>",
				desc = "Git File History",
			},
			{
				"<leader>gH",
				"<cmd>DiffviewFileHistory<cr>",
				desc = "Git Repository History",
			},
			{
				"<leader>gq",
				"<cmd>DiffviewClose<cr>",
				desc = "Close Diffview",
			},
		},
	},
}
