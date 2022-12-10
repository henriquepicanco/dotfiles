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
    -- packer.nvim
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- plenary.nvim
    -- lua functions require by many other plugins
    use("nvim-lua/plenary.nvim")

    -- tokyonight.nvim
    -- dark and light neovim theme ported from TokyoNight from Visual Studio Code
    use("folke/tokyonight.nvim")

    -- vim maximizer
    -- maximiez and restores current window
    use("szw/vim-maximizer")

    -- Comment.nvim
    -- commenting plugin for Neovim
    use("numToStr/Comment.nvim")

    -- Lualine
    -- blazing fast and easy to configure statusline written in lua
    use("nvim-lualine/lualine.nvim")
    
    -- Telescope
    -- extendable fuzzy finder over lists
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")

    -- nvim-web-icons
    -- a fork fo vim-devicons in lua - provides the same icons and colors for each icon
    use("nvim-tree/nvim-web-devicons")

    -- CMP
    -- this will provide autocompletion
    use("hrsh7th/nvim-cmp")

    -- allow CMP recommend different directories for files
    use("hrsh7th/cmp-path")

    -- allow CMP recommend text from the current buffer
    use("hrsh7th/cmp-buffer")

    -- LuaSnip
    -- snippets engine written entirely in lua
    use("L3MON4D3/LuaSnip")
    
    -- allow nvim-cmp to show snippets in autocompletion
    use("saadparwaiz1/cmp_luasnip")

    -- collection of useful snippets from different languages
    use("rafamadriz/friendly-snippets")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
