return {
	{
		"williamboman/mason.nvim", -- Mason
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim", -- Configuraci�n de Mason
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
		"neovim/nvim-lspconfig", -- Permite la comunicaci�n entre Neovim y el servidor

		config = function()
			local lspconfig = require("lspconfig")

			-- Configuraciones de comunicaci�n --
			lspconfig.lua_ls.setup({}) -- Comunicaci�n con Lua
			lspconfig.tsserver.setup({}) -- Comunicaci�n con JavaScript
			lspconfig.pyright.setup({}) -- Comunicaci�n con Python
			lspconfig.ltex.setup({ -- Comunicaci�n con LaTeX
				flags = { debounce_text_changes = 300 },
				settings = {
					ltex = {
						-- language = "en"
						language = "es",
					},
				},
			})
			--
			-- configure texlab server
			lspconfig["texlab"].setup({
				latexFormatter = "latexindent",
			})

			-- Comunicaci�n con R
			lspconfig.r_language_server.setup({
				handlers = {
					["textDocument/publishDiagnostics"] = function() end,
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- Mostrar informaci�n del objeto
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Ventana para ver los errores

			-- UI --
			-- TODO: iconos, instalar Nerd Fonts correctamente
		end,
	},
}
