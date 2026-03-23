return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("clangd", {
                cmd = { "clangd", "--background-index", "--clang-tidy" },
                filetypes = { "c", "cpp" },
            })
            vim.lsp.enable("clangd")
        end
    }
}
