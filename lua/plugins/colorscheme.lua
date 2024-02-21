return {
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		priority = 1000,
		config = function()
			require('dracula').setup({
				colors = {
					bg = "#22212C",
					fg = "#F8F8F2",
					selection = "#414D58",
					comment = "#708CA9",

					red = "#FF9580",
					orange = "#FFCA80",
					yellow = "#FFFF80",
					green = "#8AFF80",
					purple = "#9580FF",
					cyan = "#80FFEA",
					pink = "#FF80BF",

					bright_red = "#FF6E6E",
					bright_yellow = "#FFFFA5",
					bright_blue = "#D6ACFF",
					bright_magenta = "#FF92DF",
					bright_cyan = "#A4FFFF",
					bright_white = "#FFFFFF",
					bright_green = "#69FF94",

					menu = "#21222C",
					visual = "#3E4452",
					gutter_fg = "#4B5263",
					nontext = "#3B4048",
					white = "#F8F8F2",
					black = "#191A21",
				},

				show_end_of_buffer = true,
				transparent_bg = true,
				lualine_bg_color = "#22212C"
			})

			vim.cmd.colorscheme('dracula')
		end
	}
}
