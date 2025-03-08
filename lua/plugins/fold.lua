return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		event = "VeryLazy", -- Load lazily when needed

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
			provider_selector = function(_, _, _)
				return { "lsp", "indent" } -- Use LSP for folding
			end,
		},

		keys = {
			{
				"F",
				function()
					local winid = require("ufo").peekFoldedLinesUnderCursor()
					if winid then
						require("ufo").openAllFolds()
					else
						require("ufo").closeAllFolds()
					end
				end,
				mode = "n",
				desc = "Toggle Folds",
			},
		},

		config = function(_, opts)
			-- Neovim fold settings
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			-- Extend LSP capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			-- Apply capabilities to all active LSP servers
			for _, ls in ipairs(vim.lsp.get_active_clients()) do
				require("lspconfig")[ls.name].setup({
					capabilities = capabilities,
				})
			end

			-- Setup UFO with `opts`
			require("ufo").setup(opts)
		end,
	},
}
