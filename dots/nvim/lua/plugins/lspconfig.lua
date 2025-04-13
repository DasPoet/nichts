-- TODO: sign_define() is deprecated
vim.fn.sign_define(
    "DiagnosticSignError",
    { text = "", texthl = "DiagnosticSignError" }
)
vim.fn.sign_define(
    "DiagnosticSignWarn",
    { text = "", texthl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
    "DiagnosticSignInfo",
    { text = "", texthl = "DiagnosticSignInfo" }
)
vim.fn.sign_define(
    "DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint" }
)

local function on_attach(_, _) end

local function on_init(client, _)
    if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

local function get_capabilities()
    return require("cmp_nvim_lsp").default_capabilities()
end

return {
    "neovim/nvim-lspconfig",

    event = "BufWinEnter",
    config = function()
        local lsp_files = vim.api.nvim_get_runtime_file("lua/lsp/*.lua", true)

        local mason_lspconfig = require("mason-lspconfig")
        local lsps_to_install = {}

        for _, file in ipairs(lsp_files) do
            local lsp_name = file:match(".*[\\/](.-)%.lua$")
            table.insert(lsps_to_install, lsp_name)
        end

        mason_lspconfig.setup({ ensure_installed = lsps_to_install })

        for _, file in ipairs(lsp_files) do
            local lsp_name = file:match("([^\\/]+)%.%w+$")

            local opts = require("lsp." .. lsp_name)
            opts.capabilities = get_capabilities()

            local overriden_on_attach = opts.on_attach
            opts.on_attach = function(client, bufnr)
                on_attach(client, bufnr)
                if overriden_on_attach then
                    overriden_on_attach(client, bufnr)
                end
            end

            local overriden_on_init = opts.on_init
            opts.on_init = function(client, result)
                on_init(client, result)
                if overriden_on_init then
                    overriden_on_init(client, result)
                end
            end

            require("lspconfig")[lsp_name].setup(require("lsp." .. lsp_name))
        end
    end,

    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim"
    }
}
