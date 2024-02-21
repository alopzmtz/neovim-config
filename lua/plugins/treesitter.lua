return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	event = "BufRead",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ignore_install = { "phpdoc" },

			highlight = {
				enable = true,
				additional_vim_regex_highligting = false,
			},
		})
	end,
}
