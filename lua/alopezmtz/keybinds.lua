
local opts = { silent = true, noremap = true }
-- Non plugins keybind
vim.keymap.set("i", "jk", "<ESC>", opts)

vim.keymap.set("n", "<Leader>bq", "<CMD>bd!<CR>", opts)
vim.keymap.set("n", "<Leader>s", "<CMD>write!<CR>", opts)
