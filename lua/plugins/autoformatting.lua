return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvimtools/none-ls-extras.nvim',
        'jayp0521/mason-null-ls.nvim',
    },
    config = function()
        local none_ls = require("null-ls")
        local mason_null_ls = require("mason-null-ls")

        -- Configuração de null-ls
        none_ls.setup({
            sources = {
                none_ls.builtins.formatting.stylua, -- Lua
                none_ls.builtins.formatting.prettier, -- JS, HTML, CSS
                none_ls.builtins.formatting.black, -- Python
                none_ls.builtins.formatting.goimports, -- Go
                none_ls.builtins.formatting.shfmt, -- Shell scripts
                none_ls.builtins.formatting.clang_format, -- C, C++
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })

        -- Configuração de mason-null-ls
        mason_null_ls.setup({
            ensure_installed = {
                "stylua", "prettier", "black", "goimports", "shfmt", "clang-format"
            },
            automatic_installation = true,
        })
    end,
}

