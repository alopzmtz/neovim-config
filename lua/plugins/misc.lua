return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
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
}
