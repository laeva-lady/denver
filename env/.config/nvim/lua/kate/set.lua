vim.opt.winborder = "single"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

local useTabs = true
if (useTabs) then
	vim.opt.softtabstop = nil
	vim.opt.expandtab = false
else
	vim.opt.softtabstop = 4
	vim.opt.expandtab = true
end

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
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
