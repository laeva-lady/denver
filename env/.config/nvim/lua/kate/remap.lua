vim.g.mapleader = " "
local set = vim.keymap.set

set("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
set("n", "<C-y>", "<cmd>silent !tmux neww yazi-tmux<CR>")

set("n", "<leader>pv", ":NvimTreeToggle<CR>")
set("n", "<leader>e", ":NvimTreeFocus<CR>")

set({ "n", "v" }, ";", ":")
set({ "n", "v" }, "!", ":!")

set({ "n" }, "<leader>t", "i<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR><Esc>")

set({ "n", "v", "i" }, "<C-s>", "<ESC>:w<CR>")

-- set("i", "<C-u>", "<Esc>")

set("n", "<C-f>", ":Files<CR>", { desc = "Open fzf" })
set("n", "<leader>f", vim.lsp.buf.format, { desc = "format" })

set("n", "<C-m>", ":bnext<CR>")
set("n", "<C-k>", ":bprev<CR>")
set("n", "<C-c>", ":bdelete<CR>")

set("n", "<C-o>", "<nop>")

-- set("n", "<leader>\\", ":ToggleTerm<CR>")

-- set("n", "<leader>mv", ":Markview<CR>")

-- commands related to functions
--
local function removeRN()
	vim.cmd([[%s/\r//g]])
end
local function selectALL()
	vim.cmd([[normal! ggVG]])
end
set("n", "<leader>re", removeRN)
set("n", "<leader>sa", selectALL)

set("n", "<leader>spq", "vapgq")

set("n", "<leader>k", ":make<CR>")


set("n", "<leader>ch", ":e ~/documents/chat.md<CR>")

