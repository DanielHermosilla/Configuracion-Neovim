return {
  {
    "williamboman/mason.nvim",							-- Mason
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",					-- Configuración de Mason 
    config = function()
      require("mason-lspconfig").setup({
	ensure_installed = { 							-- Hacemos que se tengan los LSP
	  "lua_ls",								-- LSP de Lua
	  "tsserver"								-- LSP de JavaScript
	}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",							-- Permite la comunicación entre Neovim y el servidor 

    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})		 				-- Comunicación con Lua
      lspconfig.tsserver.setup({})						-- Comunicación con JavaScript
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})				-- Mostrar información del objeto
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})	-- Ventana para ver los errores
    end
  }
}
