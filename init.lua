-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("alopezmtz.lazy")

-- disable builtin plugins
vim.g.loaded_tar = 1
vim.g.loaded_zip = 1
vim.g.loaded_gzip = 1
vim.g.loaded_netrw = 1
vim.g.loaded_vimball = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_netrwFileHandlers = 1

-- options
vim.opt.mouse = "a"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true
vim.opt.isfname:append("@-@")

-- line number option
vim.opt.number = true
vim.opt.relativenumber = true

-- search options
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- indenting option
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- folding
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Non plugins keybinds
local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<Leader>q", "<CMD>bd!<CR>", opts)
vim.keymap.set("n", "<Leader>s", "<CMD>write!<CR>", opts)

vim.keymap.set("i", "jk", "<ESC>", opts)
