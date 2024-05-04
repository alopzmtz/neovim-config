return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				disable_netrw = true,
				hijack_netrw = true,
				filters = {
					git_ignored = false,
					dotfiles = false,
					custom = { "^\\.git$" },
				},

				renderer = {
					root_folder_label = false,
					indent_markers = { enable = true },
				},

				view = {
					side = "right",
					adaptive_size = true,
				},

				actions = {
					open_file = {
						quit_on_open = true,
					},
				},

				update_focused_file = {
					enable = true,
				},
			})

			local opts = { silent = true, noremap = true }
			vim.keymap.set("n", "<Leader>e", "<CMD>NvimTreeToggle<CR>", opts)
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require('neo-tree').setup({})
		end
	},
}
