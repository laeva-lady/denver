vim.opt.termguicolors = true

local bufferline = require('bufferline')
bufferline.setup {
    options = {
        indicator = {
            style = "underline",
        },
        diagnostics = true,
        themable = true,
    }
}
