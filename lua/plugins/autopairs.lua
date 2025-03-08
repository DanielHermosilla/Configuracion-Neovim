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

		npairs.setup({})

		npairs.add_rules({
			Rule("$", "$", { "tex", "latex", "md", "markdown", "qmd", "rmd", "quarto" })
				:with_pair(cond.not_after_regex("%%")) -- Don't pair if next char is %
				:with_pair(cond.not_before_regex("xxx", 3)) -- Don't pair if previous char is xxx
				:with_move(cond.none()) -- Don't move right when repeating $
				:with_del(cond.not_after_regex("xx")) -- Don't delete if next char is xx
				:with_cr(cond.none()), -- Disable newline when pressing <CR>
		})
	end,
}
