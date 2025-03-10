return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		cmd = "Neogit",
		config = function()
			local neogit = require("neogit")
			neogit.setup({
				kind = "split",
			})
		end,
	},
}
