return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		event = "VeryLazy",
		config = function()
			local neogit = require("neogit")

			neogit.setup({})

			vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>", { noremap = true, silent = true })
		end,
	},
}
