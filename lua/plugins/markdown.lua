return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
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
