require "lspconfig"["tinymist"].setup {
    settings = {
        formatterMode = "typstfmt",
        exportPdf = "onType",
        semanticTokens = "enable",
        formatterPrintWidth = 80,
        formatterProseWrap = true
    }
}
