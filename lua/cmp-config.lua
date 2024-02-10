-- importa el plugin de forma segura
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  print("No se pudo importar correctamente el plugin de Nvim-cmp")
  return
end

-- importa los plugins de luasnip de forma segura
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  print("No se pudo importar luasnip")
  return
end

-- plugins del estilo VsCode 
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

-- Función para poder utilizar el "supertab" 
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- Sugerencia previa
    ["<C-j>"] = cmp.mapping.select_next_item(), -- Sugerencia siguiente
    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scrollear a través del mensaje del snippet 
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scrollear a través del mensaje del snippet 
    ["<C-Space>"] = cmp.mapping.complete(), -- Mostrar las sugerencias del completado  
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },	-- Cierra la ventana de sugerencias
    ["<CR>"] = cmp.mapping.confirm({ select = true }) -- Tocar enter para confirmar,
  }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within the current buffer
    { name = "path" }, -- file system paths
  }),
})


