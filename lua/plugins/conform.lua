return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	enabled = false,
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},
	config = function()
		vim.g.disable_autoformat = true

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
			init = function()
				-- If you want the formatexpr, here is the place to set it
				vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			end,
		})
	end,
}
