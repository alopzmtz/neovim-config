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
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers({})
			end,
			mode = "n",
			desc = "Find Buffers",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({})
			end,
			mode = "n",
			desc = "Find Grep",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags({})
			end,
			mode = "n",
			desc = "Find Help",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find({})
			end,
			mode = "n",
			desc = "Find Current Buffer",
		},
		{
			"<leader>fa",
			function()
				require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true })
			end,
			mode = "n",
			desc = "Find All Files",
		},
	},
	config = function()
		local telescope = require("telescope")
		local telescopeConfig = require("telescope.config")

		-- Clone the default Telescope configuration
		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},

				-- `hidden = true` is not supported in text grep commands.
				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})

		local opts = { silent = true, noremap = true }
		-- vim.keymap.set("n", "<Leader>fb", "<CMD>Telescope buffers<CR>", opts)
		-- vim.keymap.set("n", "<Leader>fg", "<CMD>Telescope live_grep<CR>", opts)
		-- vim.keymap.set("n", "<Leader>fh", "<CMD>Telescope help_tags<CR>", opts)
		-- vim.keymap.set("n", "<leader>fc", "<CMD>Telescope current_buffer_fuzzy_find<CR>", opts)
		-- vim.keymap.set("n", "<Leader>fa", "<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>", opts)
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<Leader>ff",
		-- 	"<CMD>Telescope find_files follow=true no_ignore=false hidden=false<CR>",
		-- 	opts
		-- )
	end,
}
