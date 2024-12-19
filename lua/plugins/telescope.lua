return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ -- Buscar archivos
				"<leader>f",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Telescope Find Files",
			},
			{ -- Buscar dentro de los buffers
				"<leader>b",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Telescope buffers",
			},
			{ -- Mostrar errores y warnings
				"<leader>w",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Telescope Diagnostics",
			},
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim", -- Permite ver errores con Telescope
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
		end,
	},
}
