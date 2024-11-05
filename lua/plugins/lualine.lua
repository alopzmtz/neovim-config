return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename", "lsp_progress" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},

			extensions = {
				"neo-tree",
				"nvim-tree",
				"fugitive",
				"mason",
				"lazy",
			},
		})
	end,
}
