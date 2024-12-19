local wk = require("which-key")

wk.register({
	["<S-h>"] = { "Navegar entre buffers a la izquierda" },
	["<S-l>"] = { "Navegar entre buffers a la derecha" },
	["<leader>b"] = { name = "Buffers" },
	["<leader>ca"] = { "Warnings" },
	["<leader>d"] = { "Desactivar errores y warnings" },
	["<leader>dd"] = { "Activar errores y warnings" },
	["<leader>f"] = { "Buscar archivos dentro del directorio" },
	["<leader>gf"] = { "Format" },
	["<leader>rn"] = { "Cambiar nombre de algunas variables" },
	["<leader>rp"] = { "Cambiar nombre de todas las variables" },
}, { prefix = "" })
