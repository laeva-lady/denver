require "lspconfig"["tinymist"].setup {
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onType",
        semanticTokens = "enable",
        formatterPrintWidth = 80,
        formatterProseWrap = true
    }
}
