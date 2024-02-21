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
vim.opt.signcolumn = "auto"
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

-- keybinds
local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<Leader>q", "<CMD>bd!<CR>", opts)
vim.keymap.set("n", "<Leader>w", "<CMD>write!<CR>", opts)
vim.keymap.set("n", "<Leader>e", "<CMD>NvimTreeToggle<CR>", opts)

vim.keymap.set("n", "<Leader>fb", "<CMD>Telescope buffers<CR>", opts)
vim.keymap.set("n", "<Leader>fg", "<CMD>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<Leader>fh", "<CMD>Telescope help_tags<CR>", opts)
vim.keymap.set("n", "<leader>fc", "<CMD>Telescope current_buffer_fuzzy_find<CR>", opts)
vim.keymap.set("n", "<Leader>fa", "<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>", opts)
vim.keymap.set("n", "<Leader>ff", "<CMD>Telescope find_files follow=true no_ignore=false hidden=true<CR>", opts)

vim.keymap.set("i", "jk", "<ESC>", opts)
