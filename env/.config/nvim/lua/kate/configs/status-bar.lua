-- Put the functions in the global namespace so statusline can call them
function _G.lsp_diagnostics()
    local bufnr    = vim.api.nvim_get_current_buf()

    local errors   = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
    local warnings = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
    local hints    = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })
    local info     = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })

    local parts    = {}
    if errors > 0 then table.insert(parts, "E:" .. errors) end
    if warnings > 0 then table.insert(parts, "W:" .. warnings) end
    if hints > 0 then table.insert(parts, "H:" .. hints) end
    if info > 0 then table.insert(parts, "I:" .. info) end

    return table.concat(parts, " ")
end

function _G.lsp_status()
    local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
    if next(buf_clients) == nil then
        return ""
    end

    local names = {}
    for _, client in pairs(buf_clients) do
        table.insert(names, client.name)
    end

    return "[" .. table.concat(names, ",") .. "]"
end

local function status_line()
    local file_name = " [%-.16t]"
    local modified = " %-m"
    local file_type = " %y"
    local diagnostics = " %{v:lua.lsp_diagnostics()}"
    local lsp = " %{v:lua.lsp_status()}"
    local right_align = "%="
    local line_no = "%10([%l/%L%)]"

    return table.concat({
        file_name,
        modified,
        file_type,
        right_align,
        diagnostics,
        lsp,
        line_no
    })
end

vim.opt.statusline = status_line()
