return function(use)
  -- autocompletion
  use("hrsh7th/nvim-cmp") -- Plugin del CMP 
  use("hrsh7th/cmp-buffer") -- Completa los bufferrs 
  use("hrsh7th/cmp-path") -- Completa los paths  
  use("hrsh7th/cmp-cmdline") -- Completa los snippets 

  -- snippets
  use("L3MON4D3/LuaSnip") -- Motor de los snippets
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets
end  
