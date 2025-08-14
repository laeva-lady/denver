return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
            })
            require('nvim-autopairs').remove_rule('\'')
        end,
    }
}
