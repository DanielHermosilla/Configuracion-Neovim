return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      
      keys = { 
	  { -- Buscar archivos 
	    "<leader>f",
	    function()
	      require('telescope.builtin').find_files()
	    end,
	    desc = "Telescope Find Files",
	  },
	  { -- Buscar dentro de los buffers 
	    "<leader>b",
	    function()
	      require("telescope.builtin").buffers()
	    end,
	    desc = "Telescope buffers"
	  }
	},
      }
