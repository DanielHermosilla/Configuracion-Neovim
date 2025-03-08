return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you use the mini.nvim suite
		ft = { "markdown", "rmd", "quarto", "quatro" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			file_types = { "markdown", "rmd", "quarto", "quatro" },
			latex = {
				enabled = false,
			},
			completions = {
				lsp = { enabled = true },
			},
			heading = {
				sign = true,
				position = "right",
				icons = {},
			},
			render_modes = true, --- Render in all modes
		},
	},
}
