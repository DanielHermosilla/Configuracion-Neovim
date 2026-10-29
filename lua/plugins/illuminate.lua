return {
	{ -- highlight occurences of current word
		"RRethy/vim-illuminate",
		enabled = true,
		config = function()
			require("illuminate").configure({
				should_enable = function(bufnr)
					for _, win in ipairs(vim.fn.win_findbuf(bufnr)) do
						if vim.api.nvim_win_is_valid(win) and vim.wo[win].diff then
							return false
						end
					end
					return true
				end,
			})
		end,
	},
	{
		"zbirenbaum/neodim",
		event = "LspAttach",
		config = function()
			require("neodim").setup()
		end,
	},
}
