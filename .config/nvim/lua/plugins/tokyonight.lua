local tokyonight_status, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status then
	return
end

tokyonight.setup({
	transparent = true,
})
