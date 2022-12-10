-- import nvim-treesitter plugin safely
local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
    return
end

-- configure treesitter
treesitter.setup({
    -- enable syntax highlighting
    highlight = { enable = true },
    -- enable indentation
    indent = { enable = true },
    -- enable autotatting (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- enable autopairs
    autopairs = { enable = true },
    -- enable rainbow parenthesis
    rainbow = { enable = true },
    -- enable comments
    conext_commentstring = {
        enable = true, -- enable the plugin
        enable_autocmd = true, -- redefine colors on colorscheme change
    },
    -- ensure theme language parsers are installed
    ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
    },
    -- auto install above language parsers
    auto_install = true,
})
