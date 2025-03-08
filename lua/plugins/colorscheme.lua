return {
	"notken12/base46-colors",
	lazy = false,
	priority = 1000,
	config = function()
		-- Carga el colorscheme automáticamente
		vim.cmd("colorscheme ayu_dark") -- El colorscheme a utilizar
	end,
}

-- Se ocupa un colorscheme personalizado, bajo el directorio de themes/. Lo que hará este colorscheme
-- será suplir los espacios vacios donde el highlighting personalizado no cumple.
