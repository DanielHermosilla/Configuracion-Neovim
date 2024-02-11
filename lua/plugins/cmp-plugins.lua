 return {
  "hrsh7th/nvim-cmp",				
  dependencies = {
    "hrsh7th/cmp-buffer",			-- Autocompletado de buffers
    "hrsh7th/cmp-path",				-- Autocompletado de paths
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",			-- Autocompletado para la línea de comandos 
    "hrsh7th/cmp-git",				-- Autocompletado para git
    "L3MON4D3/LuaSnip",				-- Snippets de Lua 
    "saadparwaiz1/cmp_luasnip",			-- Snippets de Lua 
    "windwp/nvim-autopairs",
  },
  event = "VeryLazy",
  main = "config.plugins.cmp",
  config = false,
}
