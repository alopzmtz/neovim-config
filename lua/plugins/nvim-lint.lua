return {
	"mfussenegger/nvim-lint",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
		}

		lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
			if diagnostic.message:find("Error: Could not find config file") then
				return nil
			end
			return diagnostic
		end)

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
