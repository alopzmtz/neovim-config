local opts = { silent = true, noremap = true }
local cmd = vim.cmd

local function map(mode, lhs, rhs, user_opts)
	local options = vim.tbl_extend("force", opts, user_opts or {})
	vim.keymap.set(mode, lhs, rhs, options)
end

------------------------------------------------------------------------------------------
---------------------------------- PLUGINS GENERALES -------------------------------------
------------------------------------------------------------------------------------------

-- Keybinds generales
map("i", "jk", "<ESC>")

map("n", "<leader>bq", "<cmd>bd!<cr>", { desc = "Cerrar buffer actual" })
map("n", "<leader>s", "<cmd>write!<cr>", { desc = "Guardar archivo" })
map("n", "<leader>q", "<cmd>quitall!<cr>", { desc = "Salir de Neovim" })

-- Movimiento vertical
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Utilidades de portapapeles
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copiar al portapapeles del sistema" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Pegar desde el portapapeles del sistema" })

-- Búsqueda
map("n", "<Leader>h", "<cmd>nohlsearch<CR>", { desc = "Quitar resaltado de búsqueda" })
map("n", "n", "nzzzv", { desc = "Siguiente resultado de búsqueda y centrar" })
map("n", "N", "Nzzzv", { desc = "Resultado de búsqueda anterior y centrar" })

------------------------------------------------------------------------------------------
----------------------------------- PLUGINS KEYMAPS --------------------------------------
------------------------------------------------------------------------------------------

-- Vim Tmux Navigator
map("n", "<C-h>", cmd.TmuxNavigateLeft, { desc = "Moverse a la ventana de la izquierda" })
map("n", "<C-j>", cmd.TmuxNavigateDown, { desc = "Moverse a la ventana de abajo" })
map("n", "<C-k>", cmd.TmuxNavigateUp, { desc = "Moverse a la ventana de arriba" })
map("n", "<C-l>", cmd.TmuxNavigateRight, { desc = "Moverse a la ventana de la derecha" })
map("n", "<C-\\>", cmd.TmuxNavigatePrevious, { desc = "Moverse a la ventana anterior" })

-- Neogit
map("n", "<leader>gs", cmd.Neogit, { desc = "Abrir Neogit" })

-- Undotree
map("n", "<leader>u", cmd.UndotreeToggle, { desc = "Abrir Undotree" })

-- Telescope
map("n", "<leader>ff", function()
	require("telescope.builtin").find_files({})
end, { desc = "Find Files" })

map("n", "<leader>fb", function()
	require("telescope.builtin").buffers({})
end, { desc = "Find Buffers" })

map("n", "<leader>fg", function()
	require("telescope.builtin").live_grep({})
end, { desc = "Find Grep" })

map("n", "<leader>fh", function()
	require("telescope.builtin").help_tags({})
end, { desc = "Find Help" })

map("n", "<leader>fc", function()
	require("telescope.builtin").current_buffer_fuzzy_find({})
end, { desc = "Find Current Buffer" })

map("n", "<leader>fa", function()
	require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true })
end, { desc = "Find All Files" })
