vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- ==============
-- nvim-autopairs
-- ==============

require("nvim-autopairs").setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt" }
})

-- ===============
-- nvim-treesitter
-- ===============

require("nvim-treesitter").install {
  "lua",
  "php",
  "astro",
  "blade",
  "html",
  "css",
  "javascript",
  "typescript",
  "json",
}

-- ========
-- gitsigns
-- ========

require("gitsigns").setup()
