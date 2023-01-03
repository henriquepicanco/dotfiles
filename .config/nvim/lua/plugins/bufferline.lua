-- import bufferline plugin safely
local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
	return
end

-- bufferline setup
bufferline.setup({
	options = {
		mode = "tabs", -- set bufferline mode
		show_buffer_close_icons = false, -- don't show close button
		show_close_icon = false, -- don't show close icon
		color_icons = true,
	},
})
