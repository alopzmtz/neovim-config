local opts = { silent = true, noremap = true }
-- Non plugins keybind
vim.keymap.set("i", "jk", "<ESC>", opts)

vim.keymap.set("n", "<Leader>bq", "<cmd>bd!<cr>", opts)
vim.keymap.set("n", "<Leader>s", "<cmd>write!<cr>", opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
