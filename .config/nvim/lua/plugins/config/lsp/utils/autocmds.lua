local M = {}

M.DocumentHighlightAU = function()
    local group = vim.api.nvim_create_augroup("DocumentHighlight", {})
    vim.api.nvim_create_autocmd("CursorHold", {
        group = group,
        buffer = 0,
        callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
        group = group,
        buffer = 0,
        callback = vim.lsp.buf.clear_references,
    })
end

M.SemanticTokensAU = function()
    local group = vim.api.nvim_create_augroup("SemanticTokens", {})
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
        group = group,
        buffer = 0,
        callback = vim.lsp.buf.semantic_tokens_full,
    })
end

M.DocumentFormattingAU = function()
    local group = vim.api.nvim_create_augroup("Formatting", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = 0,
        callback = function()
            if vim.g.format_on_save then
                vim.lsp.buf.format { timeout_ms = 3000 }
            end
        end,
    })
end

M.InlayHintsAU = function()
    require("lsp.inlay_hints").setup_autocmd()
end

return M
