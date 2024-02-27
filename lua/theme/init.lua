local load_highlight = function(group)
	for hl, col in pairs(group) do
		vim.api.nvim_set_hl(0, hl, col)
	end
end

local theme = {
	require("theme.theme"),
	require("theme.syntax"),
	require("theme.lsp"),
	require("theme.alpha"),
	require("theme.git"),
	require("theme.treesitter"),
	require("theme.dev-icons"),
	require("theme.nvim-tree"),
	require("theme.telescope"),
	require("theme.mason"),
	require("theme.cmp"),
	require("theme.blankline"),
	require("theme.glance"),
	require("theme.hop"),
	require("theme.marks"),
	require("theme.mind"),
	require("theme.rainbow"),
	require("theme.journal"),
	require("theme.nui")
}

for _, hl in pairs(theme) do
	load_highlight(hl)
end
