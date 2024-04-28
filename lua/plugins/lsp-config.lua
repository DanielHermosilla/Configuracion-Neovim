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

			-- Configuraciones de comunicación --
			lspconfig.lua_ls.setup({}) -- Comunicación con Lua
			lspconfig.tsserver.setup({}) -- Comunicación con JavaScript
			lspconfig.pyright.setup({}) -- Comunicación con Python
			lspconfig.ltex.setup({ -- Comunicación con LaTeX
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

			-- Comunicación con R
			lspconfig.r_language_server.setup({
				handlers = {
					["textDocument/publishDiagnostics"] = function() end,
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- Mostrar información del objeto
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Ventana para ver los errores

			-- UI --
			-- TODO: iconos, instalar Nerd Fonts correctamente
		end,
	},
}
