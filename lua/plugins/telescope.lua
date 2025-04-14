return {
	{
		"nvim-telescope/telescope.nvim",
		branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "filename_first" },
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/",
					},
					file_ignore_patterns = {
						"node_modules",
						".git",
						".cache",
						"%.o",
						"%.a",
						"%.out",
						"%.class",
						"%.pdf",
						"%.mkv",
						"%.mp4",
						"%.zip",
					},
					mappings = {
						i = {
							["<esc>"] = actions.close,
							["<C-u>"] = false,
						},
					},
				},
				pickers = {
					find_files = {
						find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" },
						follow = true,
					},
					live_grep = {
						additional_args = function()
							return { "--hidden" }
						end,
					},
				},
			})
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "VeryLazy",
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("ui-select")
		end,
	},

	-- Deps
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		event = "VeryLazy",
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("fzf")
		end
	}
}
