return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({})
			end,
			mode = "n",
			desc = "Find Files",
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
			},
		})

		local opts = { silent = true, noremap = true }
		vim.keymap.set("n", "<Leader>fb", "<CMD>Telescope buffers<CR>", opts)
		vim.keymap.set("n", "<Leader>fg", "<CMD>Telescope live_grep<CR>", opts)
		vim.keymap.set("n", "<Leader>fh", "<CMD>Telescope help_tags<CR>", opts)
		vim.keymap.set("n", "<leader>fc", "<CMD>Telescope current_buffer_fuzzy_find<CR>", opts)
		vim.keymap.set("n", "<Leader>fa", "<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>", opts)
		--vim.keymap.set(
		--	"n",
		--	"<Leader>ff",
		--	"<CMD>Telescope find_files follow=true no_ignore=false hidden=false<CR>",
		--	opts
		--)
	end,
}
