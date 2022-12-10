-- import toggleterm plugin safely
local toggleterm_status, toggleterm = pcall(require, "toggleterm")
if not toggleterm_status then
    return
end

-- settings termtoggle
toggleterm.setup({
    open_mapping = [[<C-\>]],
})

-- require some termtoggle configurations
local Terminal = require("toggleterm.terminal").Terminal

-- customizations for lazygit
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

-- customizations for node
local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
    node:toggle()
end

-- customizations for htop
local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
    htop:toggle()
end
