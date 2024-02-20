return {
	{
		"williamboman/mason.nvim", -- Mason
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim", -- Configuración de Mason
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { -- Hacemos que se tengan los LSP
					"lua_ls", -- LSP de Lua
					"tsserver", -- LSP de JavaScript
					"ltex", -- LSP de LaTeX
					"pylsp", -- LSP de Python

				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig", -- Permite la comunicación entre Neovim y el servidor

		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})                                -- Comunicación con Lua
			lspconfig.tsserver.setup({})                              -- Comunicación con JavaScript
			lspconfig.ltex.setup({})                                  -- Comunicación con LaTeX
			lspconfig.pyright.setup({})                                 -- Comunicación con Python
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})           -- Mostrar información del objeto
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Ventana para ver los errores
			vim.keymap.set("n", "<leader>d", vim.lsp.buf.clear_references, {}) -- Saca todos los errores
		end,
	},
}
