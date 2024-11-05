return {
	"stevearc/conform.nvim",
	enabled = false,
	event = { "BufWritePre" },
	cmd = { "ConformInfo", "Format" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Prettier formats
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			javascriptreact = { "prettierd" },
		},

		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_fallback = true }
		end,

		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
