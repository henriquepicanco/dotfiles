local options = {
  backup = false,
  clipboard = "unnamedplus",
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "UTF-8",
  hlsearch = true,
  mouse = "",
  pumheight = 10,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 300,
  undofile = true,
  updatetime = 300,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  numberwidth = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  signcolumn = "yes",
  wrap = true,
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h17",
  whichwrap = "bs<>[]hl"
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.opt.shortmess:append "c"
vim.opt.iskeyword:append "-"
vim.opt.formatoptions:remove({ "c", "r", "o" })

vim.g.maploader = " "
vim.g.maplocalleader = " "

