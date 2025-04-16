return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		window = {
			mappings = {
				["P"] = {
					"toggle_preview",
					config = {
						use_float = false,
						use_image_nvim = true,
						-- title = 'Neo-tree Preview',
					},
				},
			},
		},
	},
}
