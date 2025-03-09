local colors = require("config.colors")

return {
	-- Markdown Headings
	markdownH1 = { fg = colors.primary["500"], bold = true },
	markdownH2 = { fg = colors.primary["400"], bold = true },
	markdownH3 = { fg = colors.primary["300"], bold = true },
	markdownH4 = { fg = colors.primary["300"], bold = true },
	markdownH5 = { fg = colors.primary["200"], bold = true },
	markdownH6 = { fg = colors.primary["200"], bold = true },

	-- Treesitter-based Markdown Highlights
	["@markup.heading.1.markdown"] = { link = "markdownH1" },
	["@markup.heading.2.markdown"] = { link = "markdownH2" },
	["@markup.heading.3.markdown"] = { link = "markdownH3" },
	["@markup.heading.4.markdown"] = { link = "markdownH4" },
	["@markup.heading.5.markdown"] = { link = "markdownH5" },
	["@markup.heading.6.markdown"] = { link = "markdownH6" },
}
