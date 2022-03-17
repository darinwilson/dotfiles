local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap , as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Saving buffers
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<esc>:w<CR>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>w", ":bd<CR>", opts)
keymap("n", "<leader>W", ":bufdo bd<CR>", opts)

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- copy to clipboard
keymap("v", "<leader>pc", ":%w !pbcopy", opts)

-- reset tslime variables
keymap("n", "rst", ":unlet g:tslime<CR>", opts)

-- testing
keymap("n", "<leader>f", ":TestFile<CR>", opts)
keymap("n", "<leader>s", ":TestNearest<CR>", opts)
keymap("n", "<leader>l", ":TestLast<CR>", opts)
keymap("n", "<leader>a", ":TestSuite<CR>", opts)

-- open most recent Capybara screenshot
keymap("n", "<leader>ss", ":silent !open `ls -t tmp/screenshots/*.png | head -n1` <cr>", opts)

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files theme=get_dropdown<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep theme=get_dropdown<cr>", opts)
keymap("n", "<leader>fw", ":Telescope grep_string theme=get_dropdown<cr>", opts)
keymap("n", "<leader>b", ":Telescope buffers theme=get_dropdown<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":lua toggle_tree_and_resize()<cr>", opts)

-- formatting (with null-ls)
keymap("n", "<leader>fo", ":Format<cr>", opts)
