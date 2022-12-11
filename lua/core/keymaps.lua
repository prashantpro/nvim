local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

local g = vim.g
local keymap = vim.keymap.set

-- Remap leader and local leader to <Space>
keymap("", "<Space>", "<Nop>", default_opts)
g.mapleader = " "
g.maplocalleader = ","

-- Better j, k movement within line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Stay in visual mode while indenting
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)
keymap("v", "<Tab>", ">gv", default_opts)
keymap("v", "<S-Tab>", "<gv", default_opts)

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv=gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv=gv", default_opts)

-- Window movement
keymap("n", "<c-h>", "<c-w>h", default_opts)
keymap("n", "<c-j>", "<c-w>j", default_opts)
keymap("n", "<c-k>", "<c-w>k", default_opts)
keymap("n", "<c-l>", "<c-w>l", default_opts)

-- Better navigation in terminal mode
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", default_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", default_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", default_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", default_opts)

-- Tab navigation
keymap("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Save & Quit
keymap("i", "<C-s>", "<Esc>:w<cr>", default_opts) -- This maps the 'crtl + s ' to save the file
keymap("i", "<C-q>", "<Esc>:q<cr>", default_opts) -- This maps the 'crtl + q ' to quit

keymap("n", "<leader>w", ":w<CR>", default_opts) -- fast file saving
keymap("n", "<leader>q", ":q<CR>", default_opts) -- fast neovim quit

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- File Explorer using nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>") --  nvim-tree toggle

-- Buffers with bufferline
keymap("n", "<C-[>", "<Cmd>BufferLineCyclePrev<CR>") --  Prev Buffer
keymap("n", "<C-]>", "<Cmd>BufferLineCycleNext<CR>") --  Next Buffer
keymap("n", "<C-w>", ":Bdelete<CR>") --  Delete current buffer from bufdelete.nvim

-- Delete a buffer (no plugin), without closing the window, see https://stackoverflow.com/q/4465095/6064933
-- keymap("n", "<C-w>", "<Cmd>bprevious <bar> bdelete #<CR>", default_opts)

-- Telescope
keymap("n", "<c-p>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap("n", "<leader>km", "<cmd>Telescope keymaps<cr>") -- list available keymaps

-- telescope git commands
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
