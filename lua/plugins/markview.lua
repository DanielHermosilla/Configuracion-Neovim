-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	lazy = false,
	opts = {
		latex = { enable = false },
		preview = { icon_provider = "devicons" },
		markdown = {
			enable = true,
			--[[
			headings = {
				heading_1 = {
					style = "label",
					hl = "MarkviewSubscript",
				},
				heading_2 = {
					style = "icon",
					icon = "~",
					hl = "MarkviewPalette2Fg",
				},
			},
			]]
		},
	},
	--[[
	config = function()
		local presets = require("markview.presets")

		require("markview").setup({
			markdown = {
				headings = presets.headings.slanted,
			},
		})
	end,
	]]
}
