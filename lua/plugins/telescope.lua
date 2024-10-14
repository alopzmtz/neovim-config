return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
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

		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		telescope.setup({
			defaults = {
				path_display = { "filename_first" },
				-- `hidden = true` is not supported in text grep commands.
				vimgrep_arguments = vimgrep_arguments,
			},

			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},

			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdowns({}),
				},
			},
		})

		require("telescope").load_extension("ui-select")
	end,
}
