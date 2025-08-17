function _G.git_status()
    local dict = vim.b.gitsigns_status_dict
    if not dict or dict.head == '' then
        return ''
    end

    local parts = { dict.head }
    if dict.added and dict.added > 0 then
        table.insert(parts, '+' .. dict.added)
    end
    if dict.changed and dict.changed > 0 then
        table.insert(parts, '~' .. dict.changed)
    end
    if dict.removed and dict.removed > 0 then
        table.insert(parts, '-' .. dict.removed)
    end

    return table.concat(parts, ' ')
end

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
    local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if next(buf_clients) == nil then
        return "No LSP"
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
    local git = " %{v:lua.git_status()}"

    return table.concat({
        file_name,
        modified,
        file_type,
        git,
        right_align,
        diagnostics,
        lsp,
        line_no
    })
end

vim.opt.statusline = status_line()
