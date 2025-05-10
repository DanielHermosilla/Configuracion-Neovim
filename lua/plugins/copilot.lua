return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({})
	end,
	opts = {
		panel = {
			auto_regresh = true,
		},
		suggestion = {
			auto_trigger = true,
		},
	},
}
