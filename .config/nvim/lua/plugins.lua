-- ===============
-- Install plugins
-- ===============

vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

-- ==============
-- nvim-autopairs
-- ==============

require("nvim-autopairs").setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt" }
})

-- =====
-- mason
-- =====

require("mason").setup()

-- ===============
-- mason-lspconfig
-- ===============

local mason_lsp = require("mason-lspconfig")
mason_lsp.setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "astro",
    "html",
    "cssls",
    "emmet_ls"
  },
})

-- ==============
-- nvim-lspconfig
-- ==============

require("lspconfig")

for _, server in ipairs(mason_lsp.get_installed_servers()) do
  vim.lsp.config(server, {
    settings = {},
  })

  vim.lsp.enable(server)
end

-- =======
-- luasnip
-- =======

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({
  history = false,
  region_check_events = "InsertEnter",
  delete_check_events = "TextChanged"
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    if luasnip.expand_or_jumpable() then
      luasnip.unlink_current()
    end
  end,
})

-- ==========
-- blink.nvim
-- ==========

require("blink.cmp").setup({
  appearance = {
    nerd_font_variant = "mono"
  },
  completion = {
    menu = {
      draw = {
        columns = {
          { "kind_icon", "label", gap = 1 },
          { "kind" },
        },
        components = {
          kind_icon = {
            ellipsis = false,
            text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
            highlight = function(ctx) return ("BlinkCmpKind" .. ctx.kind) end,
          },
          label = {
            width = { fill = true, max = 60 },
            text = function(ctx) return ctx.label .. (ctx.label_description or "") end,
            highlight = "BlinkCmpLabel",
          },
          kind = {
            ellipsis = false,
            width = { min = 8 },
            text = function(ctx) return "[" .. ctx.kind .. "]" end,
            highlight = "BlinkCmpKind",
          },
        },
      },
    },
  },
  keymap = {
    preset = "none",
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide" },
    ["<C-j>"] = { function() luasnip.jump(1) end, "fallback" },
    ["<C-k>"] = { function() luasnip.jump(-1) end, "fallback" },
  },
  sources = {
    default = { "snippets", "lsp", "path", "buffer" },
  },
  fuzzy = {
    prebuilt_binaries = {
      download = true,
      force_version = "v*"
    }
  }
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

-- =============
-- nvim-snippets
-- =============

--require("snippets").setup({
--  friendly_snippets = true
--})
