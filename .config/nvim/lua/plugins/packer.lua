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

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
