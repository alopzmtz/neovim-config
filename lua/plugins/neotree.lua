return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neotree = require("neo-tree")

		neotree.setup({
			window = {
				position = "current",
				auto_expand_width = true,
			},

			filesystem = {
				filtered_items = {
					hide_gitignored = true,
					hide_dotfiles = true,
					hide_by_name = { "node_modules" },
					always_show = {
						".gitignore",
					},
					always_show_by_pattern = {
						".prettier*",
						".eslint*",
						".env*",
					},
					never_show = {
						".git",
					},
				},
			},

			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.cmd("highlight! Cursor blend=100")
					end,
				},
				{
					event = "neo_tree_buffer_leave",
					handler = function()
						vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
					end,
				},
			},
		})

		vim.keymap.set("n", "<Leader>e", "<CMD>Neotree toggle<CR>", { silent = true, noremap = true })
	end,
}

--{
--	"nvim-tree/nvim-tree.lua",
--	version = "*",
--	lazy = false,
--	dependencies = { "nvim-tree/nvim-web-devicons" },
--	config = function()
--		require("nvim-tree").setup({
--			disable_netrw = true,
--			hijack_netrw = true,
--			filters = {
--				git_ignored = false,
--				dotfiles = false,
--				custom = { "^\\.git$" },
--			},

--			renderer = {
--				root_folder_label = false,
--				indent_markers = { enable = true },
--			},

--			view = {
--				side = "right",
--				adaptive_size = true,
--			},

--			actions = {
--				open_file = {
--					quit_on_open = true,
--				},
--			},

--			update_focused_file = {
--				enable = true,
--			},
--		})

--		local opts = { silent = true, noremap = true }
--		vim.keymap.set("n", "<Leader>e", "<CMD>NvimTreeToggle<CR>", opts)
--	end,
--},
