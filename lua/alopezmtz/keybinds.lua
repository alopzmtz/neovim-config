
local opts = { silent = true, noremap = true }
-- Non plugins keybind
vim.keymap.set("i", "jk", "<ESC>", opts)

vim.keymap.set("n", "<Leader>bq", "<CMD>bd!<CR>", opts)
vim.keymap.set("n", "<Leader>s", "<CMD>write!<CR>", opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
