require"kate.configs.filetypes"

require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/kate/snippets/" })
local ls = require("luasnip")
vim.keymap.set("i", "<C-b>", function() ls.expand_or_jump(1) end, { silent = true })
-- map({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
-- map({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })


vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.winborder = "rounded"

vim.opt.smartindent = true
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html" }, -- or any filetype
    callback = function()
        vim.bo.smartindent = false
    end,
})

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "{,}"
vim.opt.foldlevelstart = 99

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"


vim.opt.list = true
vim.opt.listchars:append("space:·")

vim.opt.ignorecase = true
vim.opt.smartcase = true
