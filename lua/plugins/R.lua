return {
	{
		"R-nvim/R.nvim",
		lazy = false,
		config = function()
			R_csv_app = "R --no-save"
			-- vim.g.R_external_term = "sh -c '/usr/bin/open -a Terminal'"
			local opts = {
				hook = {
					after_config = function()
						-- Esta función sirve para hacer los mappings dentro de un buffer .R
						vim.api.nvim_buf_set_keymap(0, "n", "<leader>ll", "<Plug>RSendFile", {
							noremap = true,
							silent = true,
							expr = false,
							unique = true,
							desc = "Mandar el archivo a la consola",
						}) -- Con <leader>ll se manda todo el archivo, como el LaTeX
						vim.api.nvim_buf_set_keymap(0, "v", "<leader>ll", "<Plug>RDSendSelection", {
							noremap = true,
							silent = true,
							expr = false,
							unique = true,
							desc = "Mandar la selección a la consola",
						}) -- Con <leader>ll Y en modo visual se manda la selección
						vim.api.nvim_buf_set_keymap(0, "n", "<leader>v", "<Plug>RViewDF", {
							noremap = true,
							silent = true,
							expr = false,
							unique = true,
							desc = "Ver el dataframe",
						}) -- Con <leader>v se puede visualizar el dataframe
						vim.api.nvim_buf_set_keymap(0, "n", "<leader>s", "<Plug>RSummary", {
							noremap = true,
							silent = true,
							expr = false,
							unique = true,
							desc = "Hacer un sumarry del dataframe",
						}) -- Con <leader>s se puede hacer un sumarry el dataframe
						vim.api.nvim_buf_set_keymap(0, "n", "<leader>c", "<Plug>RClearConsole", {
							noremap = true,
							silent = true,
							expr = false,
							unique = true,
							desc = "Limpiar la consola",
						}) -- Con <leader>c se puede limpiar la consola
						vim.api.nvim_buf_set_keymap(0, "n", "<leader>rf", "<Plug>RStart", {
							noremap = true,
							silent = true,
							expr = false,
							unique = true,
							desc = "Inicia la consola",
						}) -- Con <leader>rf se inicia la consola
						vim.api.nvim_buf_set_keymap(0, "n", "<leader>rc", "<Plug>RClose", {
							noremap = true,
							silent = true,
							expr = false,
							unique = true,
							desc = "Limpiar la consola",
						}) -- Con <leader>rc se puede cerrar la consola
						vim.api.nvim_buf_set_keymap(0, "n", "<leader>ob", "<Plug>ROBToggle", {
							noremap = true,
							silent = true,
							expr = false,
							desc = "Abre el object browser",
						}) -- Con <leader>bo se puede abrir el object browser
					end,
				},
				user_maps_only = true,
				rconsole_width = 0,
				-- is_darwin = true, -- Fuerza a R.nvim a no detectar macOS
				-- external_term = "~/.local/bin/iterm2",
				R_app = "radian", -- Asegura que use R en lugar de radian u otra variante
			}
			require("r").setup(opts)
		end,
	},
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto" },
		dev = false,
		opts = {
			lspFeatures = {
				languages = { "r", "python", "julia", "bash", "lua", "html", "dot", "javascript", "typescript", "ojs" },
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
			completion = {
				enabled = true,
			},
		},
		dependencies = {
			{
				"jmbuhr/otter.nvim",
				dev = false,
				dependencies = {
					{ "neovim/nvim-lspconfig" },
				},
				opts = {
					buffers = {
						set_filetype = true,
					},
					handle_leading_whitespace = true,
				},
			},
		},
	},
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		build = ":UpdateRemotePlugins",
		init = function()
			-- this is an example, not a default. Please see the readme for more configuration options
			vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Initialize Molten", silent = true })
			vim.g.molten_output_win_max_height = 12
		end,
		dependencies = {
			"benlubas/quarto-nvim",
		},
	},
}
