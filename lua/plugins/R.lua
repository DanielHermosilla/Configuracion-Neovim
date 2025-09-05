return {
	{
		"R-nvim/R.nvim",
		-- branch = "wezkitty",
		ft = { "R", "Rscript", "rmd", "qmd", "quarto" }, -- Load only for R-related filetypes
		lazy = false,

		keys = {
			{
				"<leader>lf",
				"<Plug>RSendFile",
				mode = "n",
				desc = "Mandar el archivo a la consola",
				silent = true,
				ft = { "R", "Rscript", "rmd", "qmd", "quarto" },
			},
			{
				"<leader>ll",
				"<Plug>RDSendSelection",
				mode = "v",
				desc = "Mandar la selección a la consola",
				silent = true,
				ft = { "R", "Rscript", "rmd", "qmd", "quarto" },
			},
			{
				"<leader>v",
				"<Plug>RViewDF",
				mode = "n",
				desc = "Ver el dataframe",
				silent = true,
				ft = { "R", "Rscript", "rmd", "qmd", "quarto" },
			},
			{
				"<leader>s",
				"<Plug>RSummary",
				mode = "n",
				desc = "Hacer un summary del dataframe",
				silent = true,
				ft = { "R", "Rscript", "rmd", "qmd", "quarto" },
			},
			{
				"<leader>c",
				"<Plug>RClearConsole",
				mode = "n",
				desc = "Limpiar la consola",
				silent = true,
				ft = { "R", "Rscript", "rmd", "qmd", "quarto" },
			},
			{
				"<leader>rf",
				"<Plug>RStart",
				mode = "n",
				desc = "Inicia la consola",
				silent = true,
				ft = { "R", "Rscript", "rmd", "qmd", "quarto" },
			},
			{
				"<leader>rc",
				"<Plug>RClose",
				mode = "n",
				desc = "Cerrar la consola",
				silent = true,
				ft = { "R", "Rscript", "rmd", "qmd", "quarto" },
			},
			{
				"<leader>ob",
				"<Plug>ROBToggle",
				mode = "n",
				desc = "Abre el object browser",
				silent = true,
				ft = { "R", "Rscript", "rmd", "qmd", "quarto" },
			},
			{
				"<leader>lc",
				"<Plug>RSendChunk",
				mode = "n",
				desc = "Manda la celda de código",
				silent = true,
				ft = { "R", "Rscript", "rmd", "qmd", "quarto" },
			},
		},

		opts = {
			--[[
			hook = {
				after_config = function()
					-- Additional setup logic if needed
				end,
			},
			]]
			user_maps_only = true,
			rconsole_width = 0,
			Rout_more_colors = true,
			editing_mode = "vi",
			pipe_version = "magrittr",
			R_app = "radian", -- Ensure R.nvim uses radian as the R console
			bracketed_paste = true,
			auto_quit = true,
			-- external_term = "wezterm",
			-- nvimpager = true,
			-- auto_quit = true,
			-- nvimpager = true,
			-- open_example = true,
			--	hl_term = true,
			--	parenblock = true,
		},
	},
}
