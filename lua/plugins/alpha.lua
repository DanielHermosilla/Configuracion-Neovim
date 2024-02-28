return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		-- Configuración del menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > Archivo nuevo", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰱼  > Buscar archivo", ":Telescope find_files<CR>"),
			dashboard.button("r", "󰷊  > Recientes", ":Telescope oldfiles<CR>"),
			dashboard.button("c", "  > Configuraciones", ":cd /Users/daniel/.config/nvim | edit init.lua<CR>"),
			dashboard.button("q", "󰿅  > Salir", ":qa<CR>"),
		}

		-- Mandar la configuración a Alpha
		alpha.setup(dashboard.opts)

		-- Configuración de la parte de abajo
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local count = (math.floor(stats.startuptime * 100) / 100)
				dashboard.section.footer.val = {
					" ",
					" ",
					" ",
					"󱐌 " .. stats.count .. " plugins cargados en " .. count .. " ms",
					" ",
					"         Daniel Hermosilla",
				}
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
