-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

------------------------------
-- General Keymaps
------------------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- change paste behaviour
keymap.set("n", "p", '"_dP')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- window navigation
keymap.set("n", "<C-Up>", ":resize +2<CR>") -- resize window with +2 in size
keymap.set("n", "<C-Down>", ":resize -2<CR>") -- resize window with -2 in size
keymap.set("n", "<C-Left>", ":vertical resize +2<CR>") -- resize window with +2 in size vertically
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>") -- resize window with -2 in size vertically

-- stay in indent mode
keymap.set("v", "<", "<gv") -- set indentation to the left at the selected text
keymap.set("v", ">", ">gv") -- set indentation to the right at the selected text

-- move a line up or down in visual block mode
keymap.set("x", "J", ":move '>+1<CR>gv-gv") -- move the actual selection to the one line above
keymap.set("x", "K", ":move '<+2<CR>gv-gv") -- move the actual selection to the one line bottom
-- keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
-- keymap.set("x", "<A-k>", ":move '<+2<CR>gv-gv")

------------------------------
-- Plugin keybinds
------------------------------

-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- restart LSP servers
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapdding to restart lsp if necessary

-- tabs
keymap.set("n", "<leader>tn", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tc", ":bdelete<CR>") -- close current tab

-- toggleterm
keymap.set("t", "<ESC>", [[<C-\><C-n>]]) -- exit terminal mode in terminal window
keymap.set("t", "jk", [[<C-\><C-n>]]) -- exit terminal mode in terminal window
keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]]) -- change to terminal or buffer at left
keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]]) -- change to terminal or buffer at bottom
keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]]) -- change to terminal or buffer at top
keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]]) -- change to terminal or buffer at right

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- open and close nvim-tree
