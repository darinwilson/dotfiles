-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
-- DMWHACK - added theme=get_dropdown to all of these
keymap("n", "<leader>ff", ":Telescope find_files theme=get_dropdown<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep theme=get_dropdown<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects theme=get_dropdown<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers theme=get_dropdown<CR>", opts)
keymap("n", "<leader>fw", ":Telescope grep_string theme=get_dropdown<cr>", opts) -- DMWHACK

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)


-- DMWHACK - all lines from here to the end of the file
-- Saving buffers
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<esc>:w<CR>", opts)

-- Closing buffers
keymap("n", "<leader>w", ":bd<CR>", opts)
keymap("n", "<leader>W", ":bufdo bd<CR>", opts)

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

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
keymap("n", "<leader>fw", ":Telescope grep_string theme=get_dropdown<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":lua toggle_tree_and_resize()<cr>", opts)

-- formatting (with null-ls)
keymap("n", "<leader>fo", ":Format<cr>", opts)

-- toggle indent lines
keymap("n", "<leader>il", ":IndentBlanklineToggle<cr>", opts)

