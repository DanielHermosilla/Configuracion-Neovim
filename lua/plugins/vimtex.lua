return {
	{
		"lervag/vimtex", -- Plugin VimTeX
		ft = { "tex" }, -- Carga solo para archivos .tex
		lazy = false, -- Recomendación del autor
		config = function()
			-- Solo abre la lista quickfix si hay errores (no por warnings)
			vim.g.vimtex_quickfix_mode = 0

			-- Folding de secciones
			vim.g.vimtex_fold_enabled = 1
			vim.g.vimtex_fold_manual = 0

			-- Configurar VimTeX para usar LuaLaTeX
			vim.g.vimtex_compiler_latexmk = {
				build_dir = "build", -- Todo compilar en el directorio build.
				callback = 1,
				continuous = 1,
				executable = "latexmk",
				options = {
					"-pdf",
					"-interaction=nonstopmode",
					--"-pdflatex=lualatex -interaction=nonstopmode -synctex=1", -- Descomentar en caso de querer usar LuaLaTeX
				},
			}
		end,
	},
}
