return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    opts = {
        ensure_installed = { 'rust', 'lua', 'typescript', 'javascript', 'tsx', 'go', 'python', 'json', 'yaml', 'terraform', 'html', 'css', 'toml', 'markdown', 'query', 'vim', 'vimdoc', 'java' },
        highlight = {
            enable = true,
            disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                node_incremental = 'v',
                node_decremental = 'V',
            },
        },
        indent = { enable = true },
        autotag = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
    },
    build = ':TSUpdate',
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
        vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            {
                underline = true,
                virtual_text = {
                    spacing = 5,
                    min = "severity"
                },
                update_in_insert = true,
            }
        )
    end
}
