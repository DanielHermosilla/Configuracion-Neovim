return {
	"rebelot/kanagawa.nvim", -- Repositorio del colorscheme
	lazy = false,
	priority = 1000, -- Cargar este plugin antes que el resto
	config = function()
		-- Carga el colorscheme automáticamente
		vim.cmd("colorscheme kanagawa-dragon") -- El colorscheme a utilizar
	end,
}
