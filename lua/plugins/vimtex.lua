return {
	{
		"lervag/vimtex", -- Plugin VimTeX
		ft = { "tex" }, -- Carga solo para archivos .tex
		lazy = false, -- Recomendación del autor
		config = function()
			-- Configurar VimTeX para usar LuaLaTeX
			vim.g.vimtex_compiler_latexmk = {
				build_dir = "",
				callback = 1,
				continuous = 1,
				executable = "latexmk",
				options = {
					"-pdf",
					--"-pdflatex=lualatex -interaction=nonstopmode -synctex=1", -- Descomentar en caso de querer usar LuaLaTeX
				},
			}
		end,
	},
}
