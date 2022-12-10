-- import lualine plugin safely
local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
    return
end

--lualine setup
lualine.setup()
