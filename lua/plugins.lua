--[[
  Configuraciones iniciales del instalador de plugins "Packer"
  ]]

local fn = vim.fn

-- Instala el paquete de instalador. En esa ruta se instalaran los plugins en la máquina.   
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Instalando Packer: Cerrar y abrir Neovim..")
	vim.cmd([[packadd packer.nvim]])
end

-- Corre los plugins cada vez que se guarda el archivo plugins.lua 
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Llama a packer, en caso de no funcionar, no retorna nada (Es como un try & except)
local packer = require("packer")

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("No se pudo cargar Packer")
    return 
end

-- Configuración del popup window de Packer 
packer.init {
    display = {
	open_fn = function()
	    return require("packer.util").float { border = "rounded" }
	end,
    },
}

--[[
  En este fragmento del archivo se instalaran todos los plugins
]] 

return packer.startup(function(use)
    -- Lista de plugins, leer https://github.com/wbthomason/packer.nvim?tab=readme-ov-file#specifying-plugins 
    -- en la sección "Specifying plugins" para entender los argumentos de mejor manera

    use "wbthomason/packer.nvim"	-- Permite que Packer se administre a sí mismo 
    use "nvim-lua/popup.nvim"		-- Permite crear ventanas emergentes e imagenes, ocupado por varios plugins
    use "nvim-lua/plenary.nvim"		-- Funciones de lua que son ocupados por varios plugins 
    use "rstacruz/vim-closer"		-- Cierra automáticamente los brackets
    require("plugins.colorscheme")(use) -- El colorscheme a utilizar 
    
   

  -- Llamado de la función de plugins 
    if PACKER_BOOTSTRAP then 
	require("packer").sync()
    end
end)


