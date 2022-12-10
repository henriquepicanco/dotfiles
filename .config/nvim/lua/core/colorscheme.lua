-- set colorscheme to tokyonight with protected call
local colorscheme = "tokyonight-night"

-- if the color was not found, return nothing
local colorscheme_status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not colorscheme_status then
	return
end
