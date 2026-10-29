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

			vim.g.vimtex_compiler_latexmk = {
				build_dir = "",
				callback = 1,
				continuous = 1,
				executable = "latexmk",
				options = {
					"-pdf",
					"-pdflatex=pdflatex",
					"-interaction=nonstopmode",
					"-synctex=1",
				},
			}
		end,
	},
	{
		"barreiroleo/ltex_extra.nvim",
		ft = { "tex", "plaintex", "bib", "markdown", "rmarkdown", "rmd", "quarto", "qmd" },
		config = function()
			require("ltex_extra").setup({
				load_langs = { "es" }, -- idiomas a cargar
				init_check = true, -- comprobar ltex al inicio
				path = ".ltex", -- carpeta para diccionarios del proyecto
				-- Puedes usar :LtexAddWord para añadir la palabra bajo el cursor
			})
		end,
	},
}
