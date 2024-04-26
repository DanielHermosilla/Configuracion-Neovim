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
						vim.api.nvim_buf_set_keymap(
							0,
							"n",
							"<leader>ll",
							"<Plug>RSendFile",
							{ noremap = true, silent = true, expr = false, unique = true }
						) -- Con <leader>ll se manda todo el archivo, como el LaTeX
						vim.api.nvim_buf_set_keymap(
							0,
							"v",
							"<leader>ll",
							"<Plug>RDSendSelection",
							{ noremap = true, silent = true, expr = false, unique = true }
						) -- Con <leader>ll Y en modo visual se manda la selección
					end,
				},
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
