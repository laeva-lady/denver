return {
    {
        'chomosuke/typst-preview.nvim',
        ft = 'typst',
        -- version = '1.*',
        opts = {
            open_cmd = "firefox %s > /dev/null 2>&1 &",
            port = 33000,
            follow_cursor = true,
        },
    }
}
