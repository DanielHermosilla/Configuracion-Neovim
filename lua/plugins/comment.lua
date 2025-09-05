return {
	"numToStr/Comment.nvim",
	opts = {
		mappings = { basic = true, extra = false },
	},
	keys = {
		-- en modo Visual (<mode="x">) <leader>c llama al Plug
		{
			"<leader>c",
			"<Plug>(comment_toggle_linewise_visual)",
			mode = "x",
			desc = "Toggle comment (linewise)",
		},
	},
}
