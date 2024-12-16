local wk = require("which-key")

wk.register({
	{
		{ "<S-h>", desc = "Navegar entre buffers" },
		{ "<S-l>", desc = "Navegar entre buffers" },
		{ "<leader>b", desc = "Buffers" },
		{ "<leader>ca", desc = "Warnings" },
		{ "<leader>d", desc = "Desactivar errores y warnings" },
		{ "<leader>dd", desc = "Activar errores y warnings" },
		{ "<leader>f", desc = "Buscar archivos dentro del directorio" },
		{ "<leader>gf", desc = "Format" },
		{ "<leader>rn", desc = "Cambiar nombre de algunas variables " },
		{ "<leader>rp", desc = "Cambiar nombre de todas las variables" },
	},
})
