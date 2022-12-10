local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing Packer -- Close and reopen Neovim to proceed")
    vim.cmd([[packeradd packer.nvim]])
end

-- Autocommand that reload Neovim whenever you save the packer.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

local packer_status = pcall(require, "packer")
if not packer_status then
    print("Packer is not installed")
    return
end

return require("packer").startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim") -- Packer can manage itself

    -- Plenary
    use("nvim-lua/plenary.nvim") -- lua functions require by many other plugins

    -- Colorschemes
    use("folke/tokyonight.nvim") -- dark and light neovim theme ported from TokyoNight from Visual Studio Code

    -- vim maximizer
    use("szw/vim-maximizer") -- maximizes and restores current window

    -- Comment.nvim
    use("numToStr/Comment.nvim") -- commenting plugin for Neovim

    -- Lualine
    use("nvim-lualine/lualine.nvim") -- blazing fast and easy to configure statusline written in lua
    
    -- Telescope
    -- Attention: installation of ripgrep is required!
    -- In Ubuntu, run the following command: $ sudo apt install ripgrep
    use("nvim-telescope/telescope.nvim") -- extendable fuzzy finder over lists
    use("nvim-telescope/telescope-file-browser.nvim") -- extension to see files and folder on Telescope
    use("nvim-tree/nvim-web-devicons") -- a fork fo vim-devicons in lua - provides the same icons and colors for each icon

    -- CMP
    use("hrsh7th/nvim-cmp") -- this will provide autocompletion
    use("hrsh7th/cmp-path") -- allow CMP recommend different directories for files
    use("hrsh7th/cmp-buffer") -- allow CMP recommend text from the current buffer
    use("L3MON4D3/LuaSnip") -- snippets engine written entirely in lua
    use("saadparwaiz1/cmp_luasnip") -- allow nvim-cmp to show snippets in autocompletion
    use("rafamadriz/friendly-snippets") -- collection of useful snippets from different languages

    -- Mason
    use("williamboman/mason.nvim") -- managing and installing LSP servers, linters and formatters
    use("williamboman/mason-lspconfig.nvim") -- close some gaps between mason.nvim and lspconfig
    use("hrsh7th/cmp-nvim-lsp") -- allow configure LSP servers
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced UI to LSP experience
    use("jose-elias-alvarez/typescript.nvim") -- further functionality to TypeScript server
    use("onsails/lspkind.nvim") -- add VSCode icons to autompletion window
    use("jose-elias-alvarez/null-ls.nvim") -- formatting and linting
    use("jayp0521/mason-null-ls.nvim") -- formatting and linting

    -- Treesitter
    -- Attention: installation of a C compiler is required!
    -- In Ubuntu, run the following command: ``$ sudo apt install g++``
    -- for the configurations of this repository, it's also need to install "tree-sitter-cli" via NPM
    -- to install, use ``$ npm install tree-sitter-cli``
    use({ "nvim-treesitter/nvim-treesitter", run = function() require("nvim-treesitter.install").update({ with_sync = true }) end }) -- tree-sitter interface and basic functionality
    use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }) -- rainbow parentheses using tree-sitter
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- use treesitter to autoclose and autorename HTML tags
    use({ "windwp/nvim-autopairs", after = "nvim-treesitter" }) -- powerful autopair plguin for neovim thar supports multiple characters

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
