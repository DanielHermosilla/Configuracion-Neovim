local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Declaración de variable
local keymap = vim.keymap.set

-- Poner el espacio como tecla líder
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Navegar al hacer splits 
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navegar por buffers 
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Cambia el nombre de todas las variables 
keymap('n', '<leader>rp', [[:%s/\<<C-r><C-w>\>/]], opts)

-- Cambia el nombre de variable una por una 
keymap('n', '<leader>rn', "cgn", opts)

-- Abre el filetree
keymap("n", "<leader>e", ":Lexplore<CR>", opts)

-- Insert --
-- tocar jk para ir a modo normal
keymap("i", "jk", "<esc>", opts)
keymap("i", "kj", "<esc>", opts)

-- Visual --
-- poder tabear en modo visual 
keymap("v", "<tab>", ">gv", opts)
keymap("v", "<s-tab>", "<gv", opts)

-- Mueve el texto hacia arriba o abajo (Alt-J/K)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Arreglar comportamiento del yank-paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Mover texto hacia arriba o abajo (Alt-J/K)
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

