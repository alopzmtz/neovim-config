vim.opt.mouse = "a"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = { "120" }
vim.opt.termguicolors = true
vim.opt.isfname:append("@-@")
vim.opt.clipboard = "unnamedplus"

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
vim.opt.autoindent = true
vim.opt.smartindent = true

-- folding
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
