require("kate.remap")
require("kate.lazy_init")
require("kate.configs.status-bar")
require("kate.set")

local augroup = vim.api.nvim_create_augroup
local kateGroup = augroup('kate', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = kateGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- autocmd({ "BufEnter", "BufWritePost" }, {
--     group = kateGroup,
--     callback = function()
--         local hour = tonumber(os.date('%H'))
--         if hour >= 9 and hour < 22 then
--             vim.cmd.colorscheme("kanagawa-wave")
--         else
--             vim.cmd.colorscheme("kanagawa-dragon")
--         end
--     end,
-- })
vim.cmd.colorscheme("kanagawa-dragon")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25

require "kate.configs.filetypes"
require "kate.configs.tinymist"

require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/kate/snippets/" })
local ls = require("luasnip")
vim.keymap.set("i", "<C-b>", function() ls.expand_or_jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
-- map({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })

autocmd('LspAttach', {
    group = kateGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>lz", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
