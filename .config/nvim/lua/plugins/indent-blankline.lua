-- import indent-blankline plugin safely
local blankline_status, blankline = pcall(require, "indent_blankline")
if not blankline_status then
    return
end

-- indent-blankline setup
blankline.setup()
