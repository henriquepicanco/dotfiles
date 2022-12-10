-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
    -- list of servers for mason to install
    ensure_installed = {
        "html",
        "cssls",
        "quick_lint_js",
        "tailwindcss",
        "tsserver",
        "sumneko_lua",
        "emmet_ls",
    },
})

mason_null_ls.setup({
    -- list of formatters and linters for mason to install
    ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
    },
})
