return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	ft = { "markdown", "rmd", "Rmarkdown", "qmd", "quarto" }, -- filetypes to enable the plugin for
	opts = {
		render_modes = true,
		enabled = true,
		code = {
			highlight = "MarkdownCodeBlock",
			enabled = true,
			style = "normal",
			border = "thick",
		},
		section = {
			symbols = false,
		},
		heading = {
			sign = false,
			backgrounds = {
				"markdownH1",
				"markdownH2",
				"markdownH3",
			},
		},
	},
	config = function(_, opts)
		-- Code block background, keep Tree-sitter colors
		vim.api.nvim_set_hl(0, "MarkdownCodeBlock", {
			bg = "#161B22", -- GitHub dark code block bg
			fg = "NONE", -- Preserve syntax highlighting (Tree-sitter)
			italic = false,
		})

		-- Tree-sitter capture for code blocks (fallback link)
		vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { link = "MarkdownCodeBlock" })

		-- Headings (Tree-sitter aware)
		vim.api.nvim_set_hl(0, "@markup.heading.markdown", {
			fg = "#79c0ff", -- GitHub header blue
			bold = true,
		})

		-- Optional fallback for non-treesitter markdown highlighting
		vim.api.nvim_set_hl(0, "markdownH1", { fg = "#79c0ff", bold = true })
		vim.api.nvim_set_hl(0, "markdownH2", { fg = "#58a6ff", bold = true })
		vim.api.nvim_set_hl(0, "markdownH3", { fg = "#388bfd", bold = true })
		-- For render-markdown.nvim, some versions use this group:
		vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { link = "MarkdownHeader" })
		vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { link = "MarkdownHeader" })
		vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { link = "MarkdownHeader" })
		vim.api.nvim_set_hl(0, "MarkdownHeadingBlock", { bg = "NONE", fg = "NONE" })

		require("render-markdown").setup(opts)
	end,
}
