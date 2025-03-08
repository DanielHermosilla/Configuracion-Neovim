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
					"ltex", -- LSP de LaTeX
					"pylsp", -- LSP de Python
					"r_language_server",
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
			lspconfig.pyright.setup({}) -- Comunicaci�n con Python
			lspconfig.clangd.setup({
				init_options = {
					clangdFileStatus = true,
				},
				cmd = { "clangd", "--compile-commands-dir=build" },
				cmd_args = { "--std=c++17" },
				root_dir = require("lspconfig.util").root_pattern(
					"Makefile",
					".clangd",
					"compile_commands.json",
					".git"
				),
			}) -- Comunicaci�n con C++
			lspconfig.ltex.setup({ -- Comunicaci�n con LaTeX
				flags = { debounce_text_changes = 300 },
				settings = {
					ltex = {
						-- language = "en"
						language = "es",
					},
				},
				filetypes = { "tex", "txt" },
			})
			--
			-- configure texlab server
			lspconfig["texlab"].setup({
				latexFormatter = "latexindent",
			})
			-- Comunicaci�n con R
			lspconfig.r_language_server.setup({
				--handlers = {
				--["textDocument/publishDiagnostics"] = function() end, -- Descomentar para no tener diagn�sticos de espaciado
				--},
				flags = { debounce_text_changes = 150 },
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- Mostrar informaci�n del objeto
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Ventana para ver los errores

			-- UI --
			-- TODO: iconos, instalar Nerd Fonts correctamente
		end,
	},
}
