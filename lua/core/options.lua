-- local api = vim.api
local opt = vim.opt
-- local cmd = vim.cmd

-- disable nvim intro
opt.shortmess:append("sI")

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

opt.iskeyword:append("-") -- consider string-string as whole word

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.showmatch = true -- highlight matching parenthesis

-- search settings
opt.ignorecase = true -- case insensitive searching unless /C or capital in search
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true --Set highlight on search

-- Better search
opt.path:remove("/usr/include")
opt.path:append("**")
opt.wildignorecase = true

-- exclude these folders from searching
opt.wildignore:append("*/node_modules/*")
opt.wildignore:append("**/.git/*")
opt.wildignore:append("**/target/*")
opt.wildignore:append("**/classes/*")


-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom


-- Appearance
-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- turn on termguicolors
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true -- enable colors in terminal
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- Save undo history
opt.undofile = true

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.shell = "fish"

