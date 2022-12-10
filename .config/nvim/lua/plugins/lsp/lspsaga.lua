-- import lspsaga plugin safely
local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status then
    return
end

lspsaga.init_lsp_saga({
    -- keybinds for navigation in lspsaga window
    move_in_saga = {
        prev = "<C-k>",
        next = "<C-j>",
    },
    -- use ENTER to open file with finder
    finder_action_keys = {
        open = "<CR>",
    },
    -- use ENTER to open file with definition preview
    definition_action_keys = {
        edit = "<CR>",
    },
})
