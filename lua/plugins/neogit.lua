return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim"
		},
		keys = {
			{
				"<leader>gs",
				function()
					require("neogit").open()
				end,
				mode = "n",
				desc = "Open Neogit"
			}
		},
		config = function()
			local neogit = require("neogit")

			neogit.setup({
				kind = "replace"
			})
		end
	}
}
