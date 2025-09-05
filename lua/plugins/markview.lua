-- For `plugins/markview.lua` users.
return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		priority = 49,
		enabled = false,
		opts = {
			latex = { enable = false },
			preview = { icon_provider = "internal" },
			setext_1 = {
				style = "simple",
			},
			experimental = { check_rtp_message = true },
		},
	},
}
