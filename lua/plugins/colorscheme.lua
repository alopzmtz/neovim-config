return {
	"Mofiqul/dracula.nvim",
	config = function()
		local dracula = require("dracula")

		dracula.setup({
			-- transparent_bg = true, -- Enable this if you want transparent background
			-- show_end_of_buffer = true, -- Show EndOfBuffer symbol
			-- use_italic = true, -- Enable italics for comments and keywords

			-- Refer to the new color palette ("pro")
			colors = {
				-- Base colors from 'pro -> base' and 'pro -> ansi'
				bg = '#22212C',        -- &Background / Background
				fg = '#F8F8F2',        -- &Foreground / Foreground
				selection = '#454158', -- &Selection / Selection
				comment = '#7970A9',   -- &Comment / Comments (&AnsiColor8 / Dark gray)
				red = '#FF9580',       -- &Red / Red (&AnsiColor1 / Red)
				orange = '#FFCA80',    -- &Orange / Orange
				yellow = '#FFFF80',    -- &Yellow / Yellow (&AnsiColor3 / Yellow)
				green = '#8AFF80',     -- &Green / Green (&AnsiColor2 / Green)
				purple = '#9580FF',    -- &Purple / Purple (&AnsiColor4 / Purple)
				cyan = '#80FFEA',      -- &Cyan / Cyan (&AnsiColor6 / Cyan)
				pink = '#FF80BF',      -- &Pink / Pink (&AnsiColor5 / Pink)

				-- Bright colors mapped from 'pro -> ansi' light colors
				bright_red = '#FFBFB3',     -- &AnsiColor9 / Light red
				bright_green = '#B9FFB3',   -- &AnsiColor10 / Light green
				bright_yellow = '#FFFFB3',  -- &AnsiColor11 / Light yellow
				bright_blue = '#BFB3FF',    -- &AnsiColor12 / Light purple (Mapped from blue)
				bright_magenta = '#FFB3D9', -- &AnsiColor13 / Light pink (Mapped from magenta)
				bright_cyan = '#B3FFF2',    -- &AnsiColor14 / Light cyan
				bright_white = '#FFFFFF',   -- &AnsiColor15 / White (&WhiteColor)

				-- UI Elements mapping (using best matches from 'pro')
				menu = '#21222C',      -- &AnsiColor0 / Black (Often used for menus/popups)
				visual = '#454158',    -- &Selection (Often used for visual selection bg)
				gutter_fg = '#7970A9', -- &Comment / &AnsiColor8 (Used for line number foreground)
				nontext = '#373252',   -- &NonTextCharacterColor / Invisible (Like EOF markers)
				white = '#F8F8F2',     -- &Foreground / &AnsiColor7 (General light text/UI elements)
				black = '#21222C',     -- &AnsiColor0 / Black (Terminal black)

				-- Note: Some original keys like 'line_highlight' aren't standard in dracula.nvim's direct 'colors' override.
				-- However, dracula.nvim might use these base colors to derive other highlight groups.
				-- The 'pro' scheme also includes 'functionalColors' and more 'uiElements' which don't have direct 1:1 keys
				-- in this basic override structure but influence the overall theme generation within the plugin.
			},

			-- You can also override specific highlight groups if needed
			-- overrides = {
			--   LineNr = { fg = dracula.colors.comment }, -- Example: Make line numbers use the comment color
			--   CursorLine = { bg = '#323040' }, -- Example: Use &LineHighlightColor from 'pro'
			--   -- Add more overrides here as needed
			-- }
		})

		vim.cmd("colorscheme dracula")
	end
}
