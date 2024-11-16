return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = true,
	},
	{
		"tpope/vim-sleuth",
		event = "VeryLazy",
	},
	{
		"github/copilot.vim",
		event = "VeryLazy",
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
}
