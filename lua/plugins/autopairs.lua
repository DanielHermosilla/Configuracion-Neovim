return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true,
	},
	config = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.setup({
			check_ts = true,
		})
		npairs.add_rules({
			Rule("$", "$", "tex"), -- cuando abres $, cierra con $
			Rule("\\[", "\\]", "tex"), -- opcional: \[ ... \]
		})
	end,
}
