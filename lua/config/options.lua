--[[
   En este archivo van a ir todos los fragmentos de c√≥digo referentes a las 
   configuraciones iniciales para Vim. Vale decir, todo lo b√°sico que hace referencia 
   a las opciones de usuario.

   La descripci√≥n de cada opci√≥n se puede encontrar en la 
   l√≠nea de comandos de Vim con ":help options".
]]

vim.opt.backup = false 					-- Crea un archivo backup (default = FALSE)
vim.opt.clipboard = "unnamedplus"			-- Permite que Neovim pueda acceder al clipboard del sistema 
vim.opt.cmdheight = 1					-- La altura del command line de Vim
vim.opt.completeopt = { "menuone", "noselect" }		-- Configuración para el cmp
vim.opt.fileencoding = "utf-8"				-- El tipado de mis archivos 
vim.opt.hlsearch = false				-- Destaca todas las letras al hacer busqueda
vim.opt.incsearch = true				-- Destaca letra por letra al hacer b√∫squeda
vim.opt.ignorecase = true 				-- Ignora las may√∫sculas al hacer b√∫squedas 
vim.opt.mouse = "a"					-- Permite que el mouse se pueda ocupar en Neovim
vim.opt.smartindent = true				-- Hace que las indentaciones sean inteligentes
vim.opt.splitbelow = true				-- Cada split horizontal va por abajo de la ventana de trabajo 
vim.opt.splitright = true				-- Cada split vertical va a la derecha de la ventana de trabajo 
vim.opt.undofile = true					-- Permite el undo persistente 
vim.opt.shiftwidth = 4					-- Inserta cuatro espacios por cada tab 
vim.opt.tabstop = 4  					-- Establece el tamaño de tabulación a 4 espacios
vim.opt.cursorline = false				-- Destaca la linea que se est√° editando
vim.opt.number = true					-- Activa las lineas enumeradas 
vim.opt.relativenumber = true				-- Activa las lineas relativas
vim.opt.scrolloff = 4					-- Cantidad de lineas mínimas de espacio
vim.opt.termguicolors = true				-- Ocupa los colores del terminal
vim.g.mapleader = " "					-- Declara a la tecla lider

