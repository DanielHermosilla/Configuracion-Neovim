return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		event = "VeryLazy",

		opts = {
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end,

			-- Evita "indent" y LSP para plegado automático: menos ruido, no pliega comentarios.
			provider_selector = function(_, _, _)
				return { "treesitter" }
			end,
		},

		-- Toggle de folds bajo demanda en la ventana actual.
		keys = {
			{
				"F",
				function()
					local ufo = require("ufo")
					if vim.wo.foldenable then
						ufo.openAllFolds()
						vim.wo.foldenable = false
					else
						vim.wo.foldenable = true
						ufo.closeAllFolds()
					end
				end,
				mode = "n",
				desc = "Toggle Folds (enable on demand)",
			},
		},

		config = function(_, opts)
			-- Neovim fold settings (folds desactivados por defecto)
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = false

			-- :diffthis vuelve a activar folds; Gvdiffsplit crea una ventana nueva.
			local group = vim.api.nvim_create_augroup("manual_diff_folds", { clear = true })
			vim.api.nvim_create_autocmd({ "WinNew", "BufWinEnter" }, {
				group = group,
				callback = function()
					vim.schedule(function()
						for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
							if vim.api.nvim_win_is_valid(win) and vim.wo[win].diff then
								vim.wo[win].foldenable = false
							end
						end
					end)
				end,
			})

			-- (Opcional) Si alguna vez quieres usar LSP para plegado, puedes añadir capacidades:
			-- local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

			require("ufo").setup(opts)
		end,
	},
}
