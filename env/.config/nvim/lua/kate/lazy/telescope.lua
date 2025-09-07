return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('v', '<leader>pws', function()
            -- save current register
            local save_reg = vim.fn.getreg('"')
            local save_type = vim.fn.getregtype('"')

            -- yank visual selection into " register
            vim.cmd('normal! ""y')

            -- get yanked text
            local selection = vim.fn.getreg('"')

            -- restore register
            vim.fn.setreg('"', save_reg, save_type)

            require('telescope.builtin').grep_string({ search = selection })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<C-b>', builtin.buffers, {})
    end
}
