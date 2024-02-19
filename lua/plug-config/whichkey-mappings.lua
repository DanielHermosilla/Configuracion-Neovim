local wk = require("which-key")

wk.register({
	["<leader>f"] = { "Buscar archivos dentro del directorio" },
	["<leader>b"] = { "Buffers" },
	["<leader>ca"] = { "Warnings" },
	["<leader>gf"] = { "Format" },
	["<leader>rp"] = { "Cambiar nombre de todas las variables" },
	["<leader>rn"] = { "Cambiar nombre de algunas variables " },
	["<S-l>"] = { "Navegar entre buffers" },
	["<S-h>"] = { "Navegar entre buffers" },
})
