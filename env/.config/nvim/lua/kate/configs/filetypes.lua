vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fs", "fsharp" },
    callback = function()
        vim.lsp.handlers["$/progress"] = function() end
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "haskell", "hs", "ocaml", "cpp", "cc" }, -- or any filetype
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html" }, -- or any filetype
    callback = function()
        vim.bo.smartindent = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typst", "md", "markdown" },
    callback = function()
        vim.opt.spell = true
        vim.opt.spelllang = { "en", "fr", "cjk" }

        vim.opt.linebreak = true
        vim.opt.textwidth = 120
        vim.opt.formatoptions:append("t")
    end
})
