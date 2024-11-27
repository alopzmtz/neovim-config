vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = function()
        vim.opt.guicursor = ""
        vim.fn.chansend(vim.v.stderr, "\x1b[ q")
    end,
})
