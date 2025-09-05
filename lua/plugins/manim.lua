return {
	{
		-- ruta local a tu plugin
		dir = vim.fn.expand("~/nvim-manim-plugin"),
		-- carga para archivos .py (o global si prefieres)
		ft = { "python" },
		-- opcional: solo al guardar .py
		-- event = "BufWritePost *.py",
		config = function()
			require("manim_plugin").setup({
				manim_executable = "manim",
				build_dir = "media/videos",
				default_quality = "-pqh",
			})
		end,
	},
}
