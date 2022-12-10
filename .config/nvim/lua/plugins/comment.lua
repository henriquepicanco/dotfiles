-- import Comment plugin safely
local comment_status, comment = pcall(require, "Comment")
if not comment_status then
    return
end

-- comment setup
comment.setup({
    -- set the comment shortcut
    toggler = {
        line = "<C-_>",
        block = "<C-_>",
    },
    opleader = {
        line = "<C-_>",
        block = "<C-_>",
    },
})
