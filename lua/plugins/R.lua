return {
	{
		"R-nvim/R.nvim",
		lazy = false,
		config = function()
			R_csv_app = "terminal:vd"
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
					end,
				},
				user_maps_only = true,
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
				default_method = "slime",
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
}
