-- import markdown-previewer plugin safely
local markdown_previewer_status, markdown_previewer = pcall(require, "markdown_previewer")
if not markdown_previewer_status then
    return
end

markdown_previewer.setup()
