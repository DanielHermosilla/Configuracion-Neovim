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
					"ltex", -- LSP de LaTeX
					"pylsp", -- LSP de Python
					"r_language_server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig", -- Permite la comunicaciín entre Neovim y el servidor
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local lspconfig = require("lspconfig")

			-- Configuraciones de comunicación --
			lspconfig.lua_ls.setup({}) -- Comunicación con Lua
			lspconfig.pyright.setup({}) -- Comunicación con Python
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
			}) -- Comunicación con C++
			lspconfig.ltex.setup({ -- Comunicación con LaTeX
				flags = { debounce_text_changes = 300 },
				settings = {
					ltex = {
						-- language = "en"
						language = "es",
						additionalRules = {
							enablePickyRules = true,
						},
					},
				},
				filetypes = { "tex", "txt" },
			})
			--
			-- configure texlab server
			lspconfig["texlab"].setup({
				latexFormatter = "latexindent",
			})
			-- Comunicación con R
			lspconfig.r_language_server.setup({
				--handlers = {
				--["textDocument/publishDiagnostics"] = function() end, -- Descomentar para no tener diagnósticos de espaciado
				--},
				flags = { debounce_text_changes = 150 },
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- Mostrar información del objeto
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Ventana para ver los errores

			vim.diagnostic.config({
				virtual_text = {
					spacing = 2,
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			-- UI --
			-- TODO: iconos, instalar Nerd Fonts correctamente
		end,
	},
}
